extends Node

var coins = 0
@onready var stats = $"../UI/Stats"

func add_coin():
	coins += 1
	stats.text = " \nCoins: " + str(coins) + "\n"


@onready var health_bar = %HealthBar
@onready var health_coin = $"../HeathCoin/Health Coin"

func _add_health_coin(body):
	health_bar.add_healthcoin()
	health_coin.dissapear()
