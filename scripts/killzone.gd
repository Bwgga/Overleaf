extends Area2D

signal has_died

@onready var timer = $Timer

func _on_body_entered(body):
	print("Killzone detects " + str(body))
	timer.start()
	body.get_node("AnimatedSprite2D").play("death")

func _on_timer_timeout():
	get_tree().reload_current_scene()
