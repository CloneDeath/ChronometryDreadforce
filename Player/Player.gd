extends KinematicBody

var speed = 2;
var Bullet = preload("res://Player/Bullet.tscn");
var facing = Vector3(1, 0, 0);
var dead = false;
var velocity = Vector3(0, 0, 0);
const GRAVITY = 9.8;

func _process(_delta):
	if (dead):
		$Sprite.frame = 1;
	else:
		$Sprite.frame = 0;

func _physics_process(delta):
	execute_gravity(delta);
	if (dead): return;
	execute_movement();
	execute_shooting();

func execute_gravity(delta):
	if (is_on_floor()):
		velocity = Vector3(0, 0, 0);
	else:
		velocity.y -= GRAVITY * delta;
	var dp = velocity + (get_movement_vector() * speed);
	dp = move_and_slide(dp, Vector3(0, 1, 0));

func execute_shooting():
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance();
		bullet.source = self;
		bullet.velocity = facing.normalized() * 8;
		bullet.translation = self.translation;
		get_parent().add_child(bullet);

func execute_movement():
	var move = get_movement_vector();
	if (move.length() > 0): facing = move;

func get_movement_vector():
	var up = Input.is_action_pressed("move_up");
	var down = Input.is_action_pressed("move_down");
	var left = Input.is_action_pressed("move_left");
	var right = Input.is_action_pressed("move_right");
	var move = Vector3(0, 0, 0);
	move.x = -int(left)+int(right);
	move.z = -int(up)+int(down);
	return move.normalized();

func damage():
	dead = true;