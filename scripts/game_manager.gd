class_name GameManager extends Node

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_map_layer.erase_cell(Vector2i(8,8))


# Called every frame. 'delta' is the elapsed time since the previous frame.
