extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var respAtual = 0;
export var indiceAtual = 0;
export var perguntas = [];
var perguntaAtual = "";
var respostas = [];

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	perguntas.append("1 + 0")
	respostas.append(1)
	perguntas.append("6 + 4")
	respostas.append(10)
	perguntas.append("4 + 8")
	respostas.append(12)
	perguntas.append("6 - 2")
	respostas.append(4)
	perguntas.append("2 + 2 + 3")
	respostas.append(7)
	perguntas.append("9 - 3")
	respostas.append(6)
	perguntas.append("8 - 2 - 1")
	respostas.append(5)
	perguntas.append("21 - 9")
	respostas.append(12)
	perguntas.append("35 + 24")
	respostas.append(59)
	perguntas.append("10 + 19 + 5")
	respostas.append(34)
	
	
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