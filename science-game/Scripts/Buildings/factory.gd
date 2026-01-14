extends Node3D

@export var factory_options: Array[Factory]
@export var money: float = 5
@export var interval: float = 5

func _ready() -> void:
	add_child(factory_options[randi_range(0, len(factory_options)-1)].instantiate())
