class_name PreEndTurnPanel extends Control


@onready var _end_turn: Button = %EndTurn
@onready var _back: Button = %Back


func _ready() -> void:
	_end_turn.pressed.connect(queue_free) # TODO to finish end_turn calculation 
										  # and it's appearence
	_back.pressed.connect(queue_free)  
