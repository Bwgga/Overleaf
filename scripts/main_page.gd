extends Node2D


# Play button
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels_page.tscn")

# Quit button
func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	get_node("Paralax BG").scroll_offset.x -= 100 * delta

