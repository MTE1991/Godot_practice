extends CanvasLayer

signal start_game
signal quit_game 

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over(highest_score):
	show_message("Game Over!")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the\nCreeps"
	$MessageLabel.show()
	await get_tree().create_timer(2).timeout
	$MaxScoreLabel.text = "Max Score: " + str(highest_score)
	$StartButton.show()
	$QuitButton.show()

func update_score(score):
	$ScoreLabel.text = "Current Score: " + str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	$QuitButton.hide()
	start_game.emit()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_quit_button_pressed():
	quit_game.emit()
