using StatsBase
using Plots

f1(vector) = [0 0 ; 0 0.16] * vector
f2(vector) = [0.85 0.04 ; -0.04 0.85] * vector + [0 ; 1.6]
f3(vector) = [0.20 -0.26 ; 0.23 0.22] * vector + [0 ; 1.6]
f4(vector) = [-0.15 0.28 ; 0.26 0.24] * vector + [0 ; 0.44]

Functions = [f1, f2, f3, f4]

P = 100
num = 200000
x = []
y = []
for i in 1:num
    point = [rand() ; rand()]
    for j in 1:P
        s = sample([1,2,3,4], Weights([0.01,0.85,0.07,0.07]))
        point = Functions[s](point)
    end
    push!(x, point[1])
    push!(y, point[2])
end

theme(:sand)
scatter(x,y,markersize = 0.1, legend = false, border=:none, color =:green)
