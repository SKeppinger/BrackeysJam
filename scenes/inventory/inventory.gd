extends Control

@export var cell_size = 40

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var items = get_children()
	var cell = 0;
	for item in items:
		item.setup(cell_size)
		item.position.x = cell * cell_size
		cell += 1
	
	size = Vector2(items.size() * cell_size, cell_size)
