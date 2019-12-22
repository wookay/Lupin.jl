module test_lupin_merge

using Test
using Lupin

a = (foo = 0.0, bar = 42.0)
b = (baz = 17, bar = 4711)
@test merge(+, a, b) == (foo = 0.0, bar = 4753.0, baz = 17)

end # module test_lupin_merge
