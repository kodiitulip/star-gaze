extends StateCharacterMove
class_name StateCharacterPlayerMove

@export var input_component: InputComponent


func enter() -> void:
    if input_component:
        input_component.vector_input_received.connect(_on_input_received)


func exit() -> void:
    if input_component:
        input_component.vector_input_received.disconnect(_on_input_received)


func _on_input_received(input_dir: Vector2) -> void:
    direction = input_dir.normalized()