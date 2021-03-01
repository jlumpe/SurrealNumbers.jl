
"""
$(TYPEDEF)

A generic function was called with arguments that should be valid but for which
there is no existing implementation.
"""
struct NotImplementedError <: Exception
	f
	args::Tuple
    msg::Union{String, Nothing}
end

NotImplementedError(f, args::Tuple) = NotImplementedError(f, args, nothing)


function Base.showerror(io::IO, e::NotImplementedError)
    print(io, "NotImplementedError: ", e.f, e.args)
    if !isnothing(e.msg)
        print(io, " ", e.msg)
    end
end


is_notimplemented(::Exception) = false
is_notimplemented(::Exception, f) = false
is_notimplemented(::NotImplementedError) = true
is_notimplemented(e::NotImplementedError, f) = e.f == f


"""
$(SIGNATURES)

Define a function/method which raises [`NotImplementedError`](@ref) when called.
"""
macro notimplemented(expr, msg::Union{String, Nothing}=nothing)
    Meta.isexpr(expr, :call) || error("Expression must be function call")

    f = esc(expr.args[1])

    args = Symbol[]
    for a in expr.args[2:end]
        Meta.isexpr(a, :parameters) && error("Keyword arguments not supported")
        if a isa Symbol
            push!(args, a)
        elseif Meta.isexpr(a, :(::))
            push!(args, a.args[1])
        else
            error("Expected function parameter, got $a")
        end
    end

    return quote
        $(esc(expr)) = throw($NotImplementedError($f, ($(esc.(args)...),), $msg))
    end
end


"""
$(SIGNATURES)

Return result of evaluating `expr`, but catch [`NotImplementedError`](@ref) and return `default` instead.
"""
macro notimplemented_default(expr, default)
	return quote
		try
			$(esc(expr))
		catch e
			$is_notimplemented(e) ? $(esc(default)) : throw(e)
		end
	end
end
