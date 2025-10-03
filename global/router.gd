extends Node

const ROUTES: Dictionary[String, NodePath] = {
	"menu": "res://scenes/menu/menu.tscn",
	"platform": "res://scenes/platform/platform.tscn"
}

func redirect(route_name: String) -> void:
	get_tree().change_scene_to_file(ROUTES[route_name])
