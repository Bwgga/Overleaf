extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
#potential to add right down and left down raycasts to prevent mob from falling off edges of the map

const SPEED = 30
var direction = 1

func _process(delta):
	if ray_cast_right.is_colliding(): # or !ray_cast_right_down.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding(): # or !ray_cast_left_down.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += SPEED * delta * direction
