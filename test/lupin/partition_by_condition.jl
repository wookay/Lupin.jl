module test_lupin_partition_by_condition

using Test
using Lupin

@test partition(<=(3), [1, 2, 3, 4, 5]) == ([1, 2, 3], [4, 5])
@test partition(<=(5), [1, 2, 3, 4, 5]) == ([1, 2, 3, 4, 5], [])

@test partition(<=(3), 1:5) == (1:3, 4:5)
@test partition(<=(5), 1:5) == (1:5, [])

end # module test_lupin_partition_by_condition
