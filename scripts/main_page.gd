extends Node2D

@onready var play = $Play

# put focus on play button
func _ready():
	play.grab_focus()

# Play button
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels_page.tscn")

# Quit button
func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	get_node("Paralax BG").scroll_offset.x -= 100 * delta

