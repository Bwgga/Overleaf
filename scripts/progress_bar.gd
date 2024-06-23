extends ProgressBar

@onready var health_bar = %HealthBar
@onready var timer = $TimerHealthBar
@onready var damage_bar = $DamageBar

const MAX_HEALTH = 100
var health = 100

func _ready():
	set_health_bar()
	max_value = MAX_HEALTH
	value = MAX_HEALTH
	damage_bar.max_value = MAX_HEALTH
	damage_bar.value = MAX_HEALTH
	
func set_health_bar():
	timer.start()
	value = health
	
func add_healthcoin():
	if health < MAX_HEALTH:
		if (MAX_HEALTH - health) < 10:
			health += MAX_HEALTH - health
		else:
			health += 10
	set_health_bar()

func _on_timer_timeout():
	# damage_bar.value = health 
	var tween = create_tween()
	tween.tween_property(damage_bar,"value", health, 0.1)

func get_hurt():
	health -= 10
	set_health_bar()


'''
func _imput(event: InputEvent):
	if event.is_key_pressed(KEY_K):
		damage()

func damage():
	health -= 10
	if health <= 0:
		health = MAX_HEALTH
	set_health_bar()
'''
