extends State
class_name PlayerIdle

@export var player : CharacterBody2D

var move_direction : Vector2

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
	# Get the input direction: -1, 0, 1
	#var direction = Input.get_axis("move_left", "move_right")
#
	#if player.is_on_floor():
		#if direction == 0 && player.velocity.x == 0:
			#player.animated_sprite.play("idle_icecream")
		#else:
			#Transitioned.emit(self, "run")
	#
	## We jump
	#if Input.is_action_just_pressed("jump") and player.is_on_floor():
		#player.velocity.y = player.JUMP_VELOCITY
		#Transitioned.emit(self, "jump")
	#if Input.is_action_just_pressed("jump") and !player.is_on_floor():
		#player.jump_buffer_timer.start()
#
	#if player.is_on_floor() and !player.jump_buffer_timer.is_stopped():
		#player.velocity.y = player.JUMP_VELOCITY
