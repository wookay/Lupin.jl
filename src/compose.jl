# module Lupin

if VERSION < v"1.7.0-DEV.611"
Base.:∘(f::Function, g::Function) = (x...; kwargs...) -> f(g(x...; kwargs...))
end

# module Lupin
