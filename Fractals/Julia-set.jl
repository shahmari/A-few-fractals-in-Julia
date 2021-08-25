using Plots

c = complex(0.4,0.4)

abst = zeros((601,601))
inum = 0
for i in -1.5:0.005:1.5
    inum += 1
    jnum = 0
    for j in -1.5:0.005:1.5
        jnum += 1
        z = complex(i,j)
        for n in 1:13
            z = (z^2) + c
            if abs(z) > 1000
                abst[inum,jnum] = abs(z)
                break
            end
        end
    end
end
theme(:dark)
heatmap(abst, c = :thermal, legend = false, border=:none)
