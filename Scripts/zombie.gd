extends CharacterBody2D

var speed = 200


func _process(delta):
	var player = get_owner().get_node("Player")
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	$Skeleton2D/Bone2D/Bone2D/l.look_at(player.global_position)
	$Skeleton2D/Bone2D/Bone2D/r.look_at(player.global_position)
