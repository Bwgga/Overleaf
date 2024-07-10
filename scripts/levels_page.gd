extends Node2D

@onready var demo_level = $"Level Buttons/Demo Level"

# put focus on demo level button
func _ready():
	demo_level.grab_focus()

# demo level button
func _on_demo_level_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_lvl.tscn")

# level 1 button
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
