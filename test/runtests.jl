using YauScape
using Test
using Plots

@testset "YauScape.jl" begin
    plt = calabi_yau(3, 0.6π)
    @test isa(plt, Plots.Plot)
    @test !isempty(plt.series_list)

    for s in plt.series_list
        @test s[:seriestype] in (:surface, :path3d)
    end

    plt2 = calabi_yau(4, 0.8π)
    @test isa(plt2, Plots.Plot)
end
