extends Control

var timer = 0

func _process(delta):
	update_money_label()
	update_hitpoints_label()
	update_stamina_label()
	timer_grow()

	if(PlayerVariables.stamina < 100):
		restore_stamina()
	if(timer > 200):
		taxing()
		
		timer = 0
		$tax_timer.text = ""
	if(PlayerVariables.money < 0):
		game_over()

func game_over():
	print("VESZTETTÉL")
	PlayerVariables.money = 50
	_on_Button_pressed()

func timer_grow():
	timer += 1
	if(timer % 12 == 0):
		$tax_timer.text += "-"

func restore_stamina():
	PlayerVariables.stamina += 0.07

func taxing():
	PlayerVariables.money -= 2
	
func collecting_money():
	PlayerVariables.money += 1

func update_money_label():
	$MoneyLabel.text = "Money: " + str(PlayerVariables.money)

func update_hitpoints_label():
	$Hitpoints.text = "Hitpoints: " + str(PlayerVariables.hitpoints)

func update_stamina_label():
	$Stamina.text = "Stamina: " + str(int(PlayerVariables.stamina))

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainScenes/MainMenu.tscn")


func _on_test_button_pressed():
	if(PlayerVariables.stamina > PlayerVariables.hit_cost):
		collecting_money()
		PlayerVariables.stamina -= PlayerVariables.hit_cost

func _on_Button2_body_entered(body):
	PlayerVariables.emit_pressed()
	
func _on_Button2_body_exited(body):
	pass
