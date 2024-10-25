extends Node

# setter
signal health_changed(new_health)

var health := 100:
	set(value):
		# 设置（用clamp函数）0 - 100 之间
		health = clamp(value,0,100)
		health_changed.emit(health)
		


# getter
var chance := 0.2
var chance_pct : int:
	get:
		return chance * 100
	set(value):
		chance = float(value) / 100.0



# Called when the node enters the scene tree for the first time.
func _ready():
	health = -150
	print(chance_pct)
	chance_pct = 0.4
	print(chance_pct)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_health_changed(new_health):
	print(new_health)
