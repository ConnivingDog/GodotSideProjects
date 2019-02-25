extends AnimatedSprite

var taken = false

func _on_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up()
		$AnimationPlayer.play("die")
		$CoinSFX.play()


func die():
	queue_free()
