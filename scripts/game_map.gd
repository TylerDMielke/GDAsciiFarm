extends Node2D

@export var map_orig: Vector2i = Vector2i(0,0)
@export var map_size: Vector2i = Vector2i(DisplayServer.window_get_size() / Vector2i(16, 16))
@onready var foreground = $Foreground
@onready var background = $Background

var TILES = {
	"PERIOD": Vector2i(14, 2),
	"SQUARE": Vector2i(11, 13)
}

enum TILE_COLOR {
	WHITE,
	GREEN,
	RED,
	BLUE,
	BLACK
}


func _ready():
	pass


func _process(_delta):
	pass


func update_foreground(coord: Vector2i, glyph: Vector2i, color: TILE_COLOR):
	foreground.set_cell(color, coord, 0, glyph)


func update_background(coord: Vector2i, glyph: Vector2i, color: TILE_COLOR):
	background.set_cell(color, coord, 0, glyph)


func fill_foreground(glyph: Vector2i, color: TILE_COLOR):
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_foreground(update_cell, glyph, color)


func fill_background(glyph: Vector2i, color: TILE_COLOR):
	for x in range(map_orig.x, map_size.x):
		for y in range(map_orig.y, map_size.y):
			var update_cell = Vector2i(x,y)
			update_background(update_cell, glyph, color)