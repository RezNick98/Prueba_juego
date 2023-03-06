extends CharacterBody2D

const  speed :=120
var direccion :=0.0
const jump :=250
const gravity:=9

@onready var anim=$AnimationPlayer
@onready var sprite = $Sprite2D
func _physics_process(delta):
	direccion = Input.get_axis('ui_left','ui_right')
	velocity.x = direccion * speed
	if direccion!=0 and direccion>0:
		anim.play("run")
		sprite.flip_h=direccion<0
	else: if direccion<0:
			anim.play("run")
			sprite.flip_h=direccion
	else:
			anim.play("idle")
	
			
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -=jump
	velocity.y +=gravity
	
	move_and_slide()
