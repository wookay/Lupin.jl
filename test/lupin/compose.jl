module test_lupin_compose

using Test
using Lupin

@test (identity ∘ ≈)(10, 11; atol = 2)

end # module test_lupin_compose
