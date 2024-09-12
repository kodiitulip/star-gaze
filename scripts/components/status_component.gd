extends Node
class_name StatusComponent

@export var max_health: int = 10
@export var health: int = max_health:
    set(hp):
        health = clamp(hp, 0, max_health)
@export var defense: int = 0


func receive_damage(attack: AttackResource) -> void:
    health -= _calculate_damage(attack)


func _calculate_damage(attack: AttackResource) -> int:
    var critical_damage: float = attack.damage * attack.critical_multiplier \
    if randf() > attack.critical_chance else 0.0
    
    var base_damage: float = attack.damage + critical_damage

    var total_damage: float = base_damage * (attack.damage / (attack.damage + defense))

    return round(total_damage)