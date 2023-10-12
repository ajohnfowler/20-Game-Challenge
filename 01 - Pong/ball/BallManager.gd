extends Node

@onready var spawns = [$Spawn0, $Spawn1]

@export var ball: PackedScene
var balls = []

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
	var new_ball = ball.instantiate()
	new_ball.setup(position, velocity, moving)
	new_ball.out.connect(_on_ball_out.bind(new_ball))
	balls.append(new_ball)
	add_child(new_ball)

func _on_ball_out(node: CharacterBody2D):
	balls.erase(node)
	if node.velocity.x > 0:
		Global.player_scored(0)
	else:
		Global.player_scored(1)
	if balls.size() == 0:
		Global.setup_round()
