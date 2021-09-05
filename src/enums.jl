# module Lupin

#=
function Base.getproperty(::Type{T}, sym::Symbol) where {T <: Enum}
    if sym in (:name, :parameters)
        getfield(T, sym)
    else
        for instance in instances(T)
            Symbol(instance) === sym && return instance
        end
        throw(ErrorException(string("type ", T, " has no field ", sym)))
    end
end
=#

# module Lupin
