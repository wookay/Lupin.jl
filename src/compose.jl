# module Lupin

Base.:∘(f::Function, g::Function) = (x...; kwargs...) -> f(g(x...; kwargs...))

# module Lupin
