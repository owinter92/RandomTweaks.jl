module RandomTweaks

using ForwardDiff
using QuadGK

include("load.jl")
export load_file_line_by_line

include("curve.jl")
export curve_length,curve_fraction

end
