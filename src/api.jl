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
issurreal(::Number) = false
issurreal(::Real) = true