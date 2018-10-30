extends Node

var urlDatabaseItem = "res://Database//DatabaseItems.json"

func getItem(id):
	var itemData = {}
	itemData = GlobalDataParser.loadData(urlDatabaseItem)

	itemData[String(id)]["id"] = int(id)
	return itemData[String(id)]
	pass