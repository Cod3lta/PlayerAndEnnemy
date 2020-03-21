tool
extends Button


export(String, FILE) var next_scene_path: = ""


func _on_button_up():
	pass # Replace with function body.
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)


func _get_configuration_warning():
	return "next_get_scene_path must be set for the button work" if next_scene_path == "" else ""
