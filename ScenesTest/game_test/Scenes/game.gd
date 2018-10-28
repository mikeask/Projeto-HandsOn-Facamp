extends Node

var cursor = load("res://assets/imagens/cursor.png")

func _ready():
	Input.set_custom_mouse_cursor(cursor)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
