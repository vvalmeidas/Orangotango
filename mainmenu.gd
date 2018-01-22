extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var index = 0 


func _ready():
	set_process_input(true)
	set_fixed_process(true)
	OS.set_window_title("Orangotango!")
	get_node("BtnJogar").connect("pressed", self, "_on_Button_pressed")
	pass

func _on_Button_pressed():
		get_node("/root/global")._goto_scene("res://Cena1.tscn")
	