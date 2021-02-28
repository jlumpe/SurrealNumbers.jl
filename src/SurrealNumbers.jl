module SurrealNumbers

using DocStringExtensions


export left, right, SurrealForm, SurrealSet
export issurreal, isordinal, generation


include("util.jl")
include("api.jl")
include("sets/SurrealSet.jl")
include("show.jl")
include("SurrealForm.jl")
include("builtins.jl")


end
