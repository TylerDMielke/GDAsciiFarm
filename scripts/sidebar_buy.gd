extends MarginContainer

@onready var previous_menu: PackedScene = preload("res://scenes/sidebar.tscn")

@onready var item_list: ItemList = $PanelContainer/VBoxContainer/MarginContainer/ItemList
@onready var back_button: Button = $PanelContainer/VBoxContainer/MarginContainer2/BackButton


func _ready():
	item_list.item_selected.connect(_on_item_pressed)
	back_button.pressed.connect(_on_back_pressed)


func _process(_delta):
	pass


func _on_item_pressed(id: int):
	if id == 0:
		print_debug("Equipment Pressed")
	elif id == 1:
		print_debug("Buildings Pressed")
	elif id == 2:
		print_debug("Supplies Pressed")


func _on_back_pressed():
	print_debug("Previous Menu: {0}".format([previous_menu]))
	print_debug("Parent Node: {0}".format([get_parent()]))
	get_parent().add_child(previous_menu.instantiate())
	queue_free()