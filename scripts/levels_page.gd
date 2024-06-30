extends Node2D

# demo level button
func _on_demo_level_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_lvl.tscn")

# level 1 button
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
