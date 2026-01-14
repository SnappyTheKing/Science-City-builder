extends Node3D

@export var house_options: Array[House]

var selected

func _ready() -> void:
	selected = house_options[randi_range(0, len(house_options)-1)]
	add_child(selected.mesh.instantiate())
	$Money_Timer.wait_time = selected.interval

func _on_money_timer_timeout() -> void:
	Global.money += selected.income
