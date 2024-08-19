extends State
class_name PlayerJump

@export var player : CharacterBody2D

var move_direction : Vector2

func handle_variable_jump_height():
	var is_going_up = player.velocity.y < 0 and !player.is_on_floor()
	if Input.is_action_just_released("jump") and is_going_up:
		player.velocity.y = 0

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
	#handle_variable_jump_height();
	#player.move()
	#if !player.is_on_floor():
		#player.animated_sprite.play("jump")
	#else:
		#Transitioned.emit(self, "idle")
