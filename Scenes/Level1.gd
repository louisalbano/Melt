extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
	var in_shadow = space_state.intersect_ray(get_node("Player").position, get_node("Light2D").position, [get_node("Player")])
	# TODO: update to fire signal to lower health bar
	if in_shadow:
		print("we good")
	else:
		print("it burns")
