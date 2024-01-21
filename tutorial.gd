extends Control

func _on_back_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_continue_pressed():
	get_tree().change_scene("res://lume1.tscn")
