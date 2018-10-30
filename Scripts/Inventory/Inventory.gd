extends Control

onready var listItems = get_node("Inventory/Inventory/InvItemList")
var selectedItemIndex = null
func _ready():
	listItems.max_columns = 8
	listItems.fixed_icon_size = Vector2(48,48)
	listItems.icon_mode = ItemList.ICON_MODE_TOP
	listItems.select_mode = ItemList.SELECT_SINGLE
	listItems.same_column_width = true

	
#	var icon = ResourceLoader.load("res://Sprites/WineBottleWB.png")
#	for i in range(0,40):
#		listItems.add_item("", icon, true)
#		pass
#
#	icon = ResourceLoader.load("res://Sprites/emptyWB.png")
#
#	for i in range(40,80):
#		listItems.add_item("", icon, true)
#		pass
#
#	pass

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		
		if $Inventory.visible == true:
			$Inventory.hide()
		else:
			loadItems()
			$Inventory.show()
			
	
	if !(selectedItemIndex == null):
		$Sprite.position = get_local_mouse_position()
	pass


func loadItems():
	listItems.clear()
	for slot in range(0, GlobalPlayer.inventoryMaxSlots):
		var inventoryItem = GlobalPlayer.inventory[String(slot)]
		var itemMetaData = GlobalItemDatabase.getItem(inventoryItem["id"])
		var icon = ResourceLoader.load(itemMetaData["icon"])
		var amount = int(inventoryItem["amount"])
		
		itemMetaData["amount"] = amount
		if inventoryItem["id"] == "0": amount = " "

		listItems.add_item(String(amount), icon, true)
		listItems.set_item_metadata(slot, itemMetaData)
		listItems.set_item_tooltip(slot, itemMetaData["name"])
		
	pass


func _on_InvItemList_item_selected(index):
	if selectedItemIndex == null && listItems.get_item_tooltip(index) != "empty":
		selectedItemIndex = index
		$Sprite.show()
		$Sprite.texture = listItems.get_item_icon(selectedItemIndex)
		listItems.set_item_disabled(index, true)
		pass
	
	elif(selectedItemIndex != null or listItems.get_item_tooltip(index) != "empty"):
		switchItem(index)
		selectedItemIndex = null
		$Sprite.hide()
		pass
		
	pass 

func switchItem(index):
	var icon = listItems.get_item_icon(index)
	listItems.set_item_icon(index, listItems.get_item_icon(selectedItemIndex))
	listItems.set_item_icon(selectedItemIndex, icon)
	listItems.set_item_disabled(index, false)
	listItems.set_item_disabled(selectedItemIndex, false)
	
	var text = listItems.get_item_text(index)
	listItems.set_item_text(index, listItems.get_item_text(selectedItemIndex))
	listItems.set_item_text(selectedItemIndex, text)
	listItems.set_item_disabled(index, false)
	listItems.set_item_disabled(selectedItemIndex, false)
	
	var tooltip = listItems.get_item_tooltip(index)
	listItems.set_item_tooltip(index, listItems.get_item_tooltip(selectedItemIndex))
	listItems.set_item_tooltip(selectedItemIndex, tooltip)
	listItems.set_item_disabled(index, false)
	listItems.set_item_disabled(selectedItemIndex, false)
	
	var metadata = listItems.get_item_metadata(index)
	listItems.set_item_metadata(index, listItems.get_item_metadata(selectedItemIndex))
	listItems.set_item_metadata(selectedItemIndex, tooltip)
	listItems.set_item_disabled(index, false)
	listItems.set_item_disabled(selectedItemIndex, false)
	pass