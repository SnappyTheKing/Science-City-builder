extends Node3D

var tile = preload("res://Scenes/Tile.tscn")

func _ready() -> void:
	print("AYO")
	
	for x in 10:
		for y in 10:
			var t = tile.instantiate()
			t.position = Vector3(x,randf()/10,y)
			add_child(t)
