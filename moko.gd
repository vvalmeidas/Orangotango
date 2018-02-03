extends RigidBody2D

export var player_speed = 400
export var acceleration = 10
export var extra_gravity = 550
export var jumpforce = 450
export var vidas = 3

var current_speed = Vector2(0,0)
var raycast_down = null
var anim = "";
var animacao = "";
export var pontos = 0;
onready var sons = get_node("/root/Node2D/SamplePlayer2D");
onready var somFundo = get_node("/root/Node2D/StreamPlayer");

func _ready():
	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	set_fixed_process(true)
	set_applied_force(Vector2(0,extra_gravity))

func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false

func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x , speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x,get_linear_velocity().y))

func _fixed_process(delta):
	
	if(get_node("Moko") != null):
		if (Input.is_key_pressed(KEY_LEFT)):  
			move(-player_speed, acceleration, delta)
			get_node("Moko").set_flip_h(true)
			set_applied_force(Vector2(0, extra_gravity))
			anim = "andar"
		
		elif (Input.is_key_pressed(KEY_RIGHT)):  
			move(player_speed, acceleration, delta)
			get_node("Moko").set_flip_h(false)
			set_applied_force(Vector2(0, extra_gravity))
			anim = "andar"
		
		elif (raycast_down.is_colliding() and raycast_down.get_collider() != null and (raycast_down.get_collider().get_name() == "PlataformaMovel" or raycast_down.get_collider().get_name() == "PlataformaMovel2")):
				# Atualizando a posição do player à medida que a plataforma se move
				current_speed = raycast_down.get_collider().velocity
				set_applied_force(Vector2(0, 10000))
				get_node("Moko/AnimationPlayer").stop(true)
				anim = ""
		
		else:
			get_node("Moko/AnimationPlayer").stop(true)
			anim = ""
		
		if (Input.is_key_pressed(KEY_SPACE) and is_on_ground()): 
			set_axis_velocity(Vector2(0,-jumpforce))
			set_applied_force(Vector2(0, extra_gravity))
			get_node("/root/Node2D/SamplePlayer2D").play("Jump")
			
		if animacao != anim:
			get_node("Moko/AnimationPlayer").play(anim)
			animacao = anim
		
		if vidas == 0:
			somFundo.stop()
			get_node("Moko").queue_free()
			get_node("/root/Node2D/Pergunta/LabelPergunta").queue_free()
			get_node("/root/Node2D/GameOver/Panel").show()
			get_node("/root/Node2D/GameOver/Label").show()
			sons.play("lose")
				
		if(raycast_down.is_colliding() and raycast_down.get_collider() != null and raycast_down.get_collider().get_name() == "KinematicBodyFall"):
			get_node("/root/Node2D/RigidBodyMoko").set("vidas", get_node("/root/Node2D/RigidBodyMoko").get("vidas") - 1)
			get_node("/root/Node2D/HUD/SpriteVidas").set_frame(get_node("/root/Node2D/RigidBodyMoko").get("vidas"))
			get_node("/root/Node2D/RigidBodyMoko").set_global_pos(Vector2(0, 0)) 
			if(vidas > 0):
				sons.play("caiu")
			