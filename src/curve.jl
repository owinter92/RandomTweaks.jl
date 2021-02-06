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
    dr = x -> sqrt(1+df(x)^2)
    l,_ = quadgk(dr,a,b;rtol=rtol)
    return l
end

"""
    curve_fraction(f::Function,a::Real,b::Real,r::Real) -> Float64

Retunrs the position of the fraction of the length from the interval <`a`, `b`>, where the length of the curve is given by one parameter function `f`.

# Arguments
- `f::Function`: function of the curve,
- `a::Real`: left-bound of the interval to be integrated on,
- `b::Real`: right-bound of the interval to be integrated on,
- `r::Real`: fraction of the length of the curve given by `f` from the left,
- `rtol:Real`: default `rtol = 1e-13`, relative tolerance,

# Keywords

# Returns
- `Float64`: position of the fraction of the length from the interval <`a`, `b`>. 

# Throws
"""
function curve_fraction(f::Function,a::Real,b::Real,r::Real;rtol=1e-13)
    df = x -> ForwardDiff.derivative(f,x)
    dr = x -> sqrt(1.0 + df(x)^2)

    l,_ = quadgk(dr,a,b;rtol=rtol)
    lf = l*r

    xo = (a+b)/2
    xn = 0.0
    eps_n = 1.0
    while eps_n > xo*rtol
        l,_ = quadgk(dr,a,xo;rtol=rtol)
        xn = xo - (l - lf)/dr(xo)
        eps_n = abs(xo-xn)
        xo = xn
    end

    return xo
end
