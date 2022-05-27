extends Button

onready var pause_popup = get_parent().get_parent().get_parent().get_parent().get_node("PausePopup")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_PauseResumeButton_focus_entered():
	margin_bottom -= 10

func _on_PauseResumeButton_focus_exited():
	margin_bottom += 10


func _on_PauseResumeButton_pressed():
	# hide popup and resume 
	pause_popup.hide()
	get_tree().paused = false


func _on_PauseQuitButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Menu.tscn")
