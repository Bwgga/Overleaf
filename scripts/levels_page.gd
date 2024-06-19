extends Node2D


func _on_demo_level_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_lvl.tscn")
