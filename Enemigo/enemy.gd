extends CharacterBody2D

var speed = 200
@onready var personaje = $"../Personaje"



func _physics_process(delta):
	if personaje == null: 
		get_tree().get_nodes_in_group("Player")
	if personaje != null:
		velocity = position.direction_to(personaje.position) * speed
		move_and_slide()
