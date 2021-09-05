# module Lupin

# code from julia/base/namedtuple.jl
using Base: Callable, merge_names, merge_types, sym_in

function mergewith_namedtuples(combine::Callable, a::NamedTuple, b::NamedTuple, cs::NamedTuple...)
    mergewith_namedtuples(combine, mergewith_namedtuples(combine, a, b), cs...)
end

function mergewith_namedtuples(combine::Callable, a::NamedTuple{an}, b::NamedTuple{bn}) where {an, bn}
    names = merge_names(an, bn)
    types = collect(fieldtypes(merge_types(names, typeof(a), typeof(b))))
    values = map(enumerate(names)) do (idx, n)
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

if VERSION >= v"1.5.0-DEV.182"
    function Base.mergewith(combine::Callable, nt::NamedTuple, others::NamedTuple...)
        mergewith_namedtuples(combine, nt, others...)
    end
else
    export mergewith
    mergewith = mergewith_namedtuples
end

# module Lupin
