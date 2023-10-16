extends Node

@onready var timer: Timer = $Timer

func _ready():
	Global.round_setup.connect(_on_round_setup)
	
	Global.setup_round()
	
func _on_round_setup():
	timer.start()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused

func _on_timer_timeout():
	Global.start_round()
