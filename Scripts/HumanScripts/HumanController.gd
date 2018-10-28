extends Node2D

func _input(event):
	var animatorBot = $BottomAnimation
	var animatorTop = $TopAnimation
	
	if Input.is_action_pressed("ui_right"): 
		animatorBot.play("Idle")
	