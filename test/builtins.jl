
@testset "Integer" begin
	for T in [Int, Int8, BigInt]
		@test lr_eq(T(0), (), ())
		@test lr_eq(T(1), (0,), ())
		@test lr_eq(T(-1), (), (0,))

		@test issurreal(T(1))

		@test isordinal(T(1))
		@test !isordinal(T(0))
		@test !isordinal(T(-1))
	end
end
