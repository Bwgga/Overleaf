extends Area2D

@onready var health_bar = %HealthBar


func _on_body_entered(body):
	health_bar.get_hurt(10)
