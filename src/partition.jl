# module Lupin

export partition

function hreshape(V::Vector{T}, dims) where T
    A = Array{T}(undef, dims)
    (m, n) = dims
    for i=axes(A, 1), j=axes(A, 2)
        A[i,j] = V[(i-1)*n+j]
    end
    A
end

function partition(v::Vector; cols::Int, fill)
    len = length(v)
    n = div(len, cols)
    if iszero(len % cols)
        hreshape(v, (n, cols))
    else
        A = hreshape(v[1:n*cols], (n, cols))
        vcat(A, [v[n*cols+1:end]... Base.fill(fill, cols - len % cols)...])
    end
end

# module Lupin
