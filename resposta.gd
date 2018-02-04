extends KinematicBody2D

onready var resp = int(get_node("Label").get_text())
onready var spriteVidas = get_node("/root/Node2D/HUD/SpriteVidas");
onready var moko = get_node("/root/Node2D/RigidBodyMoko");
onready var pergunta = get_node("/root/Node2D/Pergunta/LabelPergunta");
onready var timer = get_node("Timer");
onready var sons = get_node("/root/Node2D/SamplePlayer2D");
onready var somFundo = get_node("/root/Node2D/StreamPlayer");
var curPos = self.get_pos();

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(Vector2(0,0))
	
	if(pergunta != null and moko != null and is_colliding() && resp == pergunta.get("respAtual") && get_node("Label") != null && get_node("CollisionShape2D") != null):
		sons.play("Acertou2")
		moko.set("pontos", moko.get("pontos") + 10)
		get_node("Label").queue_free()
		get_node("CollisionShape2D").queue_free()
		if(pergunta.get("indiceAtual") == 1):
			get_node("/root/Node2D/PlataformaMovel/Plataforma 1").show()
			get_node("/root/Node2D/PlataformaMovel/CollisionPolygon2D").show()
		if(pergunta.get("indiceAtual") == 5):
			get_node("/root/Node2D/PlataformaMovel2/Sprite").show()
			get_node("/root/Node2D/PlataformaMovel2/CollisionPolygon2D").show()
		if(pergunta.get("perguntas").size() - 1 >= pergunta.get("indiceAtual") + 1): 
			pergunta.set("indiceAtual", pergunta.get("indiceAtual") + 1)
		else: 
			pergunta.set_text(str("Uhuuu!!"))
			pergunta.set_fixed_process(false)
			moko.queue_free()
			get_node("/root/Node2D/FinalFase1/Panel").show()
			get_node("/root/Node2D/FinalFase1/Label").show()
			get_node("/root/Node2D/FinalFase1/Label1").show()
			somFundo.stop()
			sons.play("win")
			
		self.queue_free()
		
	elif(is_colliding() && resp != pergunta.get("respAtual") && timer != null):
		get_node("Label").set("custom_colors/font_color", Color(1,0,0))
		self.set_pos(curPos)
		moko.set("vidas", moko.get("vidas") - 1)
		sons.play("Errou")
		spriteVidas.set_frame(moko.get("vidas"))
		timer.connect("timeout", self, "_on_timer_timeout")
		timer.set_wait_time(1)
		timer.start()
		self.set_fixed_process(false)
		
	else:
		get_node("Label").set("custom_colors/font_color", Color(0,0,0))
		self.set_pos(curPos)
		

func _on_timer_timeout():
	self.set_fixed_process(true)