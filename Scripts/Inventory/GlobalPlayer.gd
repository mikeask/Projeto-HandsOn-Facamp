extends Node

var urlPlayerData = "user://PlayerData.bin"
var inventory = {}
var inventoryMaxSlots = 80
onready var playerData = GlobalDataParser.loadData(urlPlayerData)

func _ready():
	loadData()

func loadData():
	if playerData == null:
		var dict = {"inventory":{}}
		for slot in range (0, inventoryMaxSlots):
			dict["inventory"][String(slot)] = {"id": "0", "amount": 0}
		GlobalDataParser.writeData(urlPlayerData, dict)
		inventory = dict["inventory"]
	else:
		inventory = playerData["inventory"]
	