extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var character_body_2d = $"../CharacterBody2D"

func _on_body_entered(character_body_2d):
	animated_sprite_2d.animation = "open"
