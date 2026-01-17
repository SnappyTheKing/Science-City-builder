extends PanelContainer
class_name  QuestionScene

signal correct_answer

@export var question: Question

@onready var question_name: RichTextLabel = get_node("%QuestionName")
@onready var question_holder: GridContainer = get_node("%QuestionHolder")

var answer_scene: PackedScene = load("res://Scenes/Answer.tscn")

func _ready() -> void:
	question_name.text = question.question
	
	var t: Array
	
	for a in range(len(question.answers)):
		t.append(answer_scene.instantiate())
		t[a].text = question.answers[a]
		t[a].parent = self
		if a == 0:
			t[a].correct = true
	
	t.shuffle()
	
	for i in t:
		question_holder.add_child(i)

func answerPressed(correct: bool):
	if correct:
		correct_answer.emit()
	queue_free()
