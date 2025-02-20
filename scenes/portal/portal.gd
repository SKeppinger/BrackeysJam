extends Area2D
class_name Portal

@export var angle: float
@export var partner: Portal

var arrow

# Called when the node enters the scene tree for the first time.
func _ready():
	arrow = $RayCast2D
	arrow.rotation_degrees = angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("bullet"):
		body.global_position = partner.arrow.global_position
		body.global_position += partner.arrow.target_position * partner.scale.x
		body.rotation = partner.arrow.rotation + deg_to_rad(180)
		var dir = partner.arrow.target_position - partner.arrow.position
		body.velocity = body.velocity.length() * dir.normalized()
