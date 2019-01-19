extends KinematicBody

var speed = 2;
var Bullet = preload("res://Player/Bullet.tscn");
var facing = Vector3(1, 0, 0);
var dead = false;

func _process(_delta):
	if (dead):
		$Sprite.frame = 1;
	else:
		$Sprite.frame = 0;

func _physics_process(_delta):
	if (dead): return;
	execute_movement();
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance();
		bullet.source = self;
		bullet.velocity = facing.normalized() * 8;
		bullet.translation = self.translation;
		get_parent().add_child(bullet);

func execute_movement():
	var up = Input.is_action_pressed("move_up");
	var down = Input.is_action_pressed("move_down");
	var left = Input.is_action_pressed("move_left");
	var right = Input.is_action_pressed("move_right");
	var move = Vector3();
	move.x = -int(left)+int(right);
	move.y = -1;
	move.z = -int(up)+int(down);
	move = move_and_slide(move.normalized() * speed);
	if (move.length() > 0): facing = move;

func damage():
	dead = true;