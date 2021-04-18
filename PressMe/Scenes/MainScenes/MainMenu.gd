extends Control

func _ready():
	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/MainScenes/Arena.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/MainScenes/Options.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
