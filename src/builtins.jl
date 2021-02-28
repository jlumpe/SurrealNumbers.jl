# API definitions for builtin types


# Integers
left(i::Integer) = i > 0 ? Singleton(i - one(i)) : ∅
right(i::Integer) = i < 0 ? Singleton(i + one(i)) : ∅
generation(i::Integer) = abs(i)

show_inner(io::IO, ::MIME"text/latex", i::Integer) = print(io, i)
