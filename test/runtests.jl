using SurrealNumbers
using Test


lr_eq(x, l, r) = issetequal(left(x), l) && issetequal(right(x), r)
lr_eq(x1, x2) = lr_eq(x1, left(x2), right(x2))


@testset "SurrealForm" begin include("SurrealForm.jl") end
@testset "builtins" begin include("builtins.jl") end
