extends CharacterBody2D

@export var speed = 500
@onready var personaje = $"../Personaje"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if personaje.InMovement == true:
		velocity = position.direction_to(personaje.position) * speed 
		move_and_slide()
	else:
		pass
	
	
	
