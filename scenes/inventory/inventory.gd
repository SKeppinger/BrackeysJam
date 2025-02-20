extends Control


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Dictionary

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var item = data.scene.instantiate()
	# Use offset passed by dragged data to position where preview is shown
	item.position = at_position - data.offset
	add_child(item)
