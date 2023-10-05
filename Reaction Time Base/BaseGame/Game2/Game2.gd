extends Node2D



var time_start = 0
var elapsed_time = 0
var tries = 5
var average = 0
var times = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var s = rand_range(30,150)
	var yv = rand_range(0,720 - s)
	var xv = rand_range(0, 1280 - s)
	var t = rand_range(1,5)
	randomize()
	$Label2.visible = false
	$ColorRect.visible = false
	$ColorRect2.visible = false
	yield(get_tree().create_timer(t),"timeout")
	$ColorRect.set_position(Vector2(xv, yv))
	$ColorRect.set_size(Vector2(s,s))
	$ColorRect/Button.set_size(Vector2(s,s))
	$BG/Label.visible = false
	$Label2.visible = true
	$ColorRect.visible = true
	time_start = OS.get_ticks_msec()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	elapsed_time = OS.get_ticks_msec() - time_start
	$Correct.play()
	times.append(elapsed_time)
	print(times)
	tries -= 1


func _on_Button_button_up():
	if tries > 0:
		$BG/Label.visible = true 
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
