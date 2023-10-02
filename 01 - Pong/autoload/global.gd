extends Node

signal round_setup
signal round_start

var starting_player = 0
var scores = [0,0]

var timer: SceneTreeTimer

func setup_round():
	round_setup.emit()
	timer = get_tree().create_timer(3)
	timer.timeout.connect(_on_countdown_timeout)
	
func _on_countdown_timeout():
	round_start.emit()
