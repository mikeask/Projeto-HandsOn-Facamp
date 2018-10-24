extends Node2D

var pre_flecha = preload("res://ScenesTest/game_testes/flecha.tscn")
var aljava 


func _ready():
	aljava = get_parent().get_node("aljava")
	pass

func _process(delta):
	
	pass
	
func hit():
	get_node("AnimationPlayer").play("hit")
	if aljava.ndf()>0:
		aljava.remuve()
		var flecha = pre_flecha.instance()
		flecha.global_position = get_node("Position2D").global_position
		var a = get_node("Position2D").global_position
		var b = get_parent().global_position
		var dir  = Vector2(a.x-b.x,a.y-b.y).normalized()
		flecha.dir = dir
		flecha.rotation = get_node("Position2D").global_position.angle_to_point(get_parent().position)
		get_parent().get_parent().add_child(flecha)
	else :
		print("sem munição")
	
	pass
