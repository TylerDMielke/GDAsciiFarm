extends Node


enum ENTITY {
    TRACTOR,
    PLOW,
    PLANTER,
}


## A request for an entity to be spawned has been made.
signal spawn_entity(entity_type: ENTITY)

## The mouse entered the gamemap.
signal mouse_entered_game_map

## The mouse exited the gamemap.
signal mouse_exited_game_map

## The mouse changed cells within the gamemap. Returns the new cell position of the mouse, [param new_position], the 
## old cell position of the mouse, [param old_position], and a dictionary of data describing the glyph that was at
## the old position, [param old_glyph].
signal mouse_changed_gamemap_cell(new_position: Vector2i, old_position: Vector2i, old_glyph: Dictionary)

## The size of the grid in the gamemap.
var grid_size: Vector2i = Vector2i(16, 16)