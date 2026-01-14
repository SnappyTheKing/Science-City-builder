extends Node3D

@export var house_options: Array[PackedScene]
@export var money: float = 5
@export var interval: float = 5

func _ready() -> void:
	add_child(house_options[randi_range(0, len(house_options)-1)].instantiate())
	$Money_Timer.wait_time = interval

func _on_money_timer_timeout() -> void:
	Global.money += money
