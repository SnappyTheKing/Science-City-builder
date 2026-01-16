extends Node3D


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
			var height = noise.get_noise_2d(x, y)*10 + 0.5
			if height > 0.5:
				var t = tile.instantiate()
				
				t.position = Vector3(2*x, height ,2*y)
				Global.map.append(t)
				add_child(t)
