extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(func(): reset())

func reset():
	print('reset')
	get_tree().reload_current_scene()
