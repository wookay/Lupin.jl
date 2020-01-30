# module Lupin

function mergewith_namedtuples(combine::Function, nt::NamedTuple, others::NamedTuple...)
    for other in others
        for (k,v) in pairs(other)
            nt = merge(nt, (; k => haskey(nt, k) ? combine(nt[k], v) : v))
        end
    end
    return nt
end

using Jive
@If VERSION >= v"1.5.0-DEV.182" function Base.mergewith(combine::Function, nt::NamedTuple, others::NamedTuple...)
    mergewith_namedtuples(combine, nt, others...)
end

@If VERSION < v"1.5.0-DEV.182" begin
export mergewith
mergewith = mergewith_namedtuples
end

# module Lupin
