extends Control

var rng = RandomNumberGenerator.new()
var missionIndex = 0

var missionList = [
	{
		"name": "Pénzgyűjtés",
		"description": "Gyűjts össze 10 pénzt.",
		"money": 20,
		"value": 10,
		"type": "money"
	},
	{
		"name": "Stamina használat",
		"description": "Használj fel 200 staminát.",
		"money": 15,
		"value": 200,
		"type": "stamina"
	},
	{
		"name": "Túlélés",
		"description": "Élj túl 60 mp-et.",
		"money": 30,
		"value": 60,
		"type": "time"
	}
]

func update_mission():
	data = 0
	PlayerVariables.money_grow = 0
	PlayerVariables.stamina_used = 0
	PlayerVariables.time_spent = 0
	# Kívülről kellene megkapnunk az adatot
	missionIndex = rng.randi_range(0,2)
	$Mission.text = missionList[missionIndex]["name"] + " : " + missionList[missionIndex]["description"] + "\n" + "Jutalom: " + str(missionList[missionIndex]["money"]) + " Gold"
	progression(missionList[missionIndex]["value"])
	check_data()

var data = 0
var starter_data = 0
var grow_size = 0
var actual_data = 0



func progression(value):
	#print("Az érték ahol tartunk: ", grow_size)
	#print("Az érték, ami kell: ", value)
	pass


func check_data():
	if(missionList[missionIndex]["type"] == "money"):
		starter_data = PlayerVariables.money
	elif(missionList[missionIndex]["type"] == "stamina"):
		starter_data = PlayerVariables.stamina
	elif(missionList[missionIndex]["type"] == "time"):
		starter_data = PlayerVariables.time_spent
	grow_size = 0

func grow_progression():
	data += 1
	
func give_money(amount):
	print("A pénzed növekedett: ", amount, " Golddal")
	PlayerVariables.money += missionList[missionIndex]["money"]
	



func check_progression(value):
	if(missionList[missionIndex]["type"] == "money"):
		grow_size = PlayerVariables.money_grow
		$progression.text = "PÉNZ GYŰJTVE: " + str(grow_size)
	elif(missionList[missionIndex]["type"] == "stamina"):
		grow_size = PlayerVariables.stamina_used
		$progression.text = "STAMINA HASZNÁLVA: " + str(grow_size)
	elif(missionList[missionIndex]["type"] == "time"):
		actual_data = 0 #Time
		$progression.text = "ELTELT IDŐ(X): " + str(grow_size)
	
	if(grow_size >= value):
		print("A küldetés kész!")
		PlayerVariables.money_grow = 0
		PlayerVariables.stamina_used = 0
		give_money(missionList[missionIndex]["money"])
		update_mission()
		
func _process(delta):
	check_progression(missionList[missionIndex]["value"])
	



func _ready():
	rng.randomize()
	update_mission()


func _on_Button_pressed():
	update_mission()


func _on_Button2_pressed():
	grow_progression()
	progression(missionList[missionIndex]["value"])
