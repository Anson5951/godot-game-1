extends Area2D

@export var is_drag = false
@export var is_drop = false
@export var is_placed = false
@export var initial_position = self.position

func _process(delta):
	if is_drag:
		position = get_global_mouse_position()
	if is_drop and ! is_placed:
		position = initial_position

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		is_drag = event.is_pressed()
		is_drop = event.is_released()
	
