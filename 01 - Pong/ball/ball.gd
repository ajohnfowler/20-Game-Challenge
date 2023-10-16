extends CharacterBody2D

signal out()

@export var is_moving = false

func _ready():
	Global.round_start.connect(_on_round_start)

func setup(starting_position, starting_velocity, start_moving):
	global_position = starting_position
	velocity = starting_velocity
	is_moving = start_moving
	
func _on_round_start():
	is_moving = true

func _physics_process(delta):
	if !is_moving: return
	var collision = move_and_collide(velocity * delta)
	if not collision: return
	velocity = velocity.bounce(collision.get_normal()) * 1.0

func _on_visible_on_screen_notifier_2d_screen_exited():
	out.emit()
	queue_free()
