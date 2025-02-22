extends Control

@export var item: PackedScene
@export var count = 1

func setup(cell_size) -> void:
	var item_preview = item.instantiate()
	size = Vector2(cell_size, cell_size)
	item_preview.position.x = cell_size/2
	item_preview.position.y = cell_size/2
	item_preview.find_child("draggable").mouse_filter = MOUSE_FILTER_IGNORE 
	add_child(item_preview)

func _get_drag_data(at_position: Vector2) -> Variant:
	var item_preview = item.instantiate()
	
	var preview = Control.new()
	preview.add_child(item_preview)
	
	set_drag_preview(preview)
	
	return item
