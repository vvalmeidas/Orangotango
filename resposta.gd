extends KinematicBody2D

onready var resp = int(get_node("Label").get_text())
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var moko = get_node("/root/Node2D/RigidBodyMoko");
onready var pergunta = get_node("/root/Node2D/Pergunta/LabelPergunta");
var curPos = self.get_pos();

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(Vector2(0,0))
	
	if(is_colliding() && resp == pergunta.get("respAtual") && get_node("Label") != null && get_node("CollisionShape2D") != null):
		moko.set("pontos", moko.get("pontos") + 10)
		get_node("Label").queue_free()
		get_node("CollisionShape2D").queue_free()
		if(pergunta.get("perguntas").size() - 1 >= pergunta.get("indiceAtual") + 1): 
			pergunta.set("indiceAtual", pergunta.get("indiceAtual") + 1)
		else: 
			pergunta.set_text(str("Uhuuu"))
			pergunta.set_fixed_process(false)
			
		self.queue_free()
		
	elif(is_colliding() && resp != pergunta.get("respAtual")):
		get_node("Label").set("custom_colors/font_color", Color(1,0,0))
		self.set_pos(curPos)
	else:
		get_node("Label").set("custom_colors/font_color", Color(0,0,0))