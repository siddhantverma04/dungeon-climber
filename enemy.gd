extends RigidBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@onready var area_2d_2: Area2D = $Area2D2
@onready var game_manager: Node = $"../../Game manager"
@onready var damage_timer: Timer = $"damage timer"
@onready var die_timer: Timer = $"Die timer"

var can_damage = true
var player_touching = false

func on_ready():
	animated_sprite_2d.play("idle")

func _process(delta):
	die(delta)

func die(delta):
	if player_touching == true:
		if Input.is_key_pressed(KEY_L):
				animated_sprite_2d.play("die")
				area_2d.queue_free()
				area_2d_2.queue_free()
				print("touched")
				die_timer.start()
				return
		else:
			pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		animated_sprite_2d.play("attack")
		animated_sprite_2d.flip_h = true
		player_touching = true

		if can_damage:
			can_damage = false
			game_manager.decrease_health()
			damage_timer.start()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		animated_sprite_2d.play("attack")
		animated_sprite_2d.flip_h = false 
		player_touching = true
		if Input.is_key_pressed(KEY_L):
			animated_sprite_2d.play("die")
			return
		if can_damage:
			can_damage = false
			game_manager.decrease_health()
			damage_timer.start()





func _on_timer_timeout() -> void:
	animated_sprite_2d.play("idle")
	can_damage = true
	damage_timer.stop()
	if player_touching:
		game_manager.decrease_health()
		damage_timer.start()
		animated_sprite_2d.play("attack")
		if Input.is_key_pressed(KEY_L):
			animated_sprite_2d.play("die")
			return


func _on_area_2d_2_area_exited(area: Area2D) -> void:
	player_touching = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	player_touching = false


			


func _on_die_timer_timeout() -> void:
	queue_free()
