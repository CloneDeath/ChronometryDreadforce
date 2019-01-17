extends KinematicBody

var target = null;

func _physics_process(_delta):
	if (target == null): return;
	var dp = target.translation - self.translation;
	move_and_slide(dp.normalized() * .8);

func _process(_delta):
	if (target == null): return;
	$Sprite3D.frame = 1
	var dp = target.translation - self.translation;
	if (dp.x < 0):
		$Sprite3D.scale.x = -1;
	else:
		$Sprite3D.scale.x = 1;

func damage():
	queue_free();

func _on_DetectionRadius_body_entered(body: PhysicsBody):
	if (body.is_in_group("player")):
		target = body;
