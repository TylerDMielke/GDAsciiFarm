extends Node

enum ENTITY {
    TRACTOR,
    PLOW,
    PLANTER,
}

signal spawn_entity(entity_type: ENTITY)
