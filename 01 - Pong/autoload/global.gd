extends Node

signal round_setup
signal round_start

class Game:
	var scores: Array(2)
	var starting_player: int

var current_game

var timer: SceneTreeTimer

func new_game():
	current_game = game.clone()

func setup_round():
	round_setup.emit()
	timer = get_tree().create_timer(3)
	timer.timeout.connect(_on_countdown_timeout)

func player_scored(number: int):
	scores[number] += 1
	starting_player = (number + 1) % 2

func _on_countdown_timeout():
	round_start.emit()
