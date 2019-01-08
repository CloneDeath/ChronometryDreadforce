extends KinematicBody2D

var speed = 20;

func _physics_process(_delta):
	execute_movement();

func execute_movement():
	var up = Input.is_action_pressed("move_up");
	var down = Input.is_action_pressed("move_down");
	var left = Input.is_action_pressed("move_left");
	var right = Input.is_action_pressed("move_right");
	var move = Vector2();
	move.x = -int(left)+int(right);
	move.y = -int(up)+int(down);
	move = move_and_slide(move * speed);