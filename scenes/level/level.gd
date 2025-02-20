extends Node2D

@export var shooter: Node2D
@export var hostages: Array
@export var enemies: Array

# State machine for the level
enum State {SETUP, SIMULATE}
var state = State.SETUP

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Restarts the level when player presses 'R'
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	match state:
		State.SETUP:
			# Handle placing/moving objects here
			# Shoot when the player ends the setup phase
			if Input.is_action_just_pressed("ui_accept"): # we can change the key for this later
				shooter.shoot()
		State.SIMULATE:
			# Don't let the player move or place objects
			# At end of bullet's lifetime (we still need to determine when that is),
			# destroy the bullet and check if all enemies are dead and no hostages are dead.
			# If that's the case, the level is completed, otherwise show a lose screen with option to reset.
			# If the level is completed, give option to move directly to next level or 
			# return to level select with the next level unlocked.
			pass
