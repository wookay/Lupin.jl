module test_lupin_reverse

using Test
using Lupin

@test reverse((a=1, b=2)) == (b=2, a=1)

d = Dict(:a => 1, :b => 2)
@test reverse(d) == Dict(1 => :a, 2 => :b)

end # module test_lupin_reverse
