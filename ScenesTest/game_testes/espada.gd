extends "res://ScenesTest/game_testes/Classe_arma.gd"

func _init(novoDano):
	dano = novoDano
	pass
	
func _atack():
	get_node("AnimationPlayer").play("hit")
	pass

#var delay = 0.6
#var vAtk = 0.6
#
#
#func _ready():
#
#	pass
#
#func _process(delta):
#	if Input.is_mouse_button_pressed(1) && delay >=vAtk:
#		delay = 0
#
#		get_node("AnimationPlayer").play("hit")
#
#	if delay  <vAtk:
#		delay +=delta
#
#	pass
