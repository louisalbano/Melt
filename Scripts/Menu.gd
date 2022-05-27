extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Menu/StartButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_OptionsButton_pressed():
	print('yeet')


func _on_QuitButton_pressed():
	get_tree().quit()
