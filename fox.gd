extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flip: Timer = $flip
@onready var unflip: Timer = $unflip


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
