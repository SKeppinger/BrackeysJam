extends CharacterBody2D

const dir = 30
const SPEED = 400.0
#const JUMP_VELOCITY = 1.0

func _ready() -> void:
	var direction = Vector2.UP
	velocity = direction.rotated(dir * PI / 180) * SPEED
	rotation = dir * PI / 180

func _physics_process(delta: float) -> void:
	velocity += get_gravity() # for the gravity well, default is 0 so it won't affect the bullet if there is no gravity well
	# stop velocity from getting too fast using gravity
	if velocity.length() > SPEED * 1.5:
		velocity = velocity.normalized() * SPEED * 1.5
	var collision = move_and_collide(velocity * delta)
	if collision and collision.get_collider().is_in_group("bouncer"):
		var normal = collision.get_normal()
		velocity = velocity.bounce(normal)
	elif collision:
		queue_free()
	rotation = velocity.angle() + PI / 2
