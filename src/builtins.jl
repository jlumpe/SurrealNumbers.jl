# API definitions for builtin types


# Integers
left(i::Integer) = i > 0 ? (i - one(i),) : ()
right(i::Integer) = i < 0 ? (i + one(i)) : ()
