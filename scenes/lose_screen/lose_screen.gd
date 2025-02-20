extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Restart Level Button restarts current level
func _on_restart_level_pressed() -> void:
	pass

# Quit To Menu Button returns player to Title Screen
func _on_quit_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
