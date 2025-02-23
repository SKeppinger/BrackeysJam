extends Control

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is not Dictionary: 
		return false
	return data.scene is PackedScene or data.scene is Node2D

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data.scene is PackedScene:
		# Create a new version of the dragged object and place it in the scene
		var item = data.scene.instantiate()
		if item.name == "Portal":
			var item_partner = data.scene.instantiate()
			#This is some self referential bs
			item.partner = item_partner
			item_partner.partner = item
			item_partner.position = at_position + Vector2(0,30)
			item_partner.angle = data.rotation
			item.angle = data.rotation
			add_child(item_partner)
		item.position = at_position
		item.rotation = data.rotation
		add_child(item)
	elif data.scene is Node2D:
		# If the scene is a node 2d then just move it to the cursors position
		data.scene.position = at_position
