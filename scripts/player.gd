extends CharacterBody2D

const SPEED = 125.0
const JUMP_VELOCITY = -275.0
const ATTACK_BOOST = 2.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar = %HealthBar
@onready var attack_timer = $AttackTimer
@onready var attack_cooldown_timer = $AttackCooldownTimer
@onready var collision_shape_2d = $CollisionShape2D

var last_dir : int

var is_attacking : bool = false
var can_attack  : bool = true

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
		
		# check for which direction and flip animations
		if direction > 0:
			animated_sprite.flip_h = false
			collision_shape_2d.position.x = 0
			last_dir = 1
		elif direction < 0: 
			animated_sprite.flip_h = true
			collision_shape_2d.position.x = 4
			last_dir = -1
		else:
			if last_dir > 0:
				animated_sprite.flip_h = false
				collision_shape_2d.position.x = 0
			elif last_dir < 0:
				animated_sprite.flip_h = true
				collision_shape_2d.position.x = 4
			else:
				animated_sprite.flip_h = false
				collision_shape_2d.position.x = 0
		
		#sword attack
		if Input.is_action_just_pressed("attack") and can_attack:
			is_attacking = true
			can_attack = false
			#play an attack animation
			attack_timer.start()
		
		# play animations
		if is_attacking:
			animated_sprite.play("attack")
		elif not is_on_floor():
				animated_sprite.play("jump")
		else:
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")		
		
		# move and slow down when not moving
		if direction:
			if is_attacking:
				velocity.x = direction * SPEED * ATTACK_BOOST
			else:
				velocity.x = direction * SPEED
		#elif is_attacking:
		#	velocity.x = last_dir * SPEED * ATTACK_BOOST
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()


func _on_attack_timer_timeout():
	is_attacking = false
	attack_cooldown_timer.start()

func _on_attack_cooldown_timer_timeout():
	can_attack = true
