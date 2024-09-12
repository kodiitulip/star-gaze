extends Area2D
class_name HitBoxComponent

@export var attack_resource: AttackResource

func _ready() -> void:
    area_entered.connect(_on_hurt_box_area_entered)


func _on_hurt_box_area_entered(area: Area2D) -> void:
    if not area is HurtBoxComponent:
        return
    var hurt_box: HurtBoxComponent = area

    hurt_box.hit.emit(attack_resource)