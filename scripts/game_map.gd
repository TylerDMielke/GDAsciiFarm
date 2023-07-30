extends Node2D


@onready var foreground: TileMap = $Foreground
@onready var background: TileMap = $Background
@onready var boundary: Area2D = $Boundary

var map_orig: Vector2i = Vector2i(0,0)
var map_size: Vector2i = Vector2i((DisplayServer.window_get_size() - Vector2i(position)) / Globals.grid_size)

var TILES = {
	"PERIOD": Vector2i(14, 2),
	"SQUARE": Vector2i(11, 13),
	"STRAIGHT_FACE": Vector2i(0, 4),
}


func _ready():
	boundary.mouse_entered.connect(_on_mouse_entered)
	boundary.mouse_exited.connect(_on_mouse_exited)

	_initialize_boundary()


func _process(_delta):
	pass


func _on_mouse_entered() -> void:
	Globals.mouse_entered_game_map.emit()


func _on_mouse_exited() -> void:
	Globals.mouse_exited_game_map.emit()


func _initialize_boundary() -> void:
	boundary.position = Vector2(map_size * Globals.grid_size) / Vector2(2, 2)
	var collision_shape: CollisionShape2D = boundary.get_node("CollisionShape2D")
	var rectangle_shape: RectangleShape2D = RectangleShape2D.new()
	# Not sure why the Vector2.ONE is needed...
	rectangle_shape.size = Vector2(map_size * Globals.grid_size) - Vector2.ONE
	collision_shape.shape = rectangle_shape


func _get_color_layer(tilemap: TileMap, color: Color) -> int:
	for layer_idx in range(tilemap.get_layers_count()):
		if tilemap.get_layer_modulate(layer_idx) == color:
			return layer_idx
	var new_layer_idx: int = tilemap.get_layers_count()
	tilemap.add_layer(new_layer_idx)
	tilemap.set_layer_modulate(new_layer_idx, color)
	return new_layer_idx


## Get the local position, [param local_position], as a cell position on the tilemap. If trying to map a global 
## postion, use the [method Node2D.to_local] before passing to this function.
func get_mouse_position(local_position: Vector2) -> Vector2i:
	var mouse_pos = foreground.local_to_map(local_position)
	# TODO: This is a hack. Figure out how to detect if the mouse is over the game map and only return a value then.
	var magic_number = 14
	# Godot seems to be mapping the global positions with the global orgin at 0,0 relative to the game screen. Since
	# The gamemap's origin is offset, by 14 tiles worth of pixels, we must adjust. 
	return mouse_pos - Vector2i(magic_number, 0)


## Clear all color layers on the provided tilemap, [param tile_map], at the coordinate, [param coord]
func erase_cell(coord: Vector2i, tile_map: TileMap) -> void:
	for layer_idx in range(tile_map.get_layers_count()):
		tile_map.erase_cell(layer_idx, coord)


## Update a tile to be the glpyh, [param glyph], of color, [param color], on the foreground tilemap at coordinate, 
## [param coord].
func update_foreground(coord: Vector2i, glyph: Vector2i, color: Color) -> void:
	var color_layer_idx: int = _get_color_layer(foreground, color)
	erase_cell(coord, foreground)
	foreground.set_cell(color_layer_idx, coord, 0, glyph)


## Update a tile to be the glyph, [param glyph], of color, [param color], on the background tilemap at coordinate, 
## [param coord].
func update_background(coord: Vector2i, glyph: Vector2i, color: Color) -> void:
	var color_layer_idx: int = _get_color_layer(background, color)
	erase_cell(coord, background)
	background.set_cell(color_layer_idx, coord, 0, glyph)


## Fill the foreground tilemap with the provided glyph, [param glyph], colored with the provided color, [param color].
func fill_foreground(glyph: Vector2i, color: Color) -> void:
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_foreground(update_cell, glyph, color)


## Fill the background tilemap with the provided glyph, [param glyph], colored with the provided color, [param color].
func fill_background(glyph: Vector2i, color: Color) -> void:
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_background(update_cell, glyph, color)
