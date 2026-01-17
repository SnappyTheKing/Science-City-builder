extends PanelContainer

signal correct_answer

@export var question: Question

@onready var question_name: RichTextLabel = get_node("%QuestionName")
@onready var question_holder: GridContainer = get_node("%QuestionHolder")

var answer_scene: PackedScene = load("res://Scenes/Answer.tscn")

func _ready() -> void:
	question_name.text = question.question
	
	
	for a in question.answers:
		var t = answer_scene.instantiate()
		t.text = a
		t.Correct = true
		t.pressed.connect(answerPressed)
		question_holder.add_child(t)

func answerPressed():
	print("clicked")
