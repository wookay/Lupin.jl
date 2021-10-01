# module Lupin

function Base.reverse(nt::NamedTuple{names, T}) where {names, T <: Tuple}
    NamedTuple{reverse(names)}((reverse ∘ values)(nt))
end

# module Lupin
