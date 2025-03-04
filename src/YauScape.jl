module YauScape

using Plots
gr()

export calabi_yau

function u1(a, b)
    return 0.5 * (exp(a + im * b) + exp(-a - im * b))
end

function u3(a, b)
    return 0.5 * (exp(a + im * b) - exp(-a - im * b))
end

function calabi_yau(n, a)
    dx = π / 100
    dy = π / 100
    x_grid = 0:dx:π/2
    y_grid = -π/2:dy:π/2
    nx, ny = length(x_grid), length(y_grid)
    
    U1_pow = [u1(x, y)^(2/n) for x in x_grid, y in y_grid]
    U3_pow = [u3(x, y)^(2/n) for x in x_grid, y in y_grid]
    
    e1 = [exp(im * 2π * k1 / n) for k1 in 0:n-1]
    e2 = [exp(im * 2π * k2 / n) for k2 in 0:n-1]
    
    total_points = 4 * n^2 * (nx-1) * (ny-1)
    x_vals = Vector{Float64}(undef, total_points)
    y_vals = Vector{Float64}(undef, total_points)
    z_vals = Vector{Float64}(undef, total_points)
    
    cos_a = cos(a)
    sin_a = sin(a)
    idx = 1
    
    @inbounds for k1 in 0:n-1
        e1_k = e1[k1+1]
        for k2 in 0:n-1
            e2_k = e2[k2+1]
            for i in 1:nx-1, j in 1:ny-1
                points = [(i, j), (i+1, j), (i+1, j+1), (i, j+1)]
                for (p_i, p_j) in points
                    z1 = e1_k * U1_pow[p_i, p_j]
                    z2 = e2_k * U3_pow[p_i, p_j]
                    x_vals[idx] = real(z1)
                    y_vals[idx] = real(z2)
                    z_vals[idx] = imag(z1)*cos_a + imag(z2)*sin_a
                    idx += 1
                end
            end
        end
    end

    plot3d(x_vals, y_vals, z_vals,
           seriestype=:surface,
           legend=false,
           framestyle=:none,
           xticks=:none,
           yticks=:none,
           zticks=:none)
end

end # module
