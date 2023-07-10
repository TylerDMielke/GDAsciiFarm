extends MarginContainer

@onready var item_list: ItemList = $PanelContainer/VBoxContainer/MarginContainer/ItemList
@onready var quit_button: Button = $PanelContainer/VBoxContainer/MarginContainer2/QuitButton


func _ready():
	item_list.item_selected.connect(_on_item_pressed)
	quit_button.pressed.connect(func(): get_tree().quit())


func _process(_delta):
	pass


func _on_item_pressed(id: int):
	if get_parent().has_signal("display_sidebar"):
		if id == 0:
			get_parent().display_sidebar.emit("buy")
			print_debug("Buy Pressed")
		elif id == 1:
			print_debug("Sell Pressed")


