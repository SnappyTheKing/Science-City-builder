extends Node3D

@export var comercial_options: Array[Comercial]
@export var money: float = 5
@export var interval: float = 5

func _ready() -> void:
	add_child(comercial_options[randi_range(0, len(comercial_options)-1)].instantiate())
