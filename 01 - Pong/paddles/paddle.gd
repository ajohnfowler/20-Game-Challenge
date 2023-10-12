extends CharacterBody2D

@export var controllable = false
@export var number: int = 0
@export var speed = 500.0

func _physics_process(delta):
	
	if not controllable: return
	
	var direction = Input.get_axis("p"+str(number)+"_up", "p"+str(number)+"_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	velocity.x = 0

	move_and_slide()
