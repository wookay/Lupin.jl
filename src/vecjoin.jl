# module Lupin

function vecjoin(elements::Array{E, N}, delim::D)::Vector{Union{E, D}} where  {E, N, D}
    first = true
    result = Vector{Union{E, D}}()
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

# module Lupin
