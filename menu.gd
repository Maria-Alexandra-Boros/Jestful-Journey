extends Control

func _on_StartB_pressed():
	get_tree().change_scene("res://tutorial.tscn")


func _on_QuitB_pressed():
	get_tree().quit()
