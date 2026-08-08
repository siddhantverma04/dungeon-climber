extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var ladder_ray_cast = $LadderRayCast
@onready var timer: Timer = $Timer


var is_in_trap = false
var is_dead = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	var ladderCollider = ladder_ray_cast.get_collider()
	
	if ladderCollider: _ladder_climb(delta)
	else: _movement(delta)

	move_and_slide()
	
func _ladder_climb(delta):
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	if direction: velocity = direction * SPEED / 1
	else: velocity = Vector2.ZERO
	
	if velocity: 
		animated_sprite_2d.play("CLimb")
	else:
		animated_sprite_2d.stop()
		
	
func _movement(delta):
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.play("walk")
	else:
		if is_in_trap == true:
			animated_sprite_2d.play("die")
		else:
			animated_sprite_2d.play("idle")
	
	#death
	if is_dead == true:
		velocity.x = 0
		velocity.y = 50
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.play("jump")


	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 16)

	var isLeft = velocity.x < 0 
	animated_sprite_2d.flip_h = isLeft  
	





func _on_platform_collision_body_entered(body):
	print("Entered a Layer 2 zone: ", body.name)


func _on_platform_collision_area_entered(area):
	print("Entered a Layer 2 zone: ", area.name)
	
	
	if area.is_in_group("doors"):
		timer.start()
		velocity.x = 0
		velocity.y = -10
		return
	
	if area.is_in_group("traps"):
		is_in_trap = true # Turn the switch ON
		is_dead = true
		fade_away()
		

func _on_platform_collision_area_exited(area):
	if area.is_in_group("traps"):
		is_in_trap = false # Turn the switch OFF when they leave
		is_dead = false
	
	
func fade_away():
	var tween = create_tween()
# Fades the alpha (transparency) to 0 over 1.5 seconds
	tween.tween_property(self, "modulate:a", -1, 1.6)
# Optional: Free the node from memory after the fade finishes
	await tween.finished



func _on_timer_timeout() -> void:
	fade_away()
