extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var moko = get_node("/root/Node2D/RigidBodyMoko/RayCast2D");

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	print(moko.is_colliding())
