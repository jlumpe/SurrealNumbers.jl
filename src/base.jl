"""
$(TYPEDEF)

Base for all types which explicitly represent a surreal number.
"""
abstract type Surreal <: Number end

Surreal(x::Surreal) = x
Surreal(x) = SurrealForm(x)


"""
	left(x)::SurrealSet

Get the left subset of the canonical surreal number form of `x`
"""
function left end


"""
	right(x)::SurrealSet

Get the right subset of the canonical surreal number form of `x`.
"""
function right end


"""
	$(FUNCTIONNAME)(x)

Equivalent to `(left(x), right(x))`.
"""
leftright(x) = (left(x), right(x))


"""
	issurreal(x::Number)::Bool

Whether the number `x` is a surreal number.
"""
issurreal(::Surreal) = true
issurreal(::Real) = true
issurreal(x::Complex) = isreal(x)


"""
	isordinal(x::Number)::Bool

Whether the number `x` is an ordinal number.
"""
isordinal(x::Real) = isinteger(x) && x > 0


"""
	generation(x::Number)

Get the generation of the surreal number `x`.
"""
function generation end
