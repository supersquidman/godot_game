extends Control


var scene_path_to_load


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed",self,"_on_Button_pressed",[button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	$Click.play()
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)


func _on_Game1_pressed():
	pass # Replace with function body.


func _on_Game2_pressed():
	pass # Replace with function body.


func _on_Game3_pressed():
	pass # Replace with function body.
