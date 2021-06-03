extends Node2D

signal attack_finnished

export(int) var damage = 1
func _ready():
	pass



func _process(delta):
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	PlayerVariables.finnished = true
	PlayerVariables.once = false
