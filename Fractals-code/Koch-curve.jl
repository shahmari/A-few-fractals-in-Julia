using Plots

Rotation(x, y, θ) = [cos(θ) -sin(θ);sin(θ) cos(θ)] * [x;y]

function KochCurve(; points, order)
    for n in 1:order
        i = 1
        while i < length(points)
            insert!(points,i+1,(points[i+1] - points[i]) /3 + points[i])
            delta = (points[i+2] - points[i]) *2 /3 + points[i] - points[i+1]
            insert!(points, i+2, Rotation(delta[1], delta[2], pi/3)+points[i+1])
            insert!(points,i+3,(points[i+3] - points[i]) *2 /3 + points[i])
            i += 4
        end
    end
    return points
end

Parameters = Dict(
            :points => [[0.0; 0.0],[10.0; 0.0]],
            :order => 7)

points = KochCurve(;Parameters...)

plot(hcat(points...)[1,:], hcat(points...)[2,:], xlims = (-0.5 ,10), ylims = (-0.5,5), legend = false, border=:none, fill =(0))
savefig("C:\\Users\\Yaghoub\\Documents\\GitHub\\")
