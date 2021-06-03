extends Area2D

func _ready():
	pass

func _process(delta):
	if(PlayerVariables.pressed == true):
		PressMe()
		PlayerVariables.pressed = false

func PressMe():
	$AnimationPlayer.play("Pressed")
	PlayerVariables.money += 1
	PlayerVariables.money_grow += 1
	
func placeAtRandomPosition():
	global_position.x = rand_range(50,820)
	global_position.y = rand_range(50,500)



func _on_AnimationPlayer_animation_finished(anim_name):
	placeAtRandomPosition()
