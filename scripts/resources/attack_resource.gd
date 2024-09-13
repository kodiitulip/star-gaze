extends Resource
class_name AttackResource

@export var damage: float = 1.0
@export_range(0.0, 1.0, 0.01,'allow_greater') var critical_chance: float = 0.0:
    set(crit):
        critical_chance = max(crit, 0.0)
@export_range(0.0, 1.0, 0.01,'allow_greater') var critical_multiplier: float = 0.2:
    set(crit_mult):
        critical_multiplier = max(crit_mult, 0.0)