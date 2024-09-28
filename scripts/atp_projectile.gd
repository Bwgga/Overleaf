extends Area2D
@onready var player = $"."

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 300.0
	const RANGE = 2000
	var direction = 1
	position.x += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"): #added later; makes bullets damage enemies
		body.take_damage()
