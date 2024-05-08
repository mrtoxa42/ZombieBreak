extends CharacterBody2D

var speed = 200

func _process(delta):
	#var player = get_tree().get_nodes_in_group("Player")
	var root_node = get_tree().root
	var player = root_node.get_node("MainGame/Player")
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	$LeftArm.look_at(player.global_position)
	$RightArm.look_at(player.global_position)
