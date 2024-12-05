extends CharacterBody2D

const SPEED := 120.0
const JUMP_VELOCITY := -300.0
const GROUND_ACCELERATION := 6.0
const GROUND_DECCELERATION := 8.0
const AIR_ACCELERATION := 10.0
const AIR_DECCELERATION := 3.0
const COYOTE_TIME := 0.1

enum STATES { IDLE, RUN, JUMP, SLIDE }

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var state := STATES.IDLE
var coyote_timer := 0.0
var has_jumped := false
var is_falling := false
var facing := 1 # 1 is right, -1 is left

func move():
	var direction = Input.get_axis("move_left", "move_right")
	var velocity_change_speed := 0.0
	if direction:
		velocity_change_speed = GROUND_ACCELERATION if is_on_floor() else AIR_ACCELERATION
	else:
		velocity_change_speed = GROUND_DECCELERATION if is_on_floor() else AIR_DECCELERATION
	velocity.x = move_toward(velocity.x, direction * SPEED, velocity_change_speed)

func handle_variable_jump_height():
	var is_going_up = velocity.y < 0 and !is_on_floor()
	if Input.is_action_just_released("jump") and is_going_up:
		velocity.y = 0

func handle_start_jump(delta: float):
	if is_on_floor():
		coyote_timer = 0.0
		has_jumped = false
	else:
		coyote_timer += delta

	if Input.is_action_just_pressed("jump") and coyote_timer < COYOTE_TIME and not has_jumped:
		velocity.y = JUMP_VELOCITY
		has_jumped = true
		state = STATES.JUMP

func _physics_process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		var g = gravity if state != STATES.SLIDE else gravity * 0.25
		velocity.y += g * delta

	if velocity.y > 0:
		is_falling = true
	else:
		is_falling = false

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	if abs(direction) > 0:
		facing = direction
	# Flip the sprite
	if facing > 0:
		animated_sprite.flip_h = false
	elif facing < 0:
		animated_sprite.flip_h = true

	match state:
		STATES.IDLE:
			# Switch to idle state after landing
			if is_on_floor():
				if direction == 0 && velocity.x == 0:
					animated_sprite.play("idle")
				else:
					state = STATES.RUN
			handle_start_jump(delta)
		STATES.RUN:
			if is_on_floor():
				if direction != 0:
					animated_sprite.play("run")
				elif direction == 0 && velocity.x == 0:
					state = STATES.IDLE
			move()
			handle_start_jump(delta)
		STATES.JUMP:
			handle_variable_jump_height()
			if is_on_wall_only() && is_falling:
				state = STATES.SLIDE
			if !is_on_floor():
				animated_sprite.play("jump")
			else:
				state = STATES.IDLE
			move()
		STATES.SLIDE:
			if not is_on_wall_only():
				state = STATES.RUN
			if is_on_floor():
				state = STATES.IDLE
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMP_VELOCITY * 0.75
				velocity.x = JUMP_VELOCITY * 0.75 * facing
				facing = -facing
				state = STATES.JUMP
			move()

	move_and_slide()
