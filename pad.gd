extends Area2D

var grip_step = 27;
var positions = [
	Vector2(grip_step * -1, grip_step * -1),
	Vector2(grip_step * 1, grip_step * -1),
	Vector2(grip_step * -1, grip_step * 1),
	Vector2(grip_step * 1, grip_step * 1),
	Vector2.ZERO
];
var initial_positions = [
	Vector2(64, 192),
	Vector2(64 + 128, 192),
	Vector2(64 + 128 * 2, 192),
	Vector2(64 + 128 * 3, 192),
	Vector2(64 + 128 * 4, 192),
]

var test_elements = []
var placing_index = 0
var is_posistions_full = false
var can_place_element = false
#
func _init():
	var my_lambda = func (message):
		print(message)


func _ready():
	mouse_entered.connect(func(): can_place_element = !is_posistions_full)
	test_elements = [
		$"../fire",
		$"../fire2",
		$"../fire3",
		$"../fire4",
		$"../fire5"
	]
	for index in test_elements.size():
		init_element_iniial_position(test_elements[index], index)

func init_element_iniial_position(element, index):
	element.initial_position = initial_positions[index]

func print_my_shit():
	print('asd')

func _process(delta):	
	for index in test_elements.size():
		check_placing_element(test_elements[index], index)

func check_placing_element(element, index):
	if  element.is_drop and ! element.is_placed and overlaps_area(element) and can_place_element:
		element.scale = Vector2(0.43,0.43)
		element.position = self.position+positions[placing_index]
		element.z_index = placing_index
		element.input_pickable = false
		element.is_drag = false
		element.is_placed = true
		placing_index = placing_index + 1
		is_posistions_full = placing_index == 5
		can_place_element = false
