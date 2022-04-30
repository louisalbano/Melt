extends KinematicBody2D

var velocity = Vector2(0,0)
const GRAVITY = 4000.0
var jump_speed = -1200
var move_speed = 500
const UP = Vector2(0,-1)
var in_shadow = 0

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("right"):
		velocity.x = move_speed
	if Input.is_action_pressed("left"):
		velocity.x = -move_speed
		
	move_and_slide(velocity, UP)
	print(get_slide_collision(1))
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
			
		if is_on_wall():
			velocity.y = jump_speed
			
			velocity.x = jump_speed + 10
	
	velocity.x = lerp(velocity.x, 0, 0.06)
	
	


func _on_Shadow_body_entered(_body):
	print('shadow relm')
	in_shadow = 1


func _on_Shadow_body_exited(_body):
	print('yuh')
	in_shadow = 0
