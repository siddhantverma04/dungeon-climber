extends RigidBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@onready var area_2d_2: Area2D = $Area2D2
@onready var collision_shape_2d_3: CollisionShape2D = $Area2D/CollisionShape2D3
@onready var collision_shape_2d: CollisionShape2D = $Area2D2/CollisionShape2D
@onready var game_manager: Node = $"../../Game manager"

func _ready() -> void:
	pass
	
func _on_area_2d_area_entered(body):
	animated_sprite_2d.play("attack")
	animated_sprite_2d.flip_h = true
	timer.start()



func _on_timer_timeout() -> void:
	animated_sprite_2d.play("idle")


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	animated_sprite_2d.play("attack")
	animated_sprite_2d.flip_h = false
	timer.start()
