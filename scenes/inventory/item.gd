extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	# Modify the size vector to change scale of preview
	preview_texture.size = size
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	# Align the preview with the position of the item being clicked 
	# relative to the cursor
	preview_texture.position.x = -at_position.x
	preview_texture.position.y = -at_position.y
	
	set_drag_preview(preview)
	queue_free()
	
	var scene = PackedScene.new()
	var result = scene.pack(self)
	if result == OK:
		return { "scene": scene, "offset": at_position }
	
	return null
