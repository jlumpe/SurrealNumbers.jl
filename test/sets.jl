using SurrealNumbers: EmptySurrealSet, Singleton, WrappedSurrealSet
using SurrealNumbers: issetfinite, all_lt, all_lte


@testset "Conversion" begin
	@test SurrealSet() === ∅

	# Wraps single numbers in Singleton
	@test SurrealSet(1) === Singleton(1)

	# Wraps collections in WrappedSurrealSet
	s = [1, 2, 3]
	@test SurrealSet(s) === WrappedSurrealSet(s)

	# Passes existing instances through
	for s in [∅, Singleton(1), WrappedSurrealSet(1:3)]
		@test SurrealSet(s) === s
	end
end


@testset "EmptySurrealSet" begin
	@test Base.IteratorSize(∅) == Base.HasLength()
	@test length(∅) == 0
	@test isempty(∅)
	@test issetfinite(∅)
	@test eltype(∅) === Union{}

	@test iterate(∅) === nothing

	@test -∅ === ∅
end


@testset "Singleton" begin
	for value in [1, SurrealForm(0)]
		s = Singleton(value)

		@test Base.IteratorSize(s) == Base.HasLength()
		@test length(s) == 1
		@test issetfinite(s)
		@test eltype(s) == typeof(value)
		@test collect(s) == [value]
		@test only(s) === value
	end
end


@testset "WrappedSurrealSet" begin
	for s in []
		w = WrappedSurrealSet(s)

		@test Base.IteratorSize(w) == Base.IteratorSize(s)
		@test length(w) == length(s)
		@test eltype(w) == eltype(s)
		@test issetequal(w, s)
	end
end


@testset "Ordering" begin
	s1 = SurrealSet(1:3)
	s2 = SurrealSet(3:6)
	s3 = SurrealSet(4:6)
	s4 = SurrealSet(2:6)

	@test !all_lt(s1, s2)
	@test all_lte(s1, s2)
	@test !all_lt(s2, s1)
	@test !all_lte(s2, s1)

	@test all_lt(s1, s3)
	@test all_lte(s1, s3)
	@test !all_lt(s3, s1)
	@test !all_lte(s3, s1)

	@test !all_lt(s1, s4)
	@test !all_lte(s1, s4)
	@test !all_lt(s4, s1)
	@test !all_lte(s4, s1)
end
