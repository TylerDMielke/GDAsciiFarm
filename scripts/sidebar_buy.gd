extends MarginContainer

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
	if get_parent().has_signal("display_sidebar"):
		get_parent().display_sidebar.emit("home")