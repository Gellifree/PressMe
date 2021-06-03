extends KinematicBody2D

export var MOVE_SPEED = 250

func _ready():
	connect("hit_once", self, "hit")

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector2() ## x, y
	
	if Input.is_action_pressed("attack"):
		if(PlayerVariables.finnished == true and PlayerVariables.stamina > PlayerVariables.hit_cost):
			$Tool/Animation/AnimationPlayer.play("attack")
			if(PlayerVariables.once == false):
				hit()
				

	
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
		$Tool.scale = Vector2(1,1)
		$Tool.position = Vector2(15, 0)
		
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("Run")
		$Tool.scale = Vector2(-1,1)
		$Tool.position = Vector2(-15, 0)
	direction = direction.normalized()
	move_and_collide(direction * MOVE_SPEED * delta)
	if(direction == Vector2.ZERO):
		$AnimatedSprite.play("Idle")
		pass
		
func hit():
	if(PlayerVariables.stamina > PlayerVariables.hit_cost and PlayerVariables.finnished == true):
		PlayerVariables.stamina -= PlayerVariables.hit_cost
		PlayerVariables.stamina_used += PlayerVariables.hit_cost
	PlayerVariables.once = true

