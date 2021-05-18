extends KinematicBody2D

export (int) var speed = 200

var chunk_preload = preload("res://models/chunk.tscn")
var velocity = Vector2()
var move_dir_y = "none"
var move_dir_x = "none"

func input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_down") or move_dir_y == "down":
		velocity.y += speed - speed / 3

	if Input.is_action_pressed("ui_up") or move_dir_y == "up":
		velocity.y -= speed - speed / 3

	if Input.is_action_pressed("ui_left") or move_dir_x == "left":
		velocity.x -= speed
		$"AnimatedSprite".animation = "move_left"

	elif Input.is_action_pressed("ui_right") or move_dir_x == "right":
		velocity.x += speed
		$"AnimatedSprite".animation = "move_right"

	elif $"AnimatedSprite".animation == "move_left":
		$"AnimatedSprite".animation = "idle_left"
		
	else:
		$"AnimatedSprite".animation = "idle_right"

func _physics_process(delta):
	input()
	velocity = move_and_slide(velocity)

func up_pressed():
	move_dir_y = "up"

func down_pressed():
	move_dir_y = "down"

func left_pressed():
	move_dir_x = "left"

func right_pressed():
	move_dir_x = "right"

func up_released():
	if move_dir_y == "up":
		move_dir_y = "none"

func down_released():
	if move_dir_y == "down":
		move_dir_y = "none"

func left_released():
	if move_dir_x == "left":
		move_dir_x = "none"

func right_released():
	if move_dir_x == "right":
		move_dir_x = "none"
