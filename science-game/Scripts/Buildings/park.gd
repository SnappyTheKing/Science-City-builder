extends Node3D

@export var park_options: Array[Park]
@export var money: float = 5
@export var interval: float = 5

func _ready() -> void:
	add_child(park_options[randi_range(0, len(park_options)-1)].instantiate())
