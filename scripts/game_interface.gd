extends Control

signal display_sidebar(sidebar_name: String)

@onready var sidebar_home: MarginContainer = $SidebarHome
@onready var sidebar_buy: MarginContainer = $SidebarBuy
@onready var sidebar_buy_equipment: MarginContainer = $SidebarBuyEquipment
@onready var sidebar_buy_buildings: MarginContainer = $SidebarBuyBuildings
@onready var sidebar_buy_supplies: MarginContainer = $SidebarBuySupplies


func _ready():
	display_sidebar.connect(_on_display_sidebar)


func _process(_delta):
	pass


func _on_display_sidebar(sidebar_name: String) -> void:
	_hide_all_sidebars()
	if sidebar_name.to_lower() == "home":
		sidebar_home.show()
	elif sidebar_name.to_lower() == "buy":
		sidebar_buy.show()
	elif sidebar_name.to_lower() == "buy_equipment":
		sidebar_buy_equipment.show()
	elif sidebar_name.to_lower() == "buy_buildings":
		sidebar_buy_buildings.show()
	elif sidebar_name.to_lower() == "buy_supplies":
		sidebar_buy_supplies.show()
	

func _hide_all_sidebars() -> void:
	sidebar_home.hide()
	sidebar_buy.hide()
	sidebar_buy_equipment.hide()
	sidebar_buy_buildings.hide()
	sidebar_buy_supplies.hide()
