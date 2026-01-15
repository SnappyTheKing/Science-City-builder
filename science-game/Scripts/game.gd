extends Node3D

var map: Array[Tile]
var tile = preload("res://Scenes/Tile.tscn")
var noise = FastNoiseLite.new()

func _ready() -> void:
	print("Game Started")
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.seed = randi()
	noise.frequency = 0.05
	
	for x in 25:
		for y in 25:
			#if pow(2*x-25,2) + pow(2*y-25,2) <= 100:
			var t = tile.instantiate()
			
			t.position = Vector3(2*x,noise.get_noise_2d(x, y)*10 + 0.5 ,2*y)
			map.append(t)
			add_child(t)

func get_tiles(pos: Vector2) -> Array[Building]:
	var list: Array[Building]
	for t in map:
		if t.building and pos.distance_to(Vector2(t.position.x, t.position.z)) < 3:
			list.append(t.building.get_child(0).building)
	return list
