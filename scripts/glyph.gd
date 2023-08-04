extends RefCounted
class_name Glyph


var _tile_map_location: Vector2i
var _color: Color


func _init(tile_map_location: Vector2i, color: Color = Color.GREEN):
    _tile_map_location = tile_map_location
    _color = color


func get_tile_map_location() -> Vector2i:
    return _tile_map_location


func get_color() -> Color:
    return _color


func set_tile_map_location(tile_map_location: Vector2i) -> void:
    _tile_map_location = tile_map_location


func set_color(color: Color) -> void:
    _color = color
