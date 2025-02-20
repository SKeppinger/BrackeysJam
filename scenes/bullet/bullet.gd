extends CharacterBody2D

const dir = 30
const SPEED = 200.0
#const JUMP_VELOCITY = 1.0

func _ready() -> void:
	var direction = Vector2.UP
	velocity = direction.rotated(dir * PI / 180) * SPEED
	rotation = dir * PI / 180

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var normal = collision.get_normal()
		velocity = velocity.bounce(normal)
		rotation = velocity.angle() + PI / 2
		print(rotation)
