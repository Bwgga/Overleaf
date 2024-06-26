extends Area2D

@onready var secret_tile_map = $"../SecretTileMap"

# showing what's in the secret area
func _on_body_entered(body):
	# secret_tile_map.visible = false
	var tween = create_tween()
	tween.tween_property(secret_tile_map,"modulate", Color(1.0, 1.0, 1.0, 0.0), 0.4) #transparent

# hiding what's in the secret area
func _on_body_exited(body):
	# secret_tile_map.visible = true
	var tween = create_tween()
	tween.tween_property(secret_tile_map,"modulate", Color(1.0, 1.0, 1.0, 1.0), 0.4) #visible
