extends Node

var coins = 0
@onready var stats = $"../UI/Stats"

# stats
func add_coin():
	coins += 1
	stats.text = " \nCoins: " + str(coins) + "\n"


