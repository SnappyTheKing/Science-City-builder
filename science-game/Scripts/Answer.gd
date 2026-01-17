extends Button

var correct: bool
var parent: QuestionScene

func _on_pressed() -> void:
	if correct:
		print("Correct Answer")
		parent.answerPressed(true)
	else:
		print("Incorrect Answer")
		parent.answerPressed(false)
