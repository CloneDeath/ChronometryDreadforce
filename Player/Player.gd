extends KinematicBody2D

var speed = 20;
var Bullet = preload("res://Player/Bullet.tscn");
var facing = Vector2(1, 0);

func _physics_process(_delta):
	execute_movement();
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance();
		bullet.source = self;
		bullet.velocity = facing.normalized() * 100;
		bullet.position = self.position;
		get_parent().add_child(bullet);

func execute_movement():
	var up = Input.is_action_pressed("move_up");
	var down = Input.is_action_pressed("move_down");
	var left = Input.is_action_pressed("move_left");
	var right = Input.is_action_pressed("move_right");
	var move = Vector2();
	move.x = -int(left)+int(right);
	move.y = -int(up)+int(down);
	move = move_and_slide(move.normalized() * speed);
	if (move.length() > 0): facing = move;