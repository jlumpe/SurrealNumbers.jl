"""
$(TYPEDEF)
"""
struct EmptySurrealSet <: SurrealSet{Union{}} end

const ∅ = EmptySurrealSet()

Base.length(::EmptySurrealSet) = 0
Base.IteratorSize(::Type{EmptySurrealSet}) = Base.HasLength()

Base.iterate(::EmptySurrealSet) = nothing

Base.:-(::EmptySurrealSet) = EmptySurrealSet()

Base.show(io::IO, ::EmptySurrealSet) = print(io, "∅")



"""
$(TYPEDEF)

A set containing a single surreal number.

Get the number using `only(s)`.
"""
struct Singleton{T} <: SurrealSet{T}
	x::T

	Singleton(x) = new{typeof(x)}(x)
end

Base.length(::Singleton) = 1
Base.IteratorSize(::Type{<:Singleton}) = Base.HasLength()

Base.iterate(s::Singleton) = (s.x, nothing)
Base.iterate(::Singleton, ::Nothing) = nothing

Base.only(s::Singleton) = s.x



"""
$(TYPEDEF)

Wrapper around an arbitrary collection of surreal numbers.
"""
struct WrappedSurrealSet{T, S} <: SurrealSet{T}
	s::S

	WrappedSurrealSet(s) = new{eltype(s), typeof(s)}(s)
end

Base.length(s::WrappedSurrealSet) = length(s.s)
Base.IteratorSize(::Type{WrappedSurrealSet{T, S}}) where {T, S} = Base.IteratorSize(S)

Base.iterate(s::WrappedSurrealSet, args...) = iterate(s.s, args...)
