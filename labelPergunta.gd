extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var pergunta1 = "Pq Britney é a rainha do POP?";
export var resposta1 = "A";

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	self.set_text(str(pergunta1))
	