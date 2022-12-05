score_A = 0
score_B = 0

scores = {"X": 1, "Y": 2, "Z": 3}
outcomes = {
    "A": {"X": 3, "Y": 6, "Z": 0},
    "B": {"X": 0, "Y": 3, "Z": 6},
    "C": {"X": 6, "Y": 0, "Z": 3},
}

actions = {
    "A": {"X": "Z", "Y": "X", "Z": "Y"},
    "B": {"X": "X", "Y": "Y", "Z": "Z"},
    "C": {"X": "Y", "Y": "Z", "Z": "X"},
}
wins = {"X": 0, "Y": 3, "Z": 6}

with open("day2.txt") as f:
    lines = f.readlines()
    for line in lines:
        line = line.strip()
        opponent, mine = line.split()
        score_A += outcomes[opponent][mine] + scores[mine]

        score_B += wins[mine] + scores[actions[opponent][mine]]
        print(wins[mine], " + ", scores[actions[opponent][mine]])

print("The final A score is ", score_A)
print("The final B score is ", score_B)
