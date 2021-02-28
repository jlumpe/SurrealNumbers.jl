const FORM_TEXT_MIMES = (MIME"text/plain", MIME"text/latex")


form_chars_for_mime(::MIME"text/plain") = ("{", "|", "}")
form_chars_for_mime(::MIME"text/latex") = (raw"\left\{ ", raw" \middle| ", raw" \right\}")


"""
Show the canonical form of the surreal number x.
"""
function show_form(io::IO, mime::Union{FORM_TEXT_MIMES...}, x)
	l, m, r = form_chars_for_mime(mime)
    print(io, l)
    show_set(io, mime, left(x))
    print(io, m)
    show_set(io, mime, right(x))
    print(io, r)
end


show_form_outer(io::IO, mime::MIME, x) = show_form(io, mime, x)

function show_form_outer(io::IO, mime::MIME"text/latex", x)
	print(io, "\$")
	show_form(io, mime, x)
	print(io, "\$")
end


"""
Show a set of surreal numbers within the representation of a form.
"""
function show_set(io::IO, mime::Union{FORM_TEXT_MIMES...}, s)
    first = true
    for x in s
        first || print(io, ", ")
        show_inner(io, mime, x)
        first = false
    end
end


"""
Show the surreal number `x` inside the left or right subset of a form.
"""
show_inner(io::IO, mime::MIME, x) = show(io, mime, x)
