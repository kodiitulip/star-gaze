extends Node2D
class_name WeaponLaserShooter

@onready var input_component: InputComponent = $InputComponent

@export var bullet_scene: PackedScene

var pointing_direction: Vector2 = Vector2.UP

func _ready() -> void:
    if input_component:
        input_component.single_input_received.connect(_on_input_received)


func _on_input_received(input_single: bool) -> void:
    if not input_single:
        return
    
    var bullet: BulletLaser = bullet_scene.instantiate()
    bullet.moviment_direction = pointing_direction
    bullet.position += pointing_direction * 2
    add_child(bullet, true)