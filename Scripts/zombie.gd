extends CharacterBody2D

var speed = 200


func _process(delta):
	var player = get_owner().get_node("Player")
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	$LeftArm.look_at(player.global_position)
	$RightArm.look_at(player.global_position)
