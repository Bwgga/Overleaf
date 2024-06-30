extends CharacterBody2D

@onready var range = $Range
@onready var shooter = $Shooter
@onready var player = $"../../Player"
@onready var timer = $Timer

signal shoot(x_velocity, y_velocity)

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
const INITIAL_Y : float = -100.0
var velocity_x : float = 0.0
var delta_x : float = 0.0 #for calculations
var delta_y : float = 0.0 #for calculations
var radical : float = 0.0 #for calculations

var player_detected : bool = false #true when player in range shape

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var G = 980.0 #supposed to be accessible but I get a Vector2 type

# select lines and hit control-K to comment them all at once
# include physics process to make the enemy move
func _physics_process(delta):
	if player_detected:
		if player.transform.x > transform.x:
			flip(false)
		else:
			flip(true)
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func flip(state):
	shooter.flip_h = state
	if state == true:
		pass
		#damagezone.position.x = -4

func _on_range_body_entered(body):
	player_detected = true
	timer.start()

func _on_range_body_exited(body):
	player_detected = false

func _on_timer_timeout():
	if player_detected: #this is all just calculating the quadratic formula to
						#determine the parabola that intersects the shooter and
						#the current position of the player
						#I just wanted to try the most complicated case first, 
						#we'll see if we actually use this or a simplification
		delta_x = player.position.x - position.x
		delta_y = player.position.y - position.y
		radical = INITIAL_Y * INITIAL_Y + ( 2 * G * delta_y)
		if radical > 0: #just making sure
			radical = sqrt(radical)
			#if delta_y < 0 - ( INITIAL_Y / (2 * G) ): #check vertical range
				#if radical > INITIAL_Y: #just making sure
		velocity_x = G * delta_x / (radical - INITIAL_Y)
		shoot.emit(velocity_x, INITIAL_Y)

func _on_bullet_hit():
	if player_detected:
		timer.start()
