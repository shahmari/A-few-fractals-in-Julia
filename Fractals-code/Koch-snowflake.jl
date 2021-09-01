points = [[0.0; 0.0],[10.0; 0.0],[5.0; 8.66],[0.0; 0.0]]
num = 5
for n in 1:num
    i = 1
    while i < length(points)
        insert!(points,i+1,(points[i+1] - points[i]) /3 + points[i])
        delta = (points[i+2] - points[i]) *2 /3 + points[i] - points[i+1]
        insert!(points, i+2, Rotation(delta[1], delta[2], -pi/3)+points[i+1])
        insert!(points,i+3,(points[i+3] - points[i]) *2 /3 + points[i])
        i += 4
    end
end

plot(hcat(points...)[1,:], hcat(points...)[2,:], legend = false, border=:none, fill =(0))