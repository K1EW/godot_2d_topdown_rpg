extends State

@onready var ninja: Ninja = $"../.."
@onready var idle_state: Node = $"../NinjaIdle"
@onready var hit_flash: AnimationPlayer = $"../../HitBox/HitFlash"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"
@onready var ninja_get_hit_sfx: AudioStream = preload("res://Assets/SFX/NinjaGetHit.wav")

var SPEED: float = 80

func enter() -> void:
	ninja.invisible = true
	audio_stream_player_2d.stream = ninja_get_hit_sfx
	audio_stream_player_2d.volume_db = -10
	audio_stream_player_2d.play()
	hit_flash.play("flashed")
	await hit_flash.animation_finished
	ninja.invisible = false

func exit() -> void:
	pass

func process(delta: float) -> State:
	if ninja.invisible == false:
		return idle_state
	return null

func physics_process(delta: float) -> State:
	ninja.update_animation("walk")
	ninja.velocity = ninja.direction * SPEED
	return null

func handle_input(event: InputEvent) -> State:
	return null
