extends Area2D

class_name CentralExplosion
@onready var raycasts: Array[RayCast2D] = [
	$Raycasts/RayCastUp,
	$Raycasts/RayCastRight,
	$Raycasts/RayCastDown,
	$Raycasts/RayCastLeft
]

const DIRECTION_EXPLOSION = preload("uid://cjfv81sxcfcn5")

#explosão seu tamanho e direção
var size = 1

func _ready() -> void:
	check_raycasts()
		

func check_raycasts():
	var up_raycast = raycasts[0]
	up_raycast.target_position = up_raycast.target_position * size
	up_raycast.force_raycast_update()
	
