using LaTeXStrings
using CairoMakie

publication_theme() = Theme(
    fontsize = 16,
    font = "CMU Serif",
    Axis = (
        xlabelsize = 20,
        xgridstyle = :dash,
        ygridstyle = :dash,
        xtickalign = 1,
        ytickalign = 1,
        yticksize = 10,
        xticksize = 10,
        xlabelpadding = -5,
        xlabel = "x",
        ylabel = "y",
    ),
    Legend = (framecolor = (:black, 0.5), gbcolor = (:white, 0.5)),
    Colorbar = (ticksize = 16, tickalign = 1, spinewidth = 0.5),
)

function LaTeX_Strings()
    x = 0:0.05:4π
    lines(
        x,
        x -> sin(3x) / (cos(x) + 2) / x;
        label = L"\frac{\sin(3x)}{x(\cos(x)+2)}",
        figure = (; resolution = (600, 400)),
        axis = (; xlabel = L"x"),
    )
    lines!(x, x -> cos(x) / x; label = L"\cos(x)/x")
    lines!(x, x -> exp(-x); label = L"e^{-x}")
    limits!(-0.5, 13, -0.6, 1.05)
    axislegend(L"f(x)")
    current_figure()
end

with_theme(LaTeX_Strings, publication_theme())
