extends KinematicBody2D

var Player = preload("res://Player/Player.tscn");
var target = null;

func _physics_process(delta):
	if (target == null): return;
	var dp = target.position - self.position;
	move_and_slide(dp.normalized() * 10);

func damage():
	queue_free();

func _on_DetectionRadius_body_entered(body: PhysicsBody2D):
	if (body.is_in_group("player")):
		target = body;
