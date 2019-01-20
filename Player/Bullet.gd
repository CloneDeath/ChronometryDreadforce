extends Area

var source = null;
var velocity = Vector3();
var life = 5;

func _physics_process(delta):
	var dp = velocity * delta;
	self.translation += dp;
	self.life -= dp.length();
	if (self.life <= 0):
		self.queue_free();

func _on_Bullet_body_entered(body):
	if (body == source): return;
	if (body.has_method("damage")):
		body.damage();
	self.queue_free();
