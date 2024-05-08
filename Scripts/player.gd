extends CharacterBody2D

const RUN_SPEED = 400
const WALK_SPEED = 200
var speed = 200
var click = false


var bullet = preload("res://Scenes/bullet.tscn")
var bulletbox = preload("res://Scenes/bullet_box.tscn")

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * speed
	move_and_slide()
	
	$Armys.look_at(get_global_mouse_position())

func _input(event):
	if Input.is_action_just_pressed("Run"):
		speed = RUN_SPEED
		
	if Input.is_action_just_released("Run"):
		speed = WALK_SPEED
	if Input.is_action_just_pressed("LeftClick"):
		if click == false:
			attack()
			click = true
	if Input.is_action_just_released("LeftClick"):
		click = false
func attack():
	var tween = get_tree().create_tween()
	if get_global_mouse_position().x > global_position.x:
		tween.tween_property($Armys,"position",Vector2($Armys.position.x - 5,$Armys.position.y - 1),0.1)
	else:
		tween.tween_property($Armys,"position",Vector2($Armys.position.x + 5,$Armys.position.y - 1),0.1)
	tween.connect("finished",tween_finished)
	var Bullet = bullet.instantiate()
	get_tree().get_root().add_child(Bullet)
	Bullet.global_position = $Armys/ShotGun/ShootPosition.global_position
	var BulletBox = bulletbox.instantiate()
	get_tree().get_root().add_child(BulletBox)
	BulletBox.global_position = global_position
	
	var timer = get_tree().create_timer(0.2)
	await timer.timeout
	if click == true:
		attack()
		$Armys.global_position = $ArmysPosition.global_position
	

func tween_finished():
	var tween = get_tree().create_tween()
	tween.tween_property($Armys,"position",Vector2($ArmysPosition.position.x,$ArmysPosition.position.y),0.1)



