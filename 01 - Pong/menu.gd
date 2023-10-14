extends Node

func _on_play_pressed():
	Global.new_game()
	get_tree().change_scene_to_file("res://game.tscn")

func _on_player_one_item_selected(index):
	Global.players[0] = index

func _on_player_two_item_selected(index):
	Global.players[1] = index
