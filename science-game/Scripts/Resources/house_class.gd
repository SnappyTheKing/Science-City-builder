class_name House
extends Building

@export var income: float = 5
@export var interval: float = 3

func run():
	print("What test needs to run")
	var t = Timer.new()
	t.wait_time = interval
	t.autostart = true
	t.one_shot = false
	t.timeout.connect(to_run_when_timer)
	parent.add_child(t)

func to_run_when_timer():
	Global.money += income
