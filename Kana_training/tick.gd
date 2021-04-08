extends RigidBody2D

func _process(delta):
	if self.global_position.y > 1400:
		self.queue_free()
#	print(self.global_position.y)
	get_node("Sprite").modulate.a = (get_node("Sprite").modulate.a - 0.01)
