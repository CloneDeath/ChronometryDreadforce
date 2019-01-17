extends Area

var source = null;
var velocity = Vector3();

func _physics_process(delta):
	self.translation += velocity * delta;

func _on_Bullet_body_entered(body):
	if (body == source): return;
	if (body.has_method("damage")):
		body.damage();
	self.queue_free();
