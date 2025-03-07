module YauScape

using Plots
gr()

export calabi_yau, calabi_yau_anim

function u1(a::Float64, b::Float64)
    0.5 * (exp(a + im * b) + exp(-a - im * b))
end

function u3(a::Float64, b::Float64)
    0.5 * (exp(a + im * b) - exp(-a - im * b))
end

function calabi_yau(n::Int, α::Float64; grid_res::Int64=50, color_palette::Symbol=:rainbow, color=nothing)
    α = mod(α, 2π)
    a_vals = range(0.0, π/2, length=grid_res)
    b_vals = range(-π/2, π/2, length=grid_res)

    U1 = [u1(a, b)^(2/n) for a in a_vals, b in b_vals]
    U3 = [u3(a, b)^(2/n) for a in a_vals, b in b_vals]

    plt = plot3d(legend=false, framestyle=:none, grid=false, axis=false, size=(800, 800), camera=(30, 30))

    if isnothing(color)
        colors = cgrad(color_palette, n^2, categorical=true)
    else
        colors = fill(color, n^2)
    end

    phase1 = [exp(im * 2π * k1 / n) for k1 in 0:n-1]
    phase2 = [exp(im * 2π * k2 / n) for k2 in 0:n-1]

    cosα = cos(α)
    sinα = sin(α)

    idx = 1
    for k1 in 0:n-1, k2 in 0:n-1
        z1 = phase1[k1+1] .* U1
        z2 = phase2[k2+1] .* U3

        x = real.(z1)
        y = real.(z2)
        z = imag.(z1) .* cosα .+ imag.(z2) .* sinα

        surface!(plt, x, y, z, color=isnothing(color) ? colors[idx] : color)
        idx += 1
    end
    
    return plt
end

function calabi_yau_anim(n::Int64; anim_res::Int64=50, color_palette::Symbol=:rainbow, color=nothing)
    angles = LinRange(0, 2π, anim_res + 1)[1:end-1]
    calabi_yau(n, angles[1], grid_res=anim_res, color_palette=color_palette, color=color)
    anim = @animate for (i, α) in enumerate(angles)
        calabi_yau(n, α, grid_res=anim_res, color_palette=color_palette, color=color)
    end
    return anim
end

end # module
