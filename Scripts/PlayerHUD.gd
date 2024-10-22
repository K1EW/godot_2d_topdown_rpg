extends CanvasLayer

@onready var hp_progress_bar: ProgressBar = $HPBarPanel/HPProgressBar

func _process(delta: float) -> void:
	var red: int = 255 * (1 - PlayerStatus.player_health/100.0)
	var green: int = 255 * (PlayerStatus.player_health / 100.0)
	hp_progress_bar.value = PlayerStatus.player_health
	hp_progress_bar.get_theme_stylebox("fill").bg_color = Color8(red, green, 0.0)
