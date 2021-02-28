using SurrealNumbers
using Documenter

DocMeta.setdocmeta!(SurrealNumbers, :DocTestSetup, :(using SurrealNumbers); recursive=true)

makedocs(;
    modules=[SurrealNumbers],
    authors="Jared Lumpe",
    repo="https://github.com/jlumpe/SurrealNumbers.jl/blob/{commit}{path}#{line}",
    sitename="SurrealNumbers.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
