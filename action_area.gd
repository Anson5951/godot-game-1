extends Node2D

# 元素的起始位置
var initial_positions = [
	Vector2(64, 192),
	Vector2(64 + 128, 192),
	Vector2(64 + 128 * 2, 192),
	Vector2(64 + 128 * 3, 192),
	Vector2(64 + 128 * 4, 192),
]
# 7元素的檔案，用於生成元素
var elements_names = [
	"res://dark.tscn",
	"res://fire.tscn",
	"res://heart.tscn",
	"res://light.tscn",
	"res://none.tscn",
	"res://water.tscn",
	"res://wind.tscn"
]
var elements_ratio = [
	14,
	14,
	16,
	14,
	14,
	14,
	14
]
# 亂數生成器
var rng = RandomNumberGenerator.new()
# 會拖拉元素進去的地方
var pads = []
# 準備區的元素
var element_in_ready_area = []
# 列隊區的元素
var element_in_queue = []

# 起始函數
func _ready():
	prepare_pads()
	generate_element_in_ready_area()
	generate_element_in_queue()

# 取得pad的實例
func prepare_pads():
	pads = [
		$"pad1",
		$"pad2",
		$"pad3",
		$"pad4",
		$"pad5",
	]

# 建立一開始會出現的5個元素
func generate_element_in_ready_area():
	for index in 5:
		var random_element_index = radom_generate_element_index_by_ratio()
		var new_element = generate_element(random_element_index)
		# 設定元素的初始位置
		init_element_iniial_position(new_element, index)
		# 加入畫面中
		add_child(new_element, true)
		# 將生出的元素記錄在變數中
		element_in_ready_area.append(new_element)

# 因為一次戰鬥中最多只會用25個元素(不包含一開始就顯示的)
# 先亂數生成這25個元素，在之後顯示的元素被使用時，會依次加入畫面中
func generate_element_in_queue():
	for index in 25:
		var random_element_index = radom_generate_element_index_by_ratio()
		var new_element = generate_element(random_element_index)
		element_in_queue.append(new_element)

# 按照比例隨機選擇0~6之中的一個數字，用於生成新的元素
func radom_generate_element_index_by_ratio():
	var sum = elements_ratio.reduce(func(accum, number): return accum + number)
	var picked_number = rng.randi_range( 1, sum )
	for elements_ratio_index in elements_ratio.size():
		picked_number -= elements_ratio[elements_ratio_index]
		if picked_number <= 0:
			return elements_ratio_index
			
# 建立元素
func generate_element(index):
	# 將元素實例化
	var element = load(elements_names[index]).instantiate()
	# 並加入元素的腳本
	element.set_script(load("res://element.gd"))
	# 並設定Z軸高度
	element.z_index = 6
	return element
	
# 當元素被拉進pad時，會接收來自pad的訊號(Signal)
func _on_pad_element_placed(input):
	add_new_element_into_ready_area(input['used_element_index'])
#	未來可能會用到的參數
#	var index_of_placed_pad = pads.find(input['placed_pad'])
#	var placed_pad = pads[index_of_placed_pad]

# 把在element_in_queue等待建立的元素實例化並加進畫面中
func add_new_element_into_ready_area(used_element_index):
	# 取得列隊區排頭的元素
	var new_element = element_in_queue[0]
	# 把新元素放到預備區對應的順序
	element_in_ready_area[used_element_index] = new_element
	# 設定其座標
	init_element_iniial_position(new_element, used_element_index)
	# 加入畫面
	add_child(new_element, true)
	# 把列隊區排頭的元素幹掉
	element_in_queue.pop_at(0)
	
# 設定元素的初始座標
func init_element_iniial_position(element: Area2D, position_index: int):
	# 設定現在座標
	element.position = initial_positions[position_index]
	# 設定回歸座標
	element.initial_position = initial_positions[position_index]	
