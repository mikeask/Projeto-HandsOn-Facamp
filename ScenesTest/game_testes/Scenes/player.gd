extends KinematicBody2D

var velMx = 200;
var vel= Vector2()
var delay = 0.6
var vAtk = 0.4


var nova_animacao = "";
var animacao = "";



func _ready():
	set_process(true)
	pass

func _process(delta):
	movimento()
	atack(delta)
	pass

func atack(delta):
	if Input.is_mouse_button_pressed(1) && delay >=vAtk:
		get_node("arma").hit()
		delay = 0
	if delay  <vAtk:
		delay +=delta

func movimento():
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
	
	rotation = get_global_mouse_position().angle_to_point(position)
	
	if Input.is_action_pressed("esquerda")||Input.is_action_pressed("direita")||Input.is_action_pressed("cima")||Input.is_action_pressed("baixo"):
		nova_animacao = "walk"
		pass
	else :
		nova_animacao = "stop"
	
	if animacao !=nova_animacao:
		get_node("AnimationPlayer").play(nova_animacao)
		animacao = nova_animacao


	
	

