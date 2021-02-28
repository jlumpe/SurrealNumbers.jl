using SurrealNumbers: NotImplementedError, @notimplemented_default


@testset "notimplemented_default" begin
	@test @notimplemented_default(1 + 2, 0) == 3
	@test @notimplemented_default(throw(NotImplementedError(nothing, ())), 0) == 0
	@test_throws DivideError @notimplemented_default(1 ÷ 0, nothing)
end
