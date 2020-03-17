tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene


func _on_body_entered(body):
	teleport()


func teleport():
	anim_player.play("fade_to_black")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _get_configuration_warning():
	return "The next scene property can't be empty" if not next_scene else ""
