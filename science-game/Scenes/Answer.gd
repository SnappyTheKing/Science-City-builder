extends Button

var correct: bool
var parent: QuestionScene

func _on_pressed() -> void:
	if correct:
		parent.answerPressed(true)
	else:
		parent.answerPressed(false)
