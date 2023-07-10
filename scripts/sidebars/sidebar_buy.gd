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
		if get_parent().has_signal("display_sidebar"):
			get_parent().display_sidebar.emit("buy_equipment")
	elif id == 1:
		if get_parent().has_signal("display_sidebar"):
			get_parent().display_sidebar.emit("buy_buildings")
	elif id == 2:
		if get_parent().has_signal("display_sidebar"):
			get_parent().display_sidebar.emit("buy_supplies")


func _on_back_pressed():
	if get_parent().has_signal("display_sidebar"):
		get_parent().display_sidebar.emit("home")