extends RigidBody2D

export var player_speed = 350
export var acceleration = 10
export var extra_gravity = 550
export var jumpforce = 400

var current_speed = Vector2(0,0)
var raycast_down = null
var anim = "";
var animacao = "";
var pontos = 0;

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
	
	if (Input.is_key_pressed(KEY_LEFT)):  
		move(-player_speed, acceleration, delta)
		get_node("Moko").set_flip_h(true)
		anim = "andar"
	
	elif (Input.is_key_pressed(KEY_RIGHT)):  
		move(player_speed, acceleration, delta)
		get_node("Moko").set_flip_h(false)
		anim = "andar"
	
	else:
		get_node("Moko/AnimationPlayer").stop(true)
		anim = ""
		
	if (Input.is_key_pressed(KEY_SPACE) and is_on_ground()): 
		set_axis_velocity(Vector2(0,-jumpforce))
	
	if animacao != anim:
		get_node("Moko/AnimationPlayer").play(anim)
		animacao = anim
		
	if(raycast_down.is_colliding() && raycast_down.get_collider().get_name() == "KinematicBodyBanana"):
		pontos = pontos + 1
	
	print(pontos)
	