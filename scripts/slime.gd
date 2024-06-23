extends CharacterBody2D

const SPEED = 60.0
var direction = 1
@onready var slime = $Slime
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var health_bar = %HealthBar
@onready var damagezone = $Damagezone/Damagezone



var last_dir : int
var has_died : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		slime.play("jump")

	# play animations
	if not is_on_floor():
		slime.play("jump")
	else:
		slime.play("idle")
	
	if ray_cast_right.is_colliding() or ray_cast_left.is_colliding():
		direction = -direction
	
	# check for which direction and flip animations
	if direction > 0:
		flip(false)
		last_dir = 1
	elif direction < 0: 
		flip(true)
		last_dir = -1
	else:
		if last_dir > 0:
			flip(false)
		elif last_dir < 0:
			flip(true)
		else:
			flip(false)
	
	# move
	if direction:
		position.x += direction * SPEED * delta
	else:
		position.x -= direction * SPEED * delta

	move_and_slide()


# slime.play("death")

func flip(state):
	slime.flip_h = state
	if state == true:
		damagezone.position.x = -4

func _on_damagezone_body_entered(body):
	health_bar.get_hurt()
	
	
