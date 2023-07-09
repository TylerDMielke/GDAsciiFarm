extends Control

signal display_sidebar(sidebar_name: String)

@onready var sidebar_home: MarginContainer = preload("res://scenes/sidebar_home.tscn").instantiate()
@onready var sidebar_buy: MarginContainer = preload("res://scenes/sidebar_buy.tscn").instantiate()


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
	

func _remove_all_sidebars() -> void:
	remove_child(sidebar_home)
	remove_child(sidebar_buy)

