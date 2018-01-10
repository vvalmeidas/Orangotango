extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
	pass

func _fixed_process(delta):
	self.set_text(str("Pontos: ", get_node("/root/Node2D/RigidBodyMoko").get("pontos")))