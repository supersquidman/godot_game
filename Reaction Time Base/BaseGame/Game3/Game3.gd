extends Node2D


var t = rand_range(1,5)
var countdown = 5
var time_start = 0
var elapsed_time = 0
var tries = 5
var average = 0
var times = []
var colors = ['Red', 'Orange', 'Blue', 'Purple', 'Yellow', 'Green', 'Black', 'White']
var current = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$GameContainer.visible = false
	$BG.visible = true
	$ColorRect2.visible = false
	$Label2.visible = false
	yield(get_tree().create_timer(t),"timeout")
	$GameContainer.visible = true
	$Label2.visible = true
	$BG.visible = false
	current = get_color()
	$Label2.text = 'Click ' + current + '!'
	time_start = OS.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_button_down(extra_arg_0: String) -> void:
	if current == extra_arg_0:
		elapsed_time = OS.get_ticks_msec() - time_start
		$Correct.play()
		times.append(elapsed_time)
		print(times)
		print(extra_arg_0)
		tries -= 1
	else:
		$Incorrect.play()

func _on_Button_button_up(extra_arg_0: String) -> void:
	if current == extra_arg_0:
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

func get_color():
	var random_color = colors[randi()%colors.size()]
	return random_color
