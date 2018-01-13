extends KinematicBody2D

func _ready():
    set_fixed_process(true)

var prev_pos = get_pos()
export var velocity = Vector2()

func _fixed_process(delta):
    velocity = get_pos() - prev_pos
    prev_pos = get_pos()