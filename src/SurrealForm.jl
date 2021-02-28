"""
$(TYPEDEF)

A surreal number form with explicit left and right subsets.

A (valid) form represents a specific surreal number, and so instances of this
class behave as the number they represent.
"""
struct SurrealForm{L<:SurrealSet, R<:SurrealSet} <: Number
	l::L
	r::R

	SurrealForm(l::SurrealSet, r::SurrealSet) = new{typeof(l), typeof(r)}(l, r)
end

SurrealForm() = SurrealForm((), ())
SurrealForm(f::SurrealForm) = f
SurrealForm(l, r) = SurrealForm(SurrealSet(l), SurrealSet(r))  # Convert arguments
SurrealForm(x) = SurrealForm(left(x), right(x))

function SurrealForm(args...; check::Bool)
	f = SurrealForm(args...)
	check && check_numeric(f)
	return f
end


left(f::SurrealForm) = f.l
right(f::SurrealForm) = f.r
issurreal(f::SurrealForm) = true


Base.zero(::SurrealForm) = SurrealForm()
Base.one(::SurrealForm) = SurrealForm((0,), ())


"""
	isnumeric(f::SurrealForm)

Whether the form is *numeric* - i.e. represents a valid surreal number.
"""
function isnumeric(f::SurrealForm{L, R}) where {L, R}
	# TODO
	error("Not implemented for generic forms")
end

checknumeric(f::SurrealForm) = isnumeric(f) || error("Form is not numeric")


Base.show(io::IO, mime::Union{FORM_TEXT_MIMES...}, f::SurrealForm) = show_form_outer(io, mime, f)
