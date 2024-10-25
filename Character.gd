class_name Character
extends Node

@export var profession : String
@export var health : int 

# 内部类
var chest := Equipment.new()
var legs := Equipment.new()

class Equipment:
	var armor := 10
	var weight := 5
	



func _ready():
	chest.armor = 20
	print(chest.armor)
	print(legs.weight)

func die():
	health = 0
	print(profession + " died.")
	

