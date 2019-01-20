extends KinematicBody

var target = null;
const SPEED = 2.4;

func _physics_process(_delta):
	if (target == null): return;
	var dp = target.translation - self.translation;
	dp = move_and_slide(dp.normalized() * SPEED);

func _process(_delta):
	if (target == null): return;
	$Sprite3D.frame = 1
	var dp = target.translation - self.translation;
	if (dp.x < 0):
		$Sprite3D.scale.x = -1;
	else:
		$Sprite3D.scale.x = 1;
	if (dp.length() < 1.1):
		target.damage();

func damage():
	queue_free();

func _on_DetectionRadius_body_entered(body: Node):
	if (body.is_in_group("player")):
		target = body;
