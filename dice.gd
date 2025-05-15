extends Node

# For random generation we define helper functions:
func roll_d10() -> int:
	return randi_range(1, 10)

func roll_2d10() -> int:
	return roll_d10() + roll_d10()

func roll_d100() -> int:
	return randi_range(1, 100)
