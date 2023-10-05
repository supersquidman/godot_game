extends Control


func _ready():
	pass # Replace with function body.


func _on_Back_pressed():
	$Click.play()
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene('res://TitleScreen.tscn')


func _on_CheckButton_toggled(button_pressed):
	$Click.play()
	OS.set_window_fullscreen(!OS.window_fullscreen)
