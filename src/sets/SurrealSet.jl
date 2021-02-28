"""
$(TYPEDEF)

Abstract type for a (possibly infinite) immutable set of surreal numbers.
"""
abstract type SurrealSet{T} end

Base.eltype(::SurrealSet{T}) where T = T



"""
$(TYPEDSIGNATURES)

Whether the set has an infinite number of elements.

Based off of `Base.IteratorSize`, subclasses of `SurrealSet` should add methods
to that function rather than this one.
"""
issetfinite(s::SurrealSet) = Base.IteratorSize(s) != Base.IsInfinite()
