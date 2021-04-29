extends KinematicBody2D

var MOVE_SPEED = 250


func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector2() ## x, y
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		
		$AnimatedSprite.play("Run")
		
		
		
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		$AnimatedSprite.play("Run")
		
		$AnimatedSprite.set_flip_h(false)
		
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("Run")
		
		
		
	direction = direction.normalized()
	
	move_and_collide(direction * MOVE_SPEED * delta)
	
	
	#move_and_slide(direction * MOVE_SPEED * delta)
	
	if(direction == Vector2.ZERO):
		$AnimatedSprite.play("Idle")
		pass
