# module Lupin

struct Argument
    args
    kwargs
    function Argument(args...; kwargs...)
        new(args, kwargs)
    end
end

function apply(f, a::Argument)
    f(a.args...; a.kwargs...)
end

# module Lupin
