extends Node

signal round_setup
signal round_start

var scores = [0,0]
var starting_player = 0
var players = [0,0]
var timer: SceneTreeTimer

func new_game():
	scores = [0,0]
	starting_player = 0

func setup_round():
	round_setup.emit()
	timer = get_tree().create_timer(3)
	timer.timeout.connect(_on_countdown_timeout)

func player_scored(number: int):
	scores[number] += 1
	starting_player = (number + 1) % 2

func _on_countdown_timeout():
	round_start.emit()
