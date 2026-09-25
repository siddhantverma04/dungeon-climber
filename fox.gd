extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flip: Timer = $flip
@onready var unflip: Timer = $unflip
@onready var die_timer: Timer = $"die timer"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flip.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_unflip_timeout() -> void:
	animated_sprite_2d.flip_h = false
	flip.start()


func _on_flip_timeout() -> void:
	animated_sprite_2d.flip_h = true
	unflip.start()



func _on_die_timer_timeout() -> void:
	queue_free()




func _on_body_entered(body: Node2D) -> void:
	print("Something entered the area: ", body.name) # TEST 1
	
	if body is CharacterBody2D: 
		print("It is a CharacterBody2D!") # TEST 2
		
		if Input.is_key_pressed(KEY_L):
			print("Attack button detected! Playing die animation.") # TEST 3
			flip.stop()
			unflip.stop()
			animated_sprite_2d.play("die")
			die_timer.start()
			animation_player.pause()
