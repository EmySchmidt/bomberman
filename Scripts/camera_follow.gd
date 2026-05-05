extends Camera2D

@export var node_to_follow: Node2D
var offset_camera_x = 32

var inicial_x: float
func _ready() -> void:
	inicial_x = (get_viewport_rect().size.x / 2) / zoom.x - offset_camera_x	

func _process(_delta: float) -> void:
	position.x = node_to_follow.position.x + inicial_x


func _on_enemy_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_enemy_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
