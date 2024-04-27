extends CharacterBody2D

class_name PlayerCharacter

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var InMovement = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):

	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		InMovement = true
	else:
		InMovement = false
	# Handle jump.
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x * velocity.y != 0:
		velocity = velocity - velocity/4
		#velocity.x = velocity.x - velocity.x/4
		#velocity.y = velocity.y - velocity.y/4
		
		
	if Input.is_action_just_pressed("Volver"):
		collision_layer = 1
		$Serpi.set_visible(true)
		
		$Triangulo.set_visible(false)
		$Cuadrado.set_visible(false)
		$Circulo.set_visible(false)
	if Input.is_action_just_pressed("Triangulo"):
		collision_layer = 3
		$Triangulo.set_visible(true)
		
		$Cuadrado.set_visible(false)
		$Circulo.set_visible(false)
		$Serpi.set_visible(false)
		
	if Input.is_action_just_pressed("Circulo"):
		collision_layer = 4
		$Circulo.set_visible(true)
		
		$Cuadrado.set_visible(false)
		$Triangulo.set_visible(false)
		$Serpi.set_visible(false)
		
	if Input.is_action_just_pressed("Cuadrado"):
		collision_layer = 5
		$Cuadrado.set_visible(true)
		
		$Triangulo.set_visible(false)
		$Circulo.set_visible(false)
		$Serpi.set_visible(false)
	
	move_and_slide()
	
	
	
