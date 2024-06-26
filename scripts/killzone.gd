extends Area2D

@onready var timer = $Timer
@onready var health_bar = %HealthBar

func _on_body_entered(body):
	# print("Killzone detects " + str(body))
	timer.start()
	health_bar.get_hurt(200)
	body.get_node("AnimatedSprite2D").play("death")

func _on_timer_timeout():
	get_tree().reload_current_scene()
