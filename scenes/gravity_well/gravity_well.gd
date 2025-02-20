extends Node2D

@export var gravity_strength: float

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.gravity = gravity_strength
	$Area2D.gravity_point_unit_distance = 1024
	$Area2D.gravity_space_override = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
