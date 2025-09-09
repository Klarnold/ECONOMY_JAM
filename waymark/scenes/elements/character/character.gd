class_name Character extends Control


@export var character_res: CharacterRes


func _ready() -> void:
	assert(character_res != null, "%s character has no character res" % name)
