extends Control

@export var cell_size = 40
@export var cell_padding = 20

@export var items_offset = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var items = get_children()
	var cell = 0;
	for item in items:
		if item is Button:
			continue
		item.setup(cell_size)
		item.position.x = items_offset + cell * (cell_size + cell_padding)
		item.position.y = 0
		cell += 1
	
	size = Vector2(items.size() * (cell_size + cell_padding), cell_size)


func _on_play_pressed() -> void:
	get_parent().play()


func _on_restart_pressed() -> void:
	get_parent().restart()
