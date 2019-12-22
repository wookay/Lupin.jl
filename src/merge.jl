# module Lupin

function Base.merge(combine::Function, nt::NamedTuple, others::NamedTuple...)
    for other in others
        for (k,v) in pairs(other)
            nt = merge(nt, (; k => haskey(nt, k) ? combine(nt[k], v) : v))
        end
    end
    return nt
end

# module Lupin
