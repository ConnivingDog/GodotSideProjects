extends AnimatedSprite

func _on_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("die")

func die():
	queue_free()
