extends Area2D

var grip_step = 27;
var positions = [
	Vector2(grip_step * -1, grip_step * -1),
	Vector2(grip_step * 1, grip_step * -1),
	Vector2(grip_step * -1, grip_step * 1),
	Vector2(grip_step * 1, grip_step * 1),
	Vector2.ZERO
];
var placing_index = 0
var is_posistions_full = false
var is_mouse_entered = false
signal element_placed

func _ready():
	mouse_entered.connect(func(): is_mouse_entered = !is_posistions_full)

func _process(delta):	
	for index in get_parent().element_in_ready_area.size():
		if(check_placing_element(get_parent().element_in_ready_area[index], index)):
			element_placed.emit({"placed_pad": self, "used_element_index": index})

func check_placing_element(element, index):
	if  element.is_drop and ! element.is_placed and overlaps_area(element) and is_mouse_entered:
		element.scale = Vector2(0.43,0.43)
		element.position = self.position+positions[placing_index]
		element.z_index = placing_index
		element.input_pickable = false
		element.is_drag = false
		element.is_placed = true
		placing_index = placing_index + 1
		is_posistions_full = placing_index == 5
		is_mouse_entered = false
		return true
	else:
		return false
