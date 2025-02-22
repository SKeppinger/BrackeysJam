extends CharacterBody2D

@export var dir = 0
@export var SPEED = 400.0
@onready var line = $Line2D
@onready var line2 = $Line2D2
@onready var point = $Node2D
@onready var ray = $RayCast2D

const MAX_LEN = 2000

func _ready() -> void:
	velocity = (point.position.rotated(global_rotation)).normalized() * SPEED
	rotation = global_rotation

func _process(delta: float) -> void:
	line.clear_points()
	line.add_point(Vector2.ZERO)
	ray.global_position = global_position
	ray.target_position = (point.position).normalized() * MAX_LEN
	ray.force_raycast_update()
	if ray.is_colliding():
		var col_point = ray.get_collision_point()
		var line_len = calc_length(col_point - global_position)
		var normal = ray.get_collision_normal()
		line.add_point(to_local(col_point))
		ray.global_position = col_point
		var target_ray = (col_point - global_position).bounce(normal).normalized() * (103 - line_len)
		ray.target_position = target_ray + col_point
		line.add_point(to_local(ray.target_position))
		ray.force_raycast_update()
	else:
		line.add_point(ray.target_position)
		print(global_position)
		print(to_global(ray.target_position))
		print(calc_length(to_global(ray.target_position) - global_position))

func _physics_process(delta: float) -> void:
	velocity += get_gravity() # for the gravity well, default is 0 so it won't affect the bullet if there is no gravity well
	# stop velocity from changing using gravity
	if velocity.length() > SPEED * 1.5:
		velocity = velocity.normalized() * SPEED * 1.5
	var collision = move_and_collide(velocity * delta)
	if collision and collision.get_collider().is_in_group("bouncer"):
		var normal = collision.get_normal()
		velocity = velocity.bounce(normal)
	elif collision:
		queue_free()
	rotation = velocity.angle() + PI / 2

func calc_length(temp: Vector2) -> float:
	return sqrt(pow(temp.x, 2) + pow(temp.y, 2))
