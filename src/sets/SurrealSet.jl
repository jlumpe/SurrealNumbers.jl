"""
$(TYPEDEF)

Abstract type for a (possibly infinite) immutable set of surreal numbers.
"""
abstract type SurrealSet{T} end

SurrealSet(s::SurrealSet) = s
SurrealSet(x::Number) = Singleton(x)
SurrealSet(s) = hasmethod(iterate, Tuple{typeof(s)}) ? WrappedSurrealSet(s) : Singleton(x)
SurrealSet() = EmptySurrealSet()


Base.eltype(::SurrealSet{T}) where T = T



"""
$(TYPEDSIGNATURES)

Whether the set has an infinite number of elements.

Based off of `Base.IteratorSize`, subclasses of `SurrealSet` should add methods
to that function rather than this one.
"""
issetfinite(s::SurrealSet) = Base.IteratorSize(s) != Base.IsInfinite()



#
# Ordering
#

"""
	$(FUNCTIONNAME)(A::SurrealSet, B::SurrealSet)
	$(FUNCTIONNAME)(a::Number, B::SurrealSet)
	$(FUNCTIONNAME)(A::SurrealSet, b::Number)

If all elements of A are < all elements of B.

If either argument is a scalar it is treated as a singleton.
"""
function all_lt end

"""
	$(FUNCTIONNAME)(A::SurrealSet, B::SurrealSet)
	$(FUNCTIONNAME)(a::Number, B::SurrealSet)
	$(FUNCTIONNAME)(A::SurrealSet, b::Number)

If all elements of A are ≤ all elements of B.

If either argument is a scalar it is treated as a singleton.
"""
function all_lte end

for (f, op) in [(:all_lt, <), (:all_lte, <=)]
	@eval begin
		function $f(a::SurrealSet, b::SurrealSet)
			issetfinite(a) && return $f(maximum(a), b)
			issetfinite(b) && return $f(a, minimum(b))
			throw(NotImplementedError($f, (a, b)), "Not implemented for two infinite sets")
		end

		function $f(a::SurrealSet, b::Number)
			issetfinite(a) && return $op(maximum(a), b)
			throw(NotImplementedError($f, (a, b)), "Not implemented for infinite sets")
		end

		function $f(a::Number, b::SurrealSet)
			issetfinite(b) && return $op(a, minimum(b))
			throw(NotImplementedError($f, (a, b)), "Not implemented for infinite sets")
		end
	end
end
