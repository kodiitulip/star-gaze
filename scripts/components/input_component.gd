extends Node
class_name InputComponent

signal input_received(input_dir: Vector2)


func _ready() -> void:
    set_multiplayer_authority(get_parent().get_multiplayer_authority())


func _process(_delta: float) -> void:
    if not is_multiplayer_authority():
        return

    var dir: Vector2 = Input.get_vector(
        "move_left",
        "move_right",
        "move_fowards",
        "move_backwards"
    )

    input_received.emit(dir)