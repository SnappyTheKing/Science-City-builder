extends Node3D

@export var appartment_options: Array[Appartment]

var selected

func _ready() -> void:
	selected = appartment_options[randi_range(0, len(appartment_options)-1)]
	add_child(selected.mesh.instantiate())
	$Money_Timer.wait_time = selected.interval

func _on_money_timer_timeout() -> void:
	Global.money += selected.income
