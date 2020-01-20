module test_lupin_dict

using Test
using Lupin

dict = Dict("a"=>Dict("b"=>3))
@test dict.a.b == 3

nt = NamedTuple(dict)
@test nt.a.b == 3

end # module test_lupin_dict
