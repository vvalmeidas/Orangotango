extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var moko = get_node("/root/Node2D/RigidBodyMoko");

func _ready():
	get_node("Sprite/AnimationPlayer").play("New Anim")
	set_fixed_process(true)


func _fixed_process(delta):
	move(Vector2(0,0))
	if(is_colliding() and get_node("Sprite")!=null and get_node("CollisionPolygon2D")!= null):
		moko.set("pontos", moko.get("pontos") - 5)
		get_node("Sprite").queue_free()
		get_node("CollisionPolygon2D").queue_free()
		self.queue_free()
