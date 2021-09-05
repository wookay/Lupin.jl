# Lupin.jl

some utils

|  **Build Status**                |
|:---------------------------------|
|  [![][actions-img]][actions-url] |

```julia
julia> using Lupin

julia> mergewith(+, (a = 1, b = 5), (a = 2, c = 8))
(a = 3, b = 5, c = 8)

julia> partition(1:5, cols=2, fill=0)
3×2 Array{Int64,2}:
 1  2
 3  4
 5  0

julia> vecjoin(1:3, +)
5-element Vector{Union{typeof(+), Int64}}:
 1
  + (generic function with 190 methods)
 2
  + (generic function with 190 methods)
 3
```


[actions-img]: https://github.com/wookay/Lupin.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/wookay/Lupin.jl/actions
