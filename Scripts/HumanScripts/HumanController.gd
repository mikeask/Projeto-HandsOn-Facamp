extends Node2D

func _input(event):
	var animatorBot = $BottomAnimation
	var animatorTop = $TopAnimation
	
	if Input.is_action_pressed("ui_right"):
		animatorBot.play("WalkSideways")
	if Input.is_action_pressed("ui_up"):
		animatorBot.play("WalkForward")
	if Input.is_action_pressed("ui_left"):
		animatorBot.play("WalkSideways")
	if Input.is_action_pressed("ui_down"):
		animatorBot.play("WalkBackward")
	