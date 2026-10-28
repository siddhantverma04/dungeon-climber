extends Node

@export var hearts: Array[Node]

@onready var label: Label = $"../UI/Panel/Label"
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"


var points:
	get:
		return GameState.points
	set(value):
		GameState.points = value


var lives:
	get:
		return GameState.lives
	set(value):
		GameState.lives = value


func _ready():
	update_ui()


func decrease_health():

	if lives <= 0:
		return

	lives -= 1

	update_ui()

	if lives <= 0:
		character_body_2d.dead()


func add_point():
	points += 1
	print(points)

	update_ui()


func update_ui():
	label.text = " = " + str(points)

	for h in range(hearts.size()):
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()
