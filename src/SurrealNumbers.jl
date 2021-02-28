module SurrealNumbers

using DocStringExtensions


export left, right, SurrealForm
export issurreal, isordinal, generation


include("api.jl")
include("show.jl")
include("SurrealForm.jl")
include("builtins.jl")


end
