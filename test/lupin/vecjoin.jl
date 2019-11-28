module test_lupin_vecjoin

using Test
using Lupin

@test vecjoin([], +) == []
@test vecjoin([1], +) == [1]
@test vecjoin([1, 2, 3], +) == [1, +, 2, +, 3]
@test vecjoin([1 2 3], +) == [1, +, 2, +, 3]
@test vecjoin([1 2 3], 5) == [1, 5, 2, 5, 3]

end # module test_lupin_vecjoin
