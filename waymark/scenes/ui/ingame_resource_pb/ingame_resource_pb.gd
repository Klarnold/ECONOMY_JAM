@tool
class_name IngameResourcePB extends TextureProgressBar


@export var resource_type: Globals.RESOURCE_TYPE
@export_range(0.0, 100.0, 0.1) var _max_value: float
@export_range(-100.0, 100.0, 0.1) var _value: float:
	set(new_value):
		_value = clampf(new_value, -100.0, 100.0)
		value = _value


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	max_value = _max_value
	value = _value
