# module Lupin

using Base: merge_names, merge_types, sym_in

mergewith_namedtuples(combine::Function, a::NamedTuple, b::NamedTuple, cs::NamedTuple...) = mergewith_namedtuples(combine, mergewith_namedtuples(combine, a, b), cs...)

function mergewith_namedtuples(combine::Function, a::NamedTuple{an}, b::NamedTuple{bn}) where {an, bn}
    names = merge_names(an, bn)
    types = merge_types(names, typeof(a), typeof(b))
    NamedTuple{names, types}(map(names) do n
            if sym_in(n, bn)
                if sym_in(n, an)
                    combine(getfield(a, n), getfield(b, n))
                else
                    getfield(b, n)
                end
            else
                getfield(a, n)
            end
        end)
end

if VERSION >= v"1.5.0-DEV.182"
    function Base.mergewith(combine::Function, nt::NamedTuple, others::NamedTuple...)
        mergewith_namedtuples(combine, nt, others...)
    end
else
    export mergewith
    mergewith = mergewith_namedtuples
end

# module Lupin
