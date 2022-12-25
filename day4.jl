open("day4.txt", "r") do f
    counterPart1 = 0
    counterPart2 = 0
    for line in eachline(f)
        left, right = split(line, ",")
        leftLow, leftHigh = map(val -> parse(Int, val), split(left, "-"))
        rightLow, rightHigh = map(val -> parse(Int, val), split(right, "-"))

        # Really clunky approach, but it works
        if ((leftLow <= rightLow) && (rightHigh <= leftHigh)) || ((rightLow <= leftLow) && (leftHigh <= rightHigh))
            counterPart1 += 1
        end

        if (rightLow <= leftLow <= rightHigh) || (rightLow <= leftHigh <= rightHigh) || (leftLow <= rightLow <= leftHigh) || (leftLow <= rightHigh <= leftHigh)
            counterPart2 += 1
        end

    end
    println("Part 1 solution is: ", counterPart1)
    println("Part 2 solution is: ", counterPart2)
end