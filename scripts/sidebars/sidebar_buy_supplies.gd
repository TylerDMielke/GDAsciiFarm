extends MarginContainer

@onready var item_list: ItemList = $PanelContainer/VBoxContainer/MarginContainer/ItemList
@onready var back_button: Button = $PanelContainer/VBoxContainer/MarginContainer2/BackButton
@onready var supply_types: Array[String] = [
	"fertilizer",
	"pesticide",
	"herbicide",
]

func _ready():
	item_list.item_selected.connect(_on_item_pressed)
	back_button.pressed.connect(_on_back_pressed)

	_initialize_buy_list()


func _process(_delta):
	pass


func _on_item_pressed(id: int) -> void:
	if id == 0:
		print_debug("Fertilizer Pressed")
	elif id == 1:
		print_debug("Pesticide Pressed")
	elif id == 2:
		print_debug("Herbicide Pressed")


func _on_back_pressed() -> void:
	if get_parent().has_signal("display_sidebar"):
		get_parent().display_sidebar.emit("buy")


func _initialize_buy_list() -> void: 
	item_list.clear()
	for type in supply_types:
		var capital_type: String = type.capitalize()
		item_list.add_item(capital_type)
	item_list.add_item("", null, false)  # Add unselectable dummy entry to get final underline
