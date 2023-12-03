extends Node2D

var initial_positions = [
	Vector2(64, 192),
	Vector2(64 + 128, 192),
	Vector2(64 + 128 * 2, 192),
	Vector2(64 + 128 * 3, 192),
	Vector2(64 + 128 * 4, 192),
]
var elements_names = [
	"res://dark.tscn",
	"res://fire.tscn",
	"res://heart.tscn",
	"res://light.tscn",
	"res://none.tscn",
	"res://water.tscn",
	"res://wind.tscn"
]
var pads = []
var element_in_ready_area = []
var element_in_queue = []
var rng = RandomNumberGenerator.new()

func _ready():
	prepare_pads()
	generate_element_in_ready_area()
	generate_element_in_queue()

func prepare_pads():
	pads = [
		$"pad1",
		$"pad2",
		$"pad3",
		$"pad4",
		$"pad5",
	]
func init_element_iniial_position(element, position_index):
	element.position = initial_positions[position_index]
	element.initial_position = initial_positions[position_index]

func _process(delta):
	pass

func generate_element_in_ready_area():
	print('generate_element_in_ready_area')
	for index in 5:
		print(index)
		var random_element_index = rng.randi_range ( 0, 6 )
		var new_element = load(elements_names[random_element_index]).instantiate()
		new_element.set_script(load("res://element.gd"))
		new_element.z_index = 6
		init_element_iniial_position(new_element, index)
		add_child(new_element)
		element_in_ready_area.append(new_element)

func generate_element_in_queue():
	print('generate_element_in_queue')
	for index in 25:
		var random_element_index = rng.randi_range ( 0, 6 )
		var new_element = load(elements_names[random_element_index]).instantiate()
		new_element.set_script(load("res://element.gd"))
		new_element.z_index = 6
		element_in_queue.append(new_element)

func _on_pad_element_placed(input):
	print('_on_pad_element_placed')
	var index_of_placed_pad = pads.find(input['placed_pad'])
	var placed_pad = pads[index_of_placed_pad]
	add_new_element_into_ready_area(input['used_element_index'])

func add_new_element_into_ready_area(used_element_index):
	print('add_new_element_into_ready_area')
	var new_element = element_in_queue[0]
	element_in_ready_area[used_element_index] = new_element
	add_child(new_element)
	init_element_iniial_position(new_element, used_element_index)
	element_in_queue.pop_at(0)
	
	
	
	
	
	
	
	
	
	
	
