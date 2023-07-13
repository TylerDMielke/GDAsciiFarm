extends Node2D


func _ready():
	Globals.spawn_entity.connect(_on_spawn_entity)


func _process(_delta):
	pass


func _on_spawn_entity(type: Globals.ENTITY):
	print_debug("Spawning Entity: {0}".format([Globals.ENTITY.keys()[type]]))