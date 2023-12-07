extends Area2D

# pad中一小格的長寬
var grip_step = 27
# 元素被拉進來時能坐落的位置
# 依序是左上、右上、左下、右下、正中間
var positions = [
	Vector2(grip_step * -1, grip_step * -1),
	Vector2(grip_step * 1, grip_step * -1),
	Vector2(grip_step * -1, grip_step * 1),
	Vector2(grip_step * 1, grip_step * 1),
	Vector2.ZERO
]
# 紀錄放在此pad上的元素
var placed_element_names = []
# 紀錄下一個要放在第幾個位置
var placing_index = 0
# 紀錄是否已經放滿5個元素
var is_posistions_full = false
# 小夫 我進來囉
var is_mouse_entered = false
# 用於通知行動區有元素已經被成功放置了
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
		placed_element_names.append(element.name.get_basename())
		placing_index = placing_index + 1
		is_posistions_full = placing_index == 5
		is_mouse_entered = false
		return true
	else:
		return false
