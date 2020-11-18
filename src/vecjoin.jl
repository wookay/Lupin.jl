# module Lupin

function vecjoin(elements::Array{E, N}, delim::D)::Union{Vector{typejoin(E, D)}, Vector{Union{E, D}}} where {E, N, D}
    first = true
    T = typejoin(E, D)
    if T === Any
        T = Union{E, D}
    end
    result = Vector{T}()
    for el in elements
        if first
            first = false
        else
            push!(result, delim)
        end
        push!(result, el)
    end
    result
end

function vecjoin(r::AbstractRange{E}, delim::D)::Union{Vector{typejoin(E, D)}, Vector{Union{E, D}}} where {E, D}
    vecjoin(collect(r), delim)
end

# module Lupin
