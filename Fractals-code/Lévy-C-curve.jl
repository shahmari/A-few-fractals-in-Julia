using Plots

Rotation(R, θ) = [cos(θ) -sin(θ);sin(θ) cos(θ)] * R

points = [[0.0; 0.0],[1.0; 0.0],[1.0; 1.0]]

for num in 1:16
    i = 1
    while i < length(points)
        point = (points[i+1] - points[i]) * sin(pi/4)
        point = Rotation(point, -pi/4)  + points[i]
        insert!(points,i+1,point)
        i += 2
        point = (points[i+1] - points[i]) * sin(pi/4)
        point = Rotation(point, -pi/4)  + points[i]
        insert!(points,i+1,point)
        i += 2
    end
end
theme(:dark)
plot(hcat(points...)[1,:], hcat(points...)[2,:], legend = false, border=:none, color =:white, linewidth=0.2)
