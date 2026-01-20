extends Control

@onready var money_stat = get_node("%Stats_1")
@onready var time_stat = get_node("%Stats_2")

func _ready() -> void:
	var modifier := ", Broke lol"
	
	if Global.money > 10000:
		modifier = ", Not Bad"
	
	if Global.money > 100000:
		modifier = ", Great Job"
	
	if Global.money > 1000000:
		modifier = ", I did not know the number could go so high"
	
	if Global.money > 10000000:
		modifier = ", What is wrong with you?"
	
	var t_modifier = "Not very long"
	if Global.bonus_time > 60:
		t_modifier = "Not bad"
	if Global.bonus_time > 120:
		t_modifier = "Your factories made a smokescreen"
	if Global.bonus_time > 300:
		t_modifier = "You made a dynasty"
	
	money_stat.text = "You made: " + str(round(Global.money)) + "$" + modifier
	time_stat.text = "You survived: " + str(round(Global.time + Global.bonus_time)) + "s before the UN found your city.\n" + t_modifier
