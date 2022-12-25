SYM_WIDTH = 3

function parseLine(line)
    # could be simpler with regex,
    # but knowing the number of stacks a priori seems like cheating
    stack = []
    idx = 1
    while idx < length(line)
        crate = line[idx:idx+SYM_WIDTH-1]
        idx += SYM_WIDTH
        push!(stack, crate)
        idx += 1 # space or EOL
    end
    return stack
end
PART = 2
open("day5.txt", "r") do f
    stacks = []
    for (ldx, line) in enumerate(eachline(f))
        if length(line) == 0
            # remove index line
            stacks = stacks[1:length(stacks)-1]
            # kinda weird method of transposing and cleaning a vector of vectors
            stacks = reduce(hcat, stacks)
            stacks = map(stack -> filter(crate -> ~contains(crate, " "), stack), eachrow(stacks))
            stacks = map(stack -> reverse(stack), stacks)
            display(stacks)
        elseif startswith(line, "move")
            re = r"move (\d+) from (\d+) to (\d+)"
            count, source, destination = map(val -> parse(Int, val), match(re, line))
            println(ldx, ":", count, "@", source, "->", destination)
            if PART == 1
                for i = 1:count
                    crate = pop!(stacks[source])
                    push!(stacks[destination], crate)
                end
            else
                crates = map(idx -> pop!(stacks[source]), 1:count)
                stacks[destination] = vcat(stacks[destination], reverse(crates))
            end
            display(stacks)
        else
            # parse the stack representation
            crates = parseLine(line)
            push!(stacks, crates)
        end
    end
    final = join(map(stack -> stack[length(stack)][2], stacks))
    println("Part ", PART, " solution is: ", final)
end