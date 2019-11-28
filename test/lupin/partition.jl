module test_lupin_partition

using Test
using Lupin

V = collect(1:3)
A = partition(V, cols=5, fill=0)
@test A == [ 1  2  3  0  0]

V = collect(1:13)
A = partition(V, cols=5, fill=0)
@test A == [ 1   2   3  4   5
             6   7   8  9  10
            11  12  13  0   0]

V = split("a b c d e f g h i j")
A = partition(V, cols=5, fill="")
@test A == ["a"  "b"  "c"  "d"  "e"
            "f"  "g"  "h"  "i"  "j"]

@test partition(1:5, cols=2, fill=0) == [1 2
                                         3 4
                                         5 0]

end # module test_lupin_partition
