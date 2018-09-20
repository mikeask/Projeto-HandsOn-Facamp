extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	var animator = $AnimationPlayer;
	
	if Input.is_action_pressed("ui_right"):
		animator.play("Dance");
	
	if Input.is_action_pressed("ui_left"):
		animator.play("Idle");
	
	if Input.is_action_pressed("ui_up"):
		animator.play("Rotating");
		
	
