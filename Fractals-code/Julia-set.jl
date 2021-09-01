using Plots

c = complex(-0.4,0.6)

abst = zeros((601,601))
inum = 0
for i in -1.5:0.005:1.5
    inum += 1
    jnum = 0
    for j in -1.5:0.005:1.5
        jnum += 1
        z = complex(i,j)
        for n in 1:70
            z = (z^2) + c
            if abs(z) > 1.5
                abst[inum,jnum] = abs(z)
                break
            end
        end
    end
end
theme(:dark)
heatmap(abst, c = cgrad(:thermal, rev = true), legend = false, border=:none)
