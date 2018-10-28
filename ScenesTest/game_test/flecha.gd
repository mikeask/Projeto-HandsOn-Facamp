extends Area2D
var time = 3
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dir  = Vector2()
var vel = 600


func _ready():
	
	pass

func _process(delta):
	set_position(position+dir*delta*vel)
	time -= delta
	if time <=0 :
		queue_free()
	

	pass

func _on_flecha_body_entered(body):
	vel = 0
	
	pass # replace with function body
