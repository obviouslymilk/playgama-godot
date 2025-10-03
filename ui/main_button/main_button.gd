@tool
class_name MainButton
extends Panel

@onready var IconNode = $ContentMargin/Content/Icon
@onready var LabelNode = $ContentMargin/Content/Label
@onready var ContentNode = $ContentMargin/Content

@export var icon: Texture2D:
	set(new_image):
		icon = new_image
		if IconNode:
			IconNode.texture = icon

@export var label: String = "":
	set(new_text):
		label = new_text
		if LabelNode:
			LabelNode.text = label

@export var color: Color = Color.WHITE:
	set(new_color):
		color = new_color
		if ContentNode:
			ContentNode.modulate = color

func _ready() -> void:
	IconNode.texture = icon;
	LabelNode.text = label;
	ContentNode.modulate = color;

func _notification(what):
	match what:
		NOTIFICATION_MOUSE_ENTER:
			var new_sb := get_theme_stylebox("panel").duplicate()
			new_sb.bg_color = color
			add_theme_stylebox_override("panel", new_sb)

			ContentNode.modulate = Color('#29292E')
		NOTIFICATION_MOUSE_EXIT:
			remove_theme_stylebox_override("panel")
			ContentNode.modulate = color
