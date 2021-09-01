function khayyam_triangle(lentingle)
    output = []
    for i in 1:lentingle
        push!(output, [])
        for j in 1:i
            if j == 1
                append!(output[i], 1)
            elseif j == i
                append!(output[i], 1)
            else j != 1 && j != i
                add = output[i - 1][j] + output[i - 1][j - 1]
                append!(output[i], add)
            end
        end
    end
    return output
end
