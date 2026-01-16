extends Control

var type: RichTextLabel

func _ready() -> void:
	type = get_child(0).get_child(0)

func _process(_delta: float) -> void:
	position = get_global_mouse_position()
