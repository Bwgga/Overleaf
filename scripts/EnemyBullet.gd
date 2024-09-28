extends Area2D

@onready var health_bar = %HealthBar
var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 500.0
	const RANGE = 200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	health_bar.get_hurt(10)
