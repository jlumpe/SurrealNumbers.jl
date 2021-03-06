using SurrealNumbers
using Test


lr_eq(x, l, r) = issetequal(left(x), l) && issetequal(right(x), r)
lr_eq(x1, x2) = lr_eq(x1, left(x2), right(x2))


@testset "util" begin include("util.jl") end
@testset "sets" begin include("sets.jl") end
@testset "SurrealForm" begin include("SurrealForm.jl") end
@testset "builtins" begin include("builtins.jl") end
