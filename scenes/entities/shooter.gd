extends Area2D

@export var bullet_spawn : PackedScene
var bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	shoot()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("bullet"):
		queue_free()

func shoot():
	bullet = bullet_spawn.instantiate()
	get_tree().current_scene.add_child.call_deferred(bullet)
	bullet.global_position = $bullet_exit_point.global_position
	bullet.rotation = rotation
