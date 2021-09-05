# module Lupin

# code from julia/base/namedtuple.jl
#           julia/base/abstractdict.jl

if VERSION >= v"1.5.0-DEV.182"
import Base: mergewith
end
using Base: Callable, merge_names, merge_types, sym_in

function mergewith(combine::Callable, nt::NamedTuple, others::NamedTuple...)
    foldl(mergewith(combine), others; init = nt)
end

function mergewith(combine::Callable, a::NamedTuple{an}, b::NamedTuple{bn}) where {an, bn}
    names = merge_names(an, bn)
    types = collect(fieldtypes(merge_types(names, typeof(a), typeof(b))))
    values = @inbounds map(enumerate(names)) do (idx, n)
            if sym_in(n, bn)
                if sym_in(n, an)
                    value = combine(getfield(a, n), getfield(b, n))
                    typ = types[idx]
                    if typ !== typeof(value)
                        types[idx] = promote_type(typ, typeof(value))
                    end
                    value
                else
                    getfield(b, n)
                end
            else
                getfield(a, n)
            end
        end
    NamedTuple{names, Tuple{types...}}(values)
end

if VERSION < v"1.5.0-DEV.182"
    mergewith(combine::Callable) = (args::NamedTuple...) -> mergewith(combine, args...)
    export mergewith
end

# module Lupin
