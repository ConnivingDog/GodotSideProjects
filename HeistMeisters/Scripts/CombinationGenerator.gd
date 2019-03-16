extends Node

func _ready():
	generator_combination(length)

func generator_combination(length):
	var combination = []
	for number in range(length):
		randomize()
		combination.append(randi() % 10)
	return combination
		