using Plots

Rotation(R, θ) = [cos(θ) -sin(θ);sin(θ) cos(θ)] * R

points = [[0.0; 0.0],[1.0; 0.0],[1.0; 1.0]]

for num in 1:16
    i = 1
    while i < length(points)
        point = (points[i+1] - points[i]) * sin(pi/4)
        point = Rotation(point, pi/4)  + points[i]
        insert!(points,i+1,point)
        i += 2
        point = (points[i+1] - points[i]) * sin(pi/4)
        point = Rotation(point, -pi/4)  + points[i]
        insert!(points,i+1,point)
        i += 2
    end
end

half = Int(floor(length(points)/2))

plot(hcat(points...)[1,1:half], hcat(points...)[2,1:half], legend = false, color =:blue, border=:none)
plot!(hcat(points...)[1,half:end], hcat(points...)[2,half:end], legend = false, color =:red, border=:none)
