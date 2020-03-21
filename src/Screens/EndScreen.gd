extends Control

onready var label_score: Label = $"Label"

func _ready():
	label_score.text = label_score.text % [PlayerData.score, PlayerData.deaths]
