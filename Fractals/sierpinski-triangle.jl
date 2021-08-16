using Plots

backtrg = [[0.0; 0.0],[10.0; 0.0],[5.0; 8.66],[0.0; 0.0]]

lasttringles = [[[0.0; 0.0],[10.0; 0.0],[5.0; 8.66],[0.0; 0.0]]]
for i in 1:8
    appendTringles = []
    for points in lasttringles
        delta = points[1]
        Trgpoints = (points - fill(delta,4)) / 2
        movecor1 = Trgpoints[2]
        movecor2 = Trgpoints[3]
        Trgpoints += fill(delta,4)
        append!(appendTringles, [Trgpoints])
        append!(appendTringles, [Trgpoints + fill(movecor1, 4)])
        append!(appendTringles, [Trgpoints + fill(movecor2, 4)])
    end
    lasttringles = appendTringles
end

plot(hcat(backtrg...)[1,:], hcat(backtrg...)[2,:], legend = false)

for points in lasttringles
    plot!(hcat(points...)[1,:], hcat(points...)[2,:], legend = false, fill = (0, 0.5, :green))
end
plot!()
