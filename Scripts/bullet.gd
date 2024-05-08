extends Area2D


var mouse_pos
var distance = Vector2.ZERO
var speed = 400

func _ready():
	var timer = get_tree().create_timer(0,2)
	await timer.timeout
	mouse_pos = get_global_mouse_position()
	distance = (mouse_pos - global_position).normalized()
	look_at(mouse_pos)
	
func _physics_process(delta):
	position += distance * speed * delta


func _on_area_entered(area):
	pass
