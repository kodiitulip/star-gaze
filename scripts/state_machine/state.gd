extends Node
class_name State

signal state_transitioned(state_name: String)

func enter() -> void:
    pass


func exit() -> void:
    pass


func update(_delta: float) -> void:
    pass


func physics_update(_delta: float) -> void:
    pass


func _transition_to(state_name: String) -> void:
    state_transitioned.emit(state_name)