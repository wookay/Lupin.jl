# module Lupin

function Base.reverse(nt::NamedTuple{names, T}) where {names, T <: Tuple}
    NamedTuple{reverse(names)}((reverse ∘ values)(nt))
end

function Base.reverse(dict::Dict{K, V})::Dict{V, K} where {K, V}
    d = Dict{V, K}()
    for (k, v) in dict
        d[v] = k
    end
    d
end

# module Lupin
