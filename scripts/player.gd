extends Area2D


@export var tile_size: int = 16


@onready var sprite_2d: Sprite2D = $Sprite2D

var inputs = {"move_up": Vector2.UP,
			"move_down": Vector2.DOWN,
			"move_left": Vector2.LEFT,
			"move_right": Vector2.RIGHT}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir):
	position += inputs[dir] * tile_size
	if dir == "move_left":
		sprite_2d.flip_h = true
	elif dir == "move_right":
		sprite_2d.flip_h = false
