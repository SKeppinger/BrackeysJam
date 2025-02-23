extends Control

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is PackedScene or data is Node2D

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is PackedScene:
		# Create a new version of the dragged object and place it in the scene
		var item = data.instantiate()
		if item.name == "Portal":
			var item_partner = data.instantiate()
			#This is some self referential bs
			item.partner = item_partner
			item_partner.partner = item
			item_partner.position = at_position + Vector2(0,30)
			item_partner.angle = 0
			add_child(item_partner)
		item.position = at_position
		add_child(item)
	elif data is Node2D:
		# If the scene is a node 2d then just move it to the cursors position
		data.position = at_position
