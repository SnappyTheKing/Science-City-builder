extends Control

@onready var money_disp: Label = get_node("%Money")
@onready var time_disp: Label = get_node("%Time")

var expended_time: float = 0

func _process(delta):
	expended_time += delta
	
	money_disp.text =  "Money: " + str(roundf(Global.money * 10) /10)
	var formatted_time = "Time: %d:%02d" % [floori((Global.time + Global.bonus_time - expended_time)/60),roundi(Global.time + Global.bonus_time - expended_time) % 60]
	time_disp.text =   formatted_time
	#"Time: " + str(floori((Global.time + Global.bonus_time - expended_time)/60)) + ":" + str(roundi(Global.time + Global.bonus_time - expended_time) % 60) + " / " + str(floori((Global.time + Global.bonus_time)/60)) + ":" + str(roundi(Global.time + Global.bonus_time) % 60)
