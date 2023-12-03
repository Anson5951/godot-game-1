extends PanelContainer

var aa = Vector2(1,2)

func _get_drag_data(at_position):
	if has_node("Sprite2D"):
		var texture = TextureRect.new()
		texture.texture = $Sprite2D.texture
		texture.scale = $Sprite2D.scale
		set_drag_preview(texture)
		return true
	pass
