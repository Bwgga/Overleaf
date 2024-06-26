extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar = %HealthBar

var last_dir : int

func _physics_process(delta):
	# Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if not health_bar.value == 0:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the direction from input (-1, 0, 1)
		var direction = Input.get_axis("move_left", "move_right")
		
		# play animations
		if not is_on_floor():
				animated_sprite.play("jump")
		else:
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		
		
		# check for which direction and flip animations
		if direction > 0:
			animated_sprite.flip_h = false
			last_dir = 1
		elif direction < 0: 
			animated_sprite.flip_h = true
			last_dir = -1
		else:
			if last_dir > 0:
				animated_sprite.flip_h = false
			elif last_dir < 0:
				animated_sprite.flip_h = true
			else:
				animated_sprite.flip_h = false
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
