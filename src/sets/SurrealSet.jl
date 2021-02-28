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
