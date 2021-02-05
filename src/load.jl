"""
    load_file_line_by_line(filename::AbstractString) -> Array{SubString{String},1}
Load and return the content of the text file `filename` in `Array{SubString{String},1}`, i.e., one element for each line.
# Arguments
- `filename::AbstractString`: the filename of the file to load,
# Keywords
# Returns
- `Array{SubString{String},1}`: the array of the file content,
# Throws
- `Error`: in the case of file does not exist.
"""
function load_file_line_by_line(filename::AbstractString)
    f=open(filename) do file
        read(file,String)
    end
    return split(f,"\n")
end
