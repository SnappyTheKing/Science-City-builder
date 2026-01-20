extends Node3D

@onready var hud = get_node("%HUD")

var tile = preload("res://Scenes/Tile.tscn")
var endScreen = preload("res://Scenes/end_screen.tscn")

@export var noise = FastNoiseLite.new()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if hud.current_time() and Global.started:
		Global.started = false
		add_child(endScreen.instantiate())

func _on_start_game() -> void:
	Global.started = true
	get_node("HUD").show()
	get_node("Camera").camera_enabled = true
	
	print("Game Started")
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.seed = randi()
	noise.frequency = 0.05
	
	for x in 25:
		for y in 25:
			#if pow(2*x-25,2) + pow(2*y-25,2) <= 100:
			var height = noise.get_noise_2d(x, y)*10 + 0.5
			if height > 0:
				var t = tile.instantiate()
				
				t.position = Vector3(2*x, height ,2*y)
				t.scale = Vector3(1,height/2 + 1,1)
				t.get_child(0).scale = Vector3(0.5, 0.5/t.scale.y, 0.5) 
				Global.map.append(t)
				add_child(t)
