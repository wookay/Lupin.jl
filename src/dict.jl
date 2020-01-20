# module Lupin

function Base.getproperty(dict::T, key::Symbol) where {T <: Dict{String}}
    key in fieldnames(T) ? getfield(dict, key) : getindex(dict, String(key))
end

function dict_to_namedtuple(dict::Dict{String})
    ks = keys(dict)
    vals = map(collect(ks)) do k
        v = getindex(dict, k)
        val = if v isa Dict{String}
            dict_to_namedtuple(v)
        else
            v
        end
        Symbol(k) => val
    end
    (; vals...)
end

function NamedTuple(dict::Dict{String})
    dict_to_namedtuple(dict)
end

# module Lupin
