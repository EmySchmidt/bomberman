extends Area2D

class_name Player

var movement: Vector2 = Vector2.ZERO
@export var movement_speed: float = 75
@onready  var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycasts:Raycasts = $"../Raycasts"

func _process(delta: float) -> void:
	
	
	
	position += movement * delta * movement_speed
	
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycasts = $Raycasts
@onready var bomb_placement_system: BombPlacementSystem = $BombPlacementSystem
var max_bomb = 1

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	
	var collisions = raycasts.check_collisions()
	if collisions.has(movement):
		return
	position += movement * delta * movement_speed
	
	

>>>>>>> b2f0b7f02863757c8c0071786f24dd58541776ea
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("right"):
		movement = Vector2.RIGHT
		sprite.play("walk_right")
	elif Input.is_action_pressed("left"):
		movement = Vector2.LEFT
		sprite.play("walk_left")
	elif Input.is_action_pressed("up"):
		movement = Vector2.UP
		sprite.play("walk_up")
	elif Input.is_action_pressed("down"):
		movement = Vector2.DOWN
		sprite.play("walk_down")
	elif Input.is_action_just_pressed("place_bomb"):
		bomb_placement_system.place_bomb()
	else:
		movement = Vector2.ZERO
		sprite.stop()
