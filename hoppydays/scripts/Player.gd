extends KinematicBody2D

var motion = Vector2()
var friction
#floor normal (up direction) default value
const UP = Vector2(0,-1)
const GRAVITY = 100
const ACCELERATION = 150
const MAX_SPEED = 750
const JUMP_HEIGHT = -1750



func _physics_process(delta):
	fall()
	run()
	#resets motion when collides
	motion = move_and_slide(motion,UP)
	
func _process(delta):
	update_animation()

func update_animation(motion):
	$Sprite.update(motion)
	
func fall():
	motion.y += GRAVITY
	friction = false
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

func run():
	#check project settings for keys associated with the ff actions
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		$Sprite.play("walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$Sprite.play("walk")
		motion.x -= ACCELERATION
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		$Sprite.play("idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	
