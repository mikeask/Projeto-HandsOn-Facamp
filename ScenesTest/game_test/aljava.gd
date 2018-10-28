extends Node2D

var quant = 10

func _ready():
	
	pass

func ndf():
	return quant

func remuve():
	if quant >=0:
		quant -=1
	