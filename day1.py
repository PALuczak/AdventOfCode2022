elves = [0]

with open("day1.txt") as f:
    lines = f.readlines()
    for line in lines:
        line = line.strip()
        if len(line) == 0:
            elves.append(0)
        else:
            calories = int(line)
            elves[-1] += calories

elves = sorted(elves)
print("Top Elf is carrying ", elves[-1], " Calories")
print("Top 3 Elves are carrying ", sum(elves[-3:]), " Calories")
