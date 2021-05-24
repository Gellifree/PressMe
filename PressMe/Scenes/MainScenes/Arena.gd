extends Control

var money = 50
var timer = 0

var hitpoints = 1

var stamina = 100
var hit_cost = 5



func _process(delta):
	update_money_label()
	update_hitpoints_label()
	update_stamina_label()
	
	timer_grow()
	if(stamina < 100):
		restore_stamina()
	if(timer > 200):
		taxing()
		
		timer = 0
		$tax_timer.text = ""
	if(money < 0):
		game_over()
		

func game_over():
	print("VESZTETTÉL")
	_on_Button_pressed()
	
	
func timer_grow():
	timer += 1
	if(timer % 12 == 0):
		$tax_timer.text += "-"

func restore_stamina():
	stamina += 0.07

func taxing():
	money -= 2
	
func collecting_money():
	money += 1

func update_money_label():
	$MoneyLabel.text = "Money: " + str(money)

func update_hitpoints_label():
	$Hitpoints.text = "Hitpoints: " + str(hitpoints)

func update_stamina_label():
	$Stamina.text = "Stamina: " + str(int(stamina))


func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainScenes/MainMenu.tscn")
	


func _on_test_button_pressed():
	if(stamina > hit_cost):
		collecting_money()
		stamina -= hit_cost
