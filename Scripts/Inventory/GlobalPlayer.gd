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
			if slot==1: dict["inventory"][String(slot)] = {"id": "1", "amount": 1}
			elif slot==2: dict["inventory"][String(slot)] = {"id": "2", "amount": 10}
			else: dict["inventory"][String(slot)] = {"id": "0", "amount": 0}
		GlobalDataParser.writeData(urlPlayerData, dict)
		inventory = dict["inventory"]
	else:
		inventory = playerData["inventory"]
	