extends KinematicBody2D

var velMx = 200;
var vel= Vector2()


var nova_animacao = "";
var animacao = "";



func _ready():
	pass

func _process(delta):
	muve()
	rotation = get_global_mouse_position().angle_to_point(position)
	get_animation()
	
	pass
	
func muve():
	vel.x = 0;
	vel.y = 0;
	
	if Input.is_action_pressed("cima"):
		vel.y = vel.y-velMx
		
		pass
	if Input.is_action_pressed("baixo"):
		vel.y = vel.y+velMx
		
		pass
	if Input.is_action_pressed("direita"):
		vel.x = vel.x+velMx
		
		pass
	if Input.is_action_pressed("esquerda"):
		vel.x = vel.x-velMx
		
	
	move_and_slide(vel)
	pass
	
func get_animation():
	
	if Input.is_action_pressed("esquerda")||Input.is_action_pressed("direita")||Input.is_action_pressed("cima")||Input.is_action_pressed("baixo"):
		nova_animacao = "walk"
		pass
	else :
		nova_animacao = "stop"
	
	if animacao !=nova_animacao:
		get_node("AnimationPlayer").play(nova_animacao)
		animacao = nova_animacao
	pass


	
	

