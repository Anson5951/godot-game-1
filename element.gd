extends Area2D

# 是否正在被滑鼠抓著
@export var is_drag = false
# 是否沒有被滑鼠抓著
@export var is_drop = false
# 是否已經被放在pad上
@export var is_placed = false
# 回歸座標，被亂拖動時要回復的座標
@export var initial_position = self.position

func _process(delta):
	if is_drag:
		# 位置會跟著滑鼠跑
		position = get_global_mouse_position()
	if is_drop and ! is_placed:
		# 被放下後如鬼沒有放在pad裡的話，要回到回歸座標
		position = initial_position

# 監聽拖拉事件
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		is_drag = event.is_pressed()
		is_drop = event.is_released()
	
