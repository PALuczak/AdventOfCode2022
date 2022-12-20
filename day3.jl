open("day3.txt", "r") do f
    total = 0
    for line in eachline(f)
        len = length(line)

        first = Set(line[begin:len÷2])
        second = Set(line[len÷2+1:end])
        shared = intersect(first, second)
        shared = [c for c in shared]

        priority = mapreduce(c -> islowercase(c) ? Int(c) - 96 : Int(c) - 64 + 26, +, shared)

        total += priority
    end
    println("Part 1 solution is: ", total)
end
println()
open("day3.txt", "r") do f
    total = 0
    group = []
    for line in eachline(f)
        len = length(line)
        line = Set(line)
        push!(group, line)
        if length(group) == 3
            shared = intersect(group...)
            shared = [c for c in shared]
            priority = mapreduce(c -> islowercase(c) ? Int(c) - 96 : Int(c) - 64 + 26, +, shared)
            total += priority
            group = []
        end
    end
    println("Part 2 solution is: ", total)
end
