extends State
class_name StateCharacterMove

@export var default_direction: Vector2
@export var character: Node2D
@export var move_speed: float = 5.0

var direction: Vector2

func enter() -> void:
    direction = default_direction


func update(delta: float) -> void:
    if not character:
        return
    
    if direction:
        character.global_position += direction * move_speed * delta
