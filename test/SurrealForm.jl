# F is a form with left and right equal to (l, r)
check_form(f::SurrealForm, args...) = lr_eq(f, args...)
check_form(f, args...) = false


@testset "Construct" begin
	# Left and right empty
	@test check_form(SurrealForm(), (), ())

	# From left/right of another surreal number
	@test check_form(SurrealForm(0), 0)
	@test check_form(SurrealForm(1), 1)

	# zero and one of type
	@test check_form(zero(SurrealForm), 0)
	@test check_form(one(SurrealForm), 1)

	# Passes existing instances through
	f = SurrealForm(1)
	@test SurrealForm(f) === f
end
