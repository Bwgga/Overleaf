extends Area2D


@onready var health_bar = %HealthBar


func _on_body_entered(body):
	queue_free()
	health_bar.add_healthcoin()
