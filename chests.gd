extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var character_body_2d = $"../CharacterBody2D"
@onready var game_manager: Node = $"../../Game manager"

func _on_body_entered(character_body_2d):
	animated_sprite_2d.animation = "open"
	game_manager.add_point()
