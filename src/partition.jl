# module Lupin

function hreshape(V::Vector{T}; dims) where T
    A = Array{T}(undef, dims)
    (m, n) = dims
    for i=axes(A, 1), j=axes(A, 2)
        A[i,j] = V[(i-1)*n+j]
    end
    A
end

# similar Base.Iterators.partition but returns Matrix
function partition(v::Vector{T}; cols::Int, fill)::Matrix{T} where T
    len = length(v)
    n = div(len, cols)
    if iszero(len % cols)
        hreshape(v, dims=(n, cols))
    else
        A = hreshape(v[1:n*cols], dims=(n, cols))
        vcat(A, [v[n*cols+1:end]... Base.fill(fill, cols - len % cols)...])
    end
end

# module Lupin
