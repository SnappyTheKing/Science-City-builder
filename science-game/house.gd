extends Node3D

@export var money: float = 5
@export var interval: float = 5

func _ready() -> void:
	$Money_Timer.wait_time = interval

func _on_money_timer_timeout() -> void:
	Global.money += money
