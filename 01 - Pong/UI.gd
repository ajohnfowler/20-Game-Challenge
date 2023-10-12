extends CanvasLayer

@onready var p0ScoreLabel: Label = $P0ScoreLabel
@onready var p1ScoreLabel: Label = $P1ScoreLabel
@onready var countdownPanel: PanelContainer = $PanelContainer
@onready var countdownLabel: Label = $PanelContainer/MarginContainer/Countdown

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
	countdownLabel.text = str(ceil(Global.timer.time_left))
