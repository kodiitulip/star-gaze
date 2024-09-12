extends Node
class_name StateMachine

@export var initial_state: State

var states: Dictionary = {}
var current_state: State = null

func _ready() -> void:
    _register_child_states()

    if initial_state:
        current_state = initial_state
        current_state.enter()


func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)


func _physics_process(delta: float) -> void:
    if current_state:
        current_state.physics_update(delta)


func _on_state_transition(state_name: String) -> void:
    if not states.has(state_name.to_snake_case()):
        push_warning("State %s not found" % state_name)
        return

    if current_state:
        current_state.exit()
    
    current_state = states[state_name.to_snake_case()]
    current_state.enter()
    

func _register_child_states() -> void:
    for child: Node in get_children():
        if child is State:
            var state: State = child
            states[state.name.to_snake_case()] = state
            state.state_transitioned.connect(_on_state_transition)