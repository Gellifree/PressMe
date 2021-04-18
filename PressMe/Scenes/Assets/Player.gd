extends KinematicBody2D

const MOVE_SPEED = 250

onready var raycast = $RayCast2D


func _ready():
	pass

func _physics_process(delta):
	var move_vec = Vector2()
	
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.play("Run")
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("Run")
	move_vec = move_vec.normalized()
	
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	if(move_vec == Vector2.ZERO):
		$AnimatedSprite.play("Idle")




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
