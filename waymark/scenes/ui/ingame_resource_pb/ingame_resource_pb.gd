class_name IngameResourcePB extends TextureProgressBar


@export var resource_type: Globals.RESOURCE_TYPE
@export_range(0.0, 100.0, 0.1) var _max_value: float
@export_range(-100.0, 100.0, 0.1) var _value: float


func _ready() -> void:
	max_value = _max_value
	value = _value
	
	value_changed.connect(Signals.ingame_resource_changed.emit.bind(resource_type))
