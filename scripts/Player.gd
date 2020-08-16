extends KinematicBody2D

export var speed = 500
export var gravity = 700


func _process(delta):
	
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
	   velocity.x += 1
	if Input.is_action_pressed("ui_left"):
	   velocity.x -= 1
	
	velocity.y = delta * gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		$Hyena.visible = false
		$AnimatedSprite.visible = true
	else:
		$AnimatedSprite.stop()
		$Hyena.visible = true
		$AnimatedSprite.visible = false
	
	position += velocity * delta
	
	
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x > 0
		$Hyena.flip_h = velocity.x > 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
		
