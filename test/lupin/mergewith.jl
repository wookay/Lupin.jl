module test_lupin_mergewith

using Test
using Lupin

a = (foo = 0.0, bar = 42.0)
b = (baz = 17, bar = 4711)
@test mergewith(+, a, b) == (foo = 0.0, bar = 4753.0, baz = 17)

A = [(a=1, b=4), (a=2, b=5), (a=3, b=6)]
@test mergewith(+, A...) == (a=6, b=15)

getfirstarg(x, y) = x
getsecondarg(x, y) = y
@test mergewith(getfirstarg, (a=1,), (a=2,))          == (a = 1,)
@test mergewith(getsecondarg, (a=1,), (a=2,))         == (a = 2,)
@test mergewith(getsecondarg, (a=1,), (a=2,), (a=3,)) == (a = 3,)

@test mergewith(vcat, (a=[1],), (a=[2],)) == (a = [1, 2],)
@test mergewith(vcat, (a=["a"],), (a=[2],)) == (a = ["a", 2],)

end # module test_lupin_mergewith
