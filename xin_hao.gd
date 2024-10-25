# 向下用调用，向上用信号
extends Node
# Autostart 启动,倒计时到0，会发出一个_timed_out()的信号

# 其他信号可以连接的信号，(传递信息)
signal leveled_up(msg)

var XP := 0

func _ready():
	# 代码连接信号
	leveled_up.connect(_on_leveled_up)
	
	# 代码断开信号
	#leveled_up.disconnect(_on_leveled_up)

func _on_timer_timeout():
	XP += 5
	print(XP)
	if XP >= 20:
		XP = 0
		leveled_up.emit("GZ!")

# (接收信息)
func _on_leveled_up(msg):
	print(msg)
