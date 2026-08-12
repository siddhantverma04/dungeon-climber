extends Node
@onready var label: Label = $"../UI/Panel/Label"
@export var hearts : Array[Node]
var points = 0
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func decrease_health():
	lives -= 1
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (lives == 0):
		get_tree().change_scene_to_file("res://Main menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func add_point():
	points += 1 
	print(points)
	label.text = "Points: " + str(points)

	
