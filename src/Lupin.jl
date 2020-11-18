module Lupin

export partition
include("partition.jl")

export vecjoin
include("vecjoin.jl")

include("mergewith.jl")

include("dict.jl")

include("compose.jl")

include("enums.jl")

export Argument, apply
include("arguments.jl")

end # module Lupin
