```@meta
CurrentModule = YauScape
```

# YauScape

Documentation for [YauScape](https://github.com/rice8y/YauScape.jl).

## Examples

### 1. 3D Plot Generation:

```@example
using YauScape

calabi_yau(3, 2/π)
savefig("calabi_yau.png")
```

<!-- ![](calabi_yau.png) -->

!!! tip "Parameters"
    - `n::Int64`:  Determines the level of complexity in the Calabi-Yau manifold, influencing the number of patches used in its construction. Higher values of `n` result in more intricate surfaces.
    - `α::Float64`:  Specifies the rotation angle (in radians) of the 3D plot around the z-axis. This parameter allows you to view the Calabi-Yau manifold from different perspectives.
    - `grid_res::Int64`:  Controls the resolution of the grid used to generate the surface. A higher `grid_res` value leads to a smoother and more detailed surface, but increases computation time.
    - `color_palette::Symbol`:  Sets the color palette used for coloring the surface patches.  It accepts any valid Plots.jl color palette symbol (e.g., `:rainbow`, `:viridis`, `:blues`).
    - `color::Symbol` or `nothing`:  If provided with a color symbol, it overrides the `color_palette` and applies a uniform color to all surface patches. If set to `nothing`, the `color_palette` is used for coloring.

### 2. Time Evolution Animation:

```@example
using YauScape

anim = calabi_yau_anim(2)
gif(anim, "calabi_yau.gif", fps=15)
```

!!! tip "Parameters of `calabi_yau_anim` function"
    - `n::Int64`: Similar to the `calabi_yau` function, determines the complexity of the Calabi-Yau manifold and affects the intricacy of the shape in the animation.
    - `anim_res::Int64`: Specifies the number of frames in the animation. Higher values result in smoother animations but longer generation times.  **Note:** In `calabi_yau_anim`, `anim_res` is also used to set `grid_res`. Therefore, `anim_res` effectively controls both the number of animation frames and the grid resolution of the surfaces in each frame. Higher values for `anim_res` lead to smoother animation and more detailed surfaces but increase computation time.
    - `color_palette::Symbol`:  Same as in `calabi_yau`, sets the color palette for surface patch coloring, used throughout the animation.

<!-- ![](calabi_yau.gif) -->

```@index
```

```@autodocs
Modules = [YauScape]
```
