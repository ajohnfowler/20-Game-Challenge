extends Node

@export var paddle: PackedScene
var paddles = []
@onready var spawns = [$Spawn0, $Spawn1]

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_paddle(0)
	spawn_paddle(1)
	
func spawn_paddle(number:int):
	var new_paddle = paddle.instantiate()
	new_paddle.global_position = spawns[number].global_position
	new_paddle.number = number
	add_child(new_paddle)
