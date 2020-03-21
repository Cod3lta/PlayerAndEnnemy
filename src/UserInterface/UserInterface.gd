extends Control


onready var scene_tree: = get_tree()
onready var paused_overlay: ColorRect = $"PauseOverlay"
onready var score: Label = $"Label"
onready var pause_title: Label = $"PauseOverlay/Title"

var paused: = false setget set_paused

func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func _on_PlayerData_player_died():
	self.paused = true
	pause_title.text = "You died"

func _unhandled_input(event):
	if event.is_action_pressed("pause") and pause_title.text != "You died":
		self.paused = not paused
		# self. ici nécessaire pour mettre la valeur
		# à jour avec le setter
		scene_tree.set_input_as_handled()
		# diriger tous les inputs vers scene_tree

func update_interface():
	score.text = "Score: %s" % PlayerData.score

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	paused_overlay.visible = value
