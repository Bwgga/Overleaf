extends ParallaxBackground

var scrollspeed = 100

func _process(delta):
	scroll_offset.x -= scrollspeed * delta
