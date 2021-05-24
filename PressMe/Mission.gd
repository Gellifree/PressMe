extends Control

var rng = RandomNumberGenerator.new()
var missionIndex = 0

var missionList = [
	{
		"name": "Mission 1",
		"description": "Elso kuldetés. Csinald ezt, csinalt azt",
		"result": "potion 1"
	},
	{
		"name": "Mission 2",
		"description": "Masodik kuldetés. Csinald ezt, csinalt azt",
		"result": "potion 2"
	},
	{
		"name": "Mission 3",
		"description": "Harmadik kuldetés. Csinald ezt, csinalt azt",
		"result": "potion 3"
	}
]

func update_mission():
	missionIndex = rng.randi_range(0,2)
	$Mission.text = missionList[missionIndex]["name"] + " : " + missionList[missionIndex]["description"]


func _ready():
	rng.randomize()
	update_mission()


func _on_Button_pressed():
	update_mission()
