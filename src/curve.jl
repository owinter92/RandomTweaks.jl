"""
    curve_length(f::Function,a::Real,b::Real;rtol=1e-13) -> Float64

Calculates the length of the curve given by `f`, where `f` is function of one parameter, on interval <`a`, `b`> of said parameter.

# Arguments
- `f::Function`: function of the curve to be measured,
- `a::Real`: left-bound of the interval to be integrated on,
- `b::Real`: right-bound of the interval to be integrated on,
- `rtol::Real`: default `rtol = 1e-13`, relative tolerance,

# Keywords

# Returns
- `Float64`: length of the curve defined by the `f` on the interval <`a`, `b`>. 

# Throws
"""
function curve_length(f::Function,a::Real,b::Real;rtol=1e-13)
    df = x -> ForwardDiff.derivative(f,x)
    dr = x -> sqrt(1+df(x)*df(x))
    l = quadgk(dr,a,b,rtol=rtol)
    return l
end
