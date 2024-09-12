extends Area2D
class_name HurtBoxComponent

signal hit(attack_resource: AttackResource)

@export var status_component: StatusComponent

func _ready() -> void:
    if not status_component:
        return
    
    hit.connect(status_component.receive_damage)