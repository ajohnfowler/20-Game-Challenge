extends CharacterBody2D

@export var number: int = 0

const SPEED = 300.0

func _physics_process(delta):
	
	var direction = Input.get_axis("p"+str(number)+"_up", "p"+str(number)+"_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
