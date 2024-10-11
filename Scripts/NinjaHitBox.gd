extends Area2D

@onready var ninja: Ninja = $".."

func _ready() -> void:
	area_entered.connect(take_damage)

func take_damage(area: Area2D) -> void:
	if area is HitSource:
		ninja.damaged.emit()
