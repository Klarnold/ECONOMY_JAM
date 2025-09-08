class_name ActionSpawner extends TextureRect


@export_range(0.0, 1000.0, 1.0) var max_chain_length: float
@export var action_scene: PackedScene

var dragged: bool = false:
	set(new_dragged):
		dragged = new_dragged
		call_deferred("set_physics_process", dragged)
var drag_st_pos: Vector2


func _ready() -> void:
	set_physics_process(false)


func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		dragged = true
		drag_st_pos = global_position - get_global_mouse_position()
		set_physics_process(true)


func _physics_process(delta: float) -> void:
	var current_mouse_global_pos: Vector2 = get_global_mouse_position()
	if (drag_st_pos - current_mouse_global_pos).length() > max_chain_length:
		dragged = false
		var new_action: Action = action_scene.instantiate()
		get_tree().current_scene.call_deferred("add_child", new_action)
		new_action.global_position = get_global_mouse_position() + new_action.size/2.0
