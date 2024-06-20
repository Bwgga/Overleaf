extends Area2D

@onready var game_manager = %Game_Manager

func _on_body_entered(body):
	game_manager.add_coin()
	queue_free()
