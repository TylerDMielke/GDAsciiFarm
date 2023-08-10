extends RefCounted
class_name Glyph
## A class to hold data representing a glyph on the screen.


## Where in the tilemap the glyph is located.
var tile_map_location: Vector2i:
    get:
        return tile_map_location
    set(value):
        tile_map_location = value


## The foreground color of the glyph.
var fg_color: Color:
    get:
        return fg_color
    set(value):
        fg_color = value


## The background color of the glyph.
var bg_color: Color:
    get:
        return bg_color
    set(value):
        bg_color = value


func _init(tm_loc: Vector2i, fg_clr: Color = Color.WHITE, bg_clr: Color = Color.BLACK):
    tile_map_location = tm_loc
    fg_color = fg_clr
    bg_color = bg_clr


func copy() -> Glyph:
    return Glyph.new(self.tile_map_location, fg_color, bg_color)
