extends CanvasLayer

@onready var p0ScoreLabel: Label = $P0ScoreLabel
@onready var p1ScoreLabel: Label = $P1ScoreLabel
@onready var countdownPanel: PanelContainer = $Countdown
@onready var countdownLabel: Label = $Countdown/MarginContainer/Countdown

func _ready():
	Global.round_setup.connect(_on_round_setup)
	Global.round_start.connect(_on_round_start)

func _on_round_setup():
	countdownPanel.visible = true

func _on_round_start():
	countdownPanel.visible = false

func _process(delta):
	p0ScoreLabel.text = str(Global.scores[0])
	p1ScoreLabel.text = str(Global.scores[1])
	countdownLabel.text = str(ceil(get_parent().timer.time_left))
	$Pause.visible = get_tree().paused

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused

func _on_restart_pressed():
	Global.new_game()
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	get_tree().paused = false

func _on_resume_pressed():
	get_tree().paused = false
