extends Node2D


var t = rand_range(1,5)
var time_start = 0
var elapsed_time = 0
var tries = 5
var average = 0
var times = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$ColorRect.visible = false
	$ColorRect2.visible = false
	yield(get_tree().create_timer(t),"timeout")
	$ColorRect.visible = true
	time_start = OS.get_ticks_msec()

func _on_Button_button_down():
	elapsed_time = OS.get_ticks_msec() - time_start
	$Correct.play()
	times.append(elapsed_time)
	print(times)
	tries -= 1


func _on_Button_button_up():
	if tries > 0:
		_ready()
	else:
		$ColorRect2.visible = true
		for element in times:
			average += element
		average = average/5
		print(average)
		$ColorRect2/VBoxContainer/Label3.text = "Your Average Time: " + str(average) + "ms"

func _on_Back_pressed():
	get_tree().change_scene('res://TitleScreen.tscn')

func _on_Restart_pressed():
	get_tree().reload_current_scene()

