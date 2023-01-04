extends Node2D

signal player_in_shadow(in_shadow)

func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
	var in_shadow = space_state.intersect_ray(get_node("Player").position, get_node("Light2D").position, [get_node("Player")])
	# The player's health depletes faster when they're in sunlight
	emit_signal("player_in_shadow", in_shadow)
