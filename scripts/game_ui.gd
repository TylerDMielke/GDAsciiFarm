extends MarginContainer

@onready var buy_menu: PackedScene = preload("res://scenes/sidebar_buy.tscn")

@onready var item_list: ItemList = $PanelContainer/VBoxContainer/MarginContainer/ItemList
@onready var quit_button: Button = $PanelContainer/VBoxContainer/MarginContainer2/QuitButton


func _ready():
	item_list.item_selected.connect(_on_item_pressed)
	quit_button.pressed.connect(func(): get_tree().quit())


func _process(_delta):
	pass


func _on_item_pressed(id: int):
	if id == 0:
		_load_buy_menu()
	elif id == 1:
		print_debug("Sell Pressed")


func _load_buy_menu():
	get_parent().add_child(buy_menu.instantiate())
	queue_free()


func _load_sell_menu():
	pass
