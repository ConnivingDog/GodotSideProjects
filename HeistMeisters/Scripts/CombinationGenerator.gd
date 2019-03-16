extends Node

func generator_combination(length):
	var combination = []
	for number in range(length):
		randomize()
		combination.append(randi() % 10)
	return combination
		