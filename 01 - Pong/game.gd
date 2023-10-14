extends Node

func _ready():
	Global.setup_round()

func _on_restart_pressed():
	Global.new_game()
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	get_tree().paused = false

func _on_resume_pressed():
	get_tree().paused = true
