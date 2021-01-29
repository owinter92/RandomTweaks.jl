using RandomTweaks
using Documenter

makedocs(;
    modules=[RandomTweaks],
    authors="Ondrej Winter <ondrej.winter@fs.cvut.cz> and contributors",
    repo="https://github.com/owinter92/RandomTweaks.jl/blob/{commit}{path}#L{line}",
    sitename="RandomTweaks.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://owinter92.github.io/RandomTweaks.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/owinter92/RandomTweaks.jl",
)
