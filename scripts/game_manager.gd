extends Node

var coins = 0

@onready var stats = $"../Player/Camera2D/Stats"

func add_coin():
	coins += 1
	stats.text = "Coins: " + str(coins)
