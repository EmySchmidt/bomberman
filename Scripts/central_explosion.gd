extends Area2D

class_name CentralExplosion

const TILE_SIZE = 16 
const DIRECTION_EXPLOSION = preload("uid://cjfv81sxcfcn5")

@onready var raycasts: Array[RayCast2D] = [
	$Raycasts/RayCastUp,
	$Raycasts/RayCastRight,
	$Raycasts/RayCastDown,
	$Raycasts/RayCastLeft
]

var size = 1

func _ready() -> void:
	check_raycasts()

func check_raycasts():
	
	# UP
	var up_raycast = raycasts[0]
	check_raycast_for_direction("up", up_raycast, Vector2(0, -TILE_SIZE))
	
	var right_raycast = raycasts[1] 
	check_raycast_for_direction("right", right_raycast, Vector2(TILE_SIZE, 0))

func check_raycast_for_direction(animation_name: String, raycast: RayCast2D, animation_direction: Vector2):
	raycast.target_position = raycast.target_position * size
	raycast.force_raycast_update()
	
	if !raycast.is_colliding():
		create_explosion_for_size(size, animation_name, animation_direction)
	else:
		var size_of_explosion = calculate_size_of_explosion(raycast)
		var collider = raycast.get_collider()
		if size_of_explosion != null:
			create_explosion_for_size(size_of_explosion, animation_name, animation_direction)
		execute_explosion_collision(collider)

func create_explosion_for_size(p_size: int, animation_name: String, animation_position: Vector2):
	for i in range(p_size): 
		if i < p_size - 1:
			create_explosion_animation_slice("%s_middle" % animation_name, animation_position * (i + 1))
		else:
			create_explosion_animation_slice("%s_end" % animation_name, animation_position * (i + 1))

func create_explosion_animation_slice(animation_name: String, animation_position: Vector2):
	var directional_explosion = DIRECTION_EXPLOSION.instantiate()
	directional_explosion.position = animation_position
	add_child(directional_explosion)
	if directional_explosion.has_method("play_animation"):
		directional_explosion.play_animation(animation_name)

func calculate_size_of_explosion(raycast: RayCast2D):
	var collider = raycast.get_collider()
	if collider is TileMapLayer:
		var collision_point = raycast.get_collision_point()
		var distance_to_collider = raycast.global_position.distance_to(collision_point)
		return max(roundi(absf(distance_to_collider) / TILE_SIZE - 1), 0)
	return null

func execute_explosion_collision(collider: Object):
	if collider.is_in_group("bricks"):
		collider.destroy()
	elif collider.is_in_group("enemies"):
		collider.die()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("players"):
		area.die()
