using YauScape
using Documenter

DocMeta.setdocmeta!(YauScape, :DocTestSetup, :(using YauScape); recursive=true)

makedocs(;
    modules=[YauScape],
    authors="Eito Yoneyama",
    sitename="YauScape.jl",
    format=Documenter.HTML(;
        canonical="https://rice8y.github.io/YauScape.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rice8y/YauScape.jl",
    devbranch="main",
)
