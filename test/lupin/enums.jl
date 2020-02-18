module test_lupin_enums

using Test
using Lupin

@enum DepthTest Never Less Equal LessEqual Greater NotEqual GreaterEqual Always

@test DepthTest.Never == Never

end # module test_lupin_enums
