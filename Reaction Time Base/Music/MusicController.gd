extends Node

var music = load("res://Music/210737__edtijo__night-soft-techno.wav")

func _ready():
	pass # Replace with function body.

func play_music():
	$Music.stream = music
	$Music.play()
