
"""
$(TYPEDEF)

A generic function was called with arguments that should be valid but for which
there is no existing implementation.
"""
struct NotImplementedError <: Exception
	f
	args::Tuple
end


is_notimplemented(::Exception) = false
is_notimplemented(::Exception, f) = false
is_notimplemented(::NotImplementedError) = true
is_notimplemented(e::NotImplementedError, f) = e.f == f


macro notimplemented_default(expr, default)
	return quote
		try
			$(esc(expr))
		catch e
			$is_notimplemented(e) ? $(esc(default)) : throw(e)
		end
	end
end
