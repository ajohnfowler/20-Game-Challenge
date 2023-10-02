extends Node

@onready var spawns = [$Spawn0, $Spawn1]

@export var ball: PackedScene
var ball_node

@onready var ball_position = spawns[0]
var directions = [1,-1]
var ball_direction = directions[0]

func _ready():
	Global.round_setup.connect(_on_round_setup)

func _on_round_setup():
	var spawn_position = spawns[Global.starting_player].global_position
	var spawn_velocity = Vector2(directions[Global.starting_player],1) * 200.0
	add_ball(spawn_position, spawn_velocity, false)

func add_ball(position, velocity, moving):
	ball_node = ball.instantiate()
	ball_node.setup(position, velocity, moving)
	ball_node.out.connect(_on_ball_out)
	add_child(ball_node)

func _on_ball_out(side: String):
	match side:
		"left":
			Global.scores[1] += 1
		"right":
			Global.scores[0] += 1
	if get_tree().get_nodes_in_group("ball").size() == 0:
		Global.setup_round()
