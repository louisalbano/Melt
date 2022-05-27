extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_OptionsButton_focus_entered():
	margin_bottom -= 10

func _on_OptionsButton_focus_exited():
	margin_bottom += 10
