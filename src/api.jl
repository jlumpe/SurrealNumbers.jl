"""
	left(x)

Get the left subset of the canonical surreal number form of `x`
"""
function left end


"""
	right(x)

Get the right subset of the canonical surreal number form of `x`
"""
function right end


"""
	issurreal(x::Number)::Bool

Whether the number `x` is a surreal number.
"""
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
