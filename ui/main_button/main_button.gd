@tool
class_name MainButton
extends Control

signal pressed

@onready var content_node = $Panel/ContentMargin/Content
@onready var icon_node = $Panel/ContentMargin/Content/Icon
@onready var label_node = $Panel/ContentMargin/Content/Label
@onready var panel_node = $Panel

@export_group("Visual")
@export var icon: Texture2D:
	set(value):
		icon = value
		_update_visuals()
@export var label: String = "":
	set(value):
		label = value
		_update_visuals()
@export var color: Color = Color.WHITE
@export var is_secondary: bool = false;

@export_group("Route")
@export var route := ""

func _ready() -> void:
	_update_visuals()
	_apply_style()

func _on_mouse_entered() -> void:
	var sb = panel_node.get_theme_stylebox("panel").duplicate()
	sb.bg_color = color if not is_secondary else Color.WHITE
	panel_node.add_theme_stylebox_override("panel", sb)
	content_node.modulate = CustomColors.BG_PRIMARY if not is_secondary else CustomColors.BG_TERTIARY

func _on_mouse_exited() -> void:
	_apply_style()

func _apply_style() -> void:
	var sb = panel_node.get_theme_stylebox("panel").duplicate()
	sb.bg_color = CustomColors.BG_PRIMARY if not is_secondary else CustomColors.BG_TERTIARY
	panel_node.add_theme_stylebox_override("panel", sb)
	content_node.modulate = color if not is_secondary else Color.WHITE

func _update_visuals() -> void:
	if icon_node:
		icon_node.texture = icon
	if label_node:
		label_node.text = label


func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index != MOUSE_BUTTON_LEFT: return
		emit_signal("pressed")
		if route:
			Router.redirect(route)
