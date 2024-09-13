extends Node2D
class_name BulletLaser

@onready var screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var state_move: StateCharacterMove = $StateMachine/StateCharacterMove

@export var moviment_direction: Vector2 = Vector2.UP

func _ready() -> void:

    if screen_notifier:
        screen_notifier.screen_exited.connect(_on_screen_notifier_screen_exited)
    else:
        push_warning("No screen notifier found! Bullet %s will not delet itself." % name)
    
    if state_move:
        state_move.default_direction = moviment_direction
    
    #TODO: Add laser blinking animation - with shaders.
    
    pass


func _on_screen_notifier_screen_exited() -> void:
    queue_free()
