"""
$(TYPEDEF)

A surreal number form with explicit left and right subsets.

A (valid) form represents a specific surreal number, and so instances of this
class behave as the number they represent.
"""
struct SurrealForm{L, R} <: Number
	left::L
	right::R
end

SurrealForm() = SurrealForm((), ())
SurrealForm(f::SurrealForm) = f
SurrealForm(x) = SurrealForm(left(x), right(x))


left(f::SurrealForm) = f.left
right(f::SurrealForm) = f.right
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


Base.show(io::IO, mime::Union{FORM_TEXT_MIMES...}, f::SurrealForm) = show_form_outer(io, mime, f)
