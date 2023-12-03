extends Area2D

var isdrag = false
var inti_position = Vector2(506,446)

func _process(delta):
	
	if isdrag :
		position = get_global_mouse_position()
	elif overlaps_area($"../pad") and ! isdrag:
			print("13")
	else :
		position = inti_position
	pass
		
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			isdrag = true
		else :
			isdrag = false
		pass
	pass 
