var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = YauScape","category":"page"},{"location":"#YauScape","page":"Home","title":"YauScape","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for YauScape.","category":"page"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"#1.-3D-Plot-Generation:","page":"Home","title":"1. 3D Plot Generation:","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using YauScape\n\ncalabi_yau(3, 2/π)\nsavefig(\"calabi_yau.png\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"","page":"Home","title":"Home","text":"tip: Parameters\nn::Int64:  Determines the level of complexity in the Calabi-Yau manifold, influencing the number of patches used in its construction. Higher values of n result in more intricate surfaces.\nα::Float64:  Specifies the rotation angle (in radians) of the 3D plot around the z-axis. This parameter allows you to view the Calabi-Yau manifold from different perspectives.\ngrid_res::Int64:  Controls the resolution of the grid used to generate the surface. A higher grid_res value leads to a smoother and more detailed surface, but increases computation time.\ncolor_palette::Symbol:  Sets the color palette used for coloring the surface patches.  It accepts any valid Plots.jl color palette symbol (e.g., :rainbow, :viridis, :blues).\ncolor::Symbol or nothing:  If provided with a color symbol, it overrides the color_palette and applies a uniform color to all surface patches. If set to nothing, the color_palette is used for coloring.","category":"page"},{"location":"#2.-Time-Evolution-Animation:","page":"Home","title":"2. Time Evolution Animation:","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using YauScape\n\nanim = calabi_yau_anim(2)\ngif(anim, \"calabi_yau.gif\", fps=15)","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"","page":"Home","title":"Home","text":"tip: Parameters\nn::Int64: Similar to the calabi_yau function, determines the complexity of the Calabi-Yau manifold and affects the intricacy of the shape in the animation.\nanim_res::Int64: Specifies the number of frames in the animation. Higher values result in smoother animations but longer generation times.  Note: In calabi_yau_anim, anim_res is also used to set grid_res. Therefore, anim_res effectively controls both the number of animation frames and the grid resolution of the surfaces in each frame. Higher values for anim_res lead to smoother animation and more detailed surfaces but increase computation time.\ncolor_palette::Symbol:  Same as in calabi_yau, sets the color palette for surface patch coloring, used throughout the animation.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [YauScape]","category":"page"}]
}
