extends CharacterBody2D

signal hit

var initial_x_velocity = 0.0
var active = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if active:
		# Add the gravity.
		velocity.x = initial_x_velocity
		velocity.y += gravity * delta
		#if not is_on_floor():
		#	pass
		#elif is_on_floor():
		#	deactivate()
			
		move_and_slide()

func deactivate():
	active = false
	visible = false
	velocity.x = 0.0
	velocity.y = 0.0
	#position.x = 0.0
	#position.y = 0.0
	hit.emit()

func _on_shooter_shoot(x_velocity, y_velocity):
	active = true
	visible = true
	modulate.a = 0.5
	initial_x_velocity = x_velocity
	velocity.y = y_velocity
