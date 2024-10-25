extends Node

#	普通拖入，创造一条路径
# $Player/Weapon

#	按ctrl托入，创造一条有节点名称和路径的变量
#	onready确保godot会等待所有子节点都被创建后再访问
#	$是get_node函数的简写
#	get_node("Player/Weapon")
@onready var weapon = $Player/Weapon

#	weapon.get_path()会返回一个从根节点到本身的一个绝对路径
#	在检查器里托入分配的节点
#@export var my_node : Node
#	也可指定Sprite2D,判断不会报错
@export var my_node : Sprite2D

var health = 100
var script_variable = 100


#	变量前加 @export 会暴露在检查器里
@export var damag := 15

#	不能改变的值 const
const GRAVITY = -9.81

#	枚举
enum Alignments { ALLY = 1 , NEUTRAL = 0 , ENEMY = -1 }
@export var unit_alignment : Alignments

enum Alignment { ALLY, NEUTRAL, ENEMY}
@export var my_alignment: Alignment

# Called when the node enters the scene tree for the first time.

#	游戏开始时运行的函数
#	当节点第一次进入场景树时会调用此函数
func _ready():
	
	
	var ready_variable = 10
	var godot_is_cool = 100
	var coolness = 9912
	coolness = true
	#	有四个基本类型: bool int float string
	
	#	int -> string 
	var number = 42
	var text = "Meaning of life" + str(number)
	#	float -> int
	var pi = 3.14
	int(pi)#	不是四舍五入，是直接截断
	
	#	Vector2 and Vector3
	#	Vector2 have tow float:x and y
	#	Vector3 have three float:x,y and z
	var vec2 = Vector2(0.0,0.0)
	var vec3 = Vector3(0.0,0.0,0.0)
	
	#	指定类型，不能改为其他类型
	var damage : int = 15
	var damagee := 15 #	自动确定数据类型
	
	
	var result = add(3,8)
	result = add(result,10)
	print(result)
	
	$Label.text = "Hello,world!"
	$Label.modulate = Color.GREEN
	print("Hello,world!")
	
	
	health = 40
	health = 20 + 30
	health += 20
	health -= 10
	health *= 4
	health /= 2
	print(health)
	
	# 随机数 (randf随机函数)
	var roll = randf()
	if roll <= 0.8:
		print("YOU found a COMMON item,")
	else:
		print("YOU found a RARE item!")
	#	通过randf_range()和randi_range()，来获得随机整数或小数
	var character_height = randi_range(140,210)
	print("Your character is " + str(character_height) + "cm tall.")
	
	#	数组可以包含不同类型的数据
	var items = ["Potion",3,6]
	#	限定数据
	var item:Array[String] = ["potion","Feather","Stolen harp"]
	
	#	循环
	for iteme in item:
		if iteme.length() > 6:
			print(iteme)
			
	for n in 8:
		print(n)
		
	var glass := 0.0
	while glass < 0.5:
		glass += randf_range(0.01,0.2)
		print(glass)
	print("The glass is now half full!")
	
	print(item[0])
	item[1] = "Smelly sock"
	item[2] = "Staff"
	#	删除索引
	item.remove_at(1)
	#	添加索引
	item.append("Overpowered sword")
	
	#	字典
	
	var players = {
	"Crook":1,
	"Villain":25,
	"Boos":	50,
	}
	
	print(players["Villain"])
	players["Villain"] = 50
	players["Dwayne"] = 999
	for username in players:
		print(username + ":" + str(players[username]))
	
	var player = {
	"Crook":	{"LeveL":1,"Health":80},
	"Villain":	{"LeveL":50,"Health":150},
	"Boos":		{"LeveL":100,"Health":500},
	}
	print(player["Boos"]["Health"])
	
	if unit_alignment == Alignment.ENEMY:
		print("You are not welcome here.")
	else:
		print("Welcome.")
		
		
	#	相当于 switch
	match my_alignment:
		Alignment.ALLY:
			print("Hello,friend!")
		Alignment.NEUTRAL:
			print("I come in piece!")
		Alignment.ENEMY:
			print("TASTE MY WRATH!")
		_:
			print("who art thou?")
			
	if my_node is Node2D:
		print("Is 2D!")
	
	
#	在每次游戏接收任何输入的时候调用
#	当按下按钮时"event"(事件)包含了触发该函数的信息
func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.RED
		health -= 20
		print(health)
		
		#	and - &&
		#	or - ||
		if health <= 0:
			health = 0
			print("YOU DIED!")
		elif health < 50:
			print("YOU ARE INJURED!")
		else:
			print("YOU ARE HEALTHY.")
		
		#	调用函数
		jump()
	if event.is_action_released("my_action"):
		$Label.modulate = Color.GREEN
		
		
		
func jump():
	#	跳跃动画
	#	向上跳
	#	跳跃声音
	print("JUMP!")
	
#			指定类型，（可不加）	返回类型，（可不加）
func add(num1 :int,num2 :int) -> int:
	var result = num1 + num2
	return result

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




# 按钮的节点
# 有绿色箭头意味着当前有一个信号连接到函数
# 点进去会出现信号源
func _on_button_pressed():
	print("MONEY")
