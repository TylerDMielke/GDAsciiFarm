extends Control

signal display_sidebar(sidebar_name: String)

@onready var sidebar_home: MarginContainer = preload("res://scenes/sidebars/sidebar_home.tscn").instantiate()
@onready var sidebar_buy: MarginContainer = preload("res://scenes/sidebars/sidebar_buy.tscn").instantiate()
@onready var sidebar_buy_equipment: MarginContainer = preload("res://scenes/sidebars/sidebar_buy_equipment.tscn").instantiate()
@onready var sidebar_buy_buildings: MarginContainer = preload("res://scenes/sidebars/sidebar_buy_buildings.tscn").instantiate()
@onready var sidebar_buy_supplies: MarginContainer = preload("res://scenes/sidebars/sidebar_buy_supplies.tscn").instantiate()


func _ready():
	display_sidebar.connect(_on_display_sidebar)


func _process(_delta):
	pass


func _on_display_sidebar(sidebar_name: String) -> void:
	_remove_all_sidebars()
	if sidebar_name.to_lower() == "home":
		add_child(sidebar_home)
	elif sidebar_name.to_lower() == "buy":
		add_child(sidebar_buy)
	elif sidebar_name.to_lower() == "buy_equipment":
		add_child(sidebar_buy_equipment)
	elif sidebar_name.to_lower() == "buy_buildings":
		add_child(sidebar_buy_buildings)
	elif sidebar_name.to_lower() == "buy_supplies":
		add_child(sidebar_buy_supplies)
	

func _remove_all_sidebars() -> void:
	print("Children in GameInterface Before Purge:")
	for child in get_children():
		print_debug("Child: {0}".format([child]))
	print("\n")
	for sidebar in find_children("*"):
		print_debug("Removing Child: {0}".format([sidebar]))
		remove_child(sidebar)
		# sidebar.queue_free()
	print("\n")
	print("Children in GameInterface After Purge:")
	for child in get_children():
		print_debug("Child: {0}".format([child]))
	print("\n")
