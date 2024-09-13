extends Node
class_name InputComponent

enum InputType {
    VECTOR, ## Checks for Vector-like inputs and emits [code]vector_input_received[/code]
    AXIS, ## Checks for an axis between two actions and emits [code]axis_input_received[/code]
    SINGLE, ## Checks for a single action pressed and emits [code]single_input_received[/code]
}

signal vector_input_received(input_dir: Vector2)
signal axis_input_received(input_axis: float)
signal single_input_received(input_single: bool)

## The type of Input this Component will check
@export var input_type: InputType = InputType.VECTOR

@export_group("Vector Input","vector_input_")
## Negative x action for vector inputs
@export var vector_input_negative_x: StringName = "move_left"
## Positive x action for vector inputs
@export var vector_input_positive_x: StringName = "move_right"
## Negative y action for vector inputs
@export var vector_input_negative_y: StringName = "move_fowards"
## Positive y action for vector inputs
@export var vector_input_positive_y: StringName = "move_backwards"

@export_group("Axis Input","axis_input_")
## Negative action for axis inputs
@export var axis_input_negative_action: StringName = "move_left"
## Positive action for axis inputs
@export var axis_input_positive_action: StringName = "move_right"

@export_group("Single Input","single_input_")
## Action for single inputs
@export var single_input_action: StringName = "shoot"

func _process(_delta: float) -> void:
    match input_type:
        InputType.VECTOR:
            _handle_vector_type_input()
        InputType.AXIS:
            _handle_axis_type_input()
        InputType.SINGLE:
            _handle_single_type_input()


func _handle_vector_type_input() -> void:
    var dir: Vector2 = Input.get_vector(
        vector_input_negative_x,
        vector_input_positive_x,
        vector_input_negative_y,
        vector_input_positive_y
    )
    vector_input_received.emit(dir)


func _handle_axis_type_input() -> void:
    axis_input_received.emit(Input.get_axis(
        axis_input_negative_action,
        axis_input_positive_action
    ))


func _handle_single_type_input() -> void:
    single_input_received.emit(
        Input.is_action_just_pressed(single_input_action))