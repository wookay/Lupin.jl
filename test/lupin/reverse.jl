module test_lupin_reverse

using Test
using Lupin

@test reverse((a=1, b=2)) == (b=2, a=1)

end # module test_lupin_reverse
