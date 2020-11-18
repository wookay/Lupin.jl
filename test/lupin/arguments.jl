module test_lupin_arguments

using Test
using Lupin

f(x) = 2x
g(; x) = 2x

@test apply(f, Argument(3))     == f(3)
@test apply(g, Argument(; x=3)) == g(; x=3)

end # module test_lupin_arguments
