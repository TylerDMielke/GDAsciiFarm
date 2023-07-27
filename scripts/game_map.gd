extends Node2D

@export var map_orig: Vector2i = Vector2i(0,0)
@export var map_size: Vector2i = Vector2i(DisplayServer.window_get_size() / Vector2i(16, 16))
@onready var foreground: TileMap = $Foreground
@onready var background: TileMap = $Background

var TILES = {
	"PERIOD": Vector2i(14, 2),
	"SQUARE": Vector2i(11, 13),
	"STRAIGHT_FACE": Vector2i(0, 4),
}


func _ready():
	pass


func _process(_delta):
	pass


func _get_color_layer(tilemap: TileMap, color: Color) -> int:
	for layer_idx in range(tilemap.get_layers_count()):
		if tilemap.get_layer_modulate(layer_idx) == color:
			return layer_idx
	var new_layer_idx: int = tilemap.get_layers_count()
	tilemap.add_layer(new_layer_idx)
	tilemap.set_layer_modulate(new_layer_idx, color)
	return new_layer_idx


func erase_cell(coord: Vector2i, tile_map: TileMap):
	for layer_idx in range(tile_map.get_layers_count()):
		tile_map.erase_cell(layer_idx, coord)


func update_foreground(coord: Vector2i, glyph: Vector2i, color: Color) -> void:
	# Update a tile on the foreground tilemap
	# Args:
	# 	coord: The coordinate on the foreground tilemap that will be updated.
	#	glyph: The glyph that should be placed at the coordinate.
	#	color: The color that the glyph should be.
	var color_layer_idx: int = _get_color_layer(foreground, color)
	erase_cell(coord, foreground)
	foreground.set_cell(color_layer_idx, coord, 0, glyph)


func update_background(coord: Vector2i, glyph: Vector2i, color: Color) -> void:
	# Update a tile on the background tilemap
	# Args:
	# 	coord: The coordinate on the background tilemap that will be updated.
	#	glyph: The glyph that should be placed at the coordinate.
	#	color: The color that the glyph should be.
	var color_layer_idx: int = _get_color_layer(background, color)
	erase_cell(coord, background)
	background.set_cell(color_layer_idx, coord, 0, glyph)


func fill_foreground(glyph: Vector2i, color: Color) -> void:
	# Fill the foreground tilemap with a single glyph
	# Args:
	#	glyph: The glyph that the foreground should be filled with.
	#	color: The color that the glyph should be.
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_foreground(update_cell, glyph, color)


func fill_background(glyph: Vector2i, color: Color) -> void:
	# Fill the foreground tilemap with a single glyph
	# Args:
	#	glyph: The glyph that the foreground should be filled with.
	#	color: The color that the glyph should be.
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_background(update_cell, glyph, color)
