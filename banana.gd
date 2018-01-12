extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var moko = get_node("/root/Node2D/RigidBodyMoko");

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(0,0))
	if(is_colliding() and get_node("SpriteBanana")!=null and get_node("CollisionBanana")!= null):
		moko.set("pontos", moko.get("pontos") + 10)
		get_node("SpriteBanana").queue_free()
		get_node("CollisionBanana").queue_free()
		self.queue_free()
		# get_node("/root/Node2D/Pergunta/LabelPergunta").show()

