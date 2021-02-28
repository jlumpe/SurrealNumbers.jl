module SurrealNumbers

using DocStringExtensions


export Surreal, left, right, SurrealForm, SurrealSet
export issurreal, isordinal, generation
export ∅


include("util.jl")
include("base.jl")
include("sets/SurrealSet.jl")
include("sets/subtypes.jl")
include("show.jl")
include("SurrealForm.jl")
include("builtins.jl")


end
