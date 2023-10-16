extends CharacterBody2D

@export var number: int = 0
@export var speed = 10000.0

var direction: int = 0

func _physics_process(delta):
	if Global.players[number]:
		_get_ai_direction()
	else:
		_get_input_direction()
	
	if direction:
		velocity.y = direction * speed * delta
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	velocity.x = 0
	move_and_slide()

func _get_input_direction():
	direction = Input.get_axis("p"+str(number)+"_up", "p"+str(number)+"_down")

func _get_ai_direction():
	direction = 0
	var balls = get_tree().get_nodes_in_group("ball")
	if balls.size() <= 0:
		return
	if global_position.y > balls[0].global_position.y + 20:
		direction = -1
	elif global_position.y < balls[0].global_position.y - 20:
		direction = 1
