extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var pergunta1 = "Pq Britney é a rainha do POP?";
export var respAtual = 0;
export var indiceAtual = 0;
var perguntaAtual = "";

export var perguntas = [];
var respostas = [];

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	perguntas.append("2x2")
	respostas.append(4)
	perguntas.append("6x3")
	respostas.append(18)
	perguntaAtual = perguntas[0]
	respAtual = respostas[0]
	self.set_text(perguntaAtual)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	self.set_text(str(_set_pergunta(indiceAtual)))
	
func _set_pergunta(num):
	respAtual = respostas[num]
	return perguntas[num]