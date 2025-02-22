extends Control

@onready var parent = get_parent()

func _get_drag_data(at_position: Vector2) -> Variant:
	var item_preview = parent.duplicate()
	item_preview.position.x = 0
	item_preview.position.y = 0
	
	var preview = Control.new()
	
	preview.add_child(item_preview)
	
	set_drag_preview(preview)
	
	return parent
