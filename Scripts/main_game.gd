extends Node2D

var zombie = preload("res://Scenes/zombie.tscn")

func _on_spawn_timer_timeout():
	var Zombie = zombie.instantiate()
	get_tree().get_root().add_child(Zombie)
	#$ZombieSpawner/SpawnTimer.start()
