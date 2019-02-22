extends AnimatedSprite

func update(motion):
	if motion.x > 0:
		flip_h = false
		play("walk")
	elif motion.x < 0:
		flip_h = true
		play("walk")
	elif motion.y > 0: #actually plays animation when falling. '>' for when jumping up.
		play("jump")
	elif motion.y < 0: #actually plays animation when jumping up. '>' for when falling.
		play("jump")
	else:
		play("idle")