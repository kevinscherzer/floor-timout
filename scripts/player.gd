extends Area2D


@export var tile_size: int = 16

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var inputs: Dictionary = {"move_up": Vector2.UP,
			"move_down": Vector2.DOWN,
			"move_left": Vector2.LEFT,
			"move_right": Vector2.RIGHT}

var is_moving: bool = false
@export var animation_speed: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ray_cast_2d.target_position = Vector2.RIGHT * tile_size


func _unhandled_input(event: InputEvent) -> void:
	if is_moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir):
	if dir == "move_left":
		sprite_2d.flip_h = true
	elif dir == "move_right":
		sprite_2d.flip_h = false
	ray_cast_2d.target_position = inputs[dir] * tile_size
	ray_cast_2d.force_raycast_update()
	if !ray_cast_2d.is_colliding():
		var tween = create_tween()
		tween.tween_property(self, "position",position + inputs[dir] * tile_size, 1.0 / animation_speed).set_trans(Tween.TRANS_SINE)
		is_moving = true
		await tween.finished
		is_moving = false
