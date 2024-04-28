extends CharacterBody2D

@export var speed = 500
@onready var personaje = $"../Personaje"



func _ready():
	pass


func _process(delta):
	
	if personaje.InMovement == true:
		velocity = position.direction_to(personaje.position) * speed 
		move_and_slide()
	else:
		pass
	
	
	
