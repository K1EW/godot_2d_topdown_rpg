extends State

@onready var ninja: Ninja = $"../.."
@onready var idle_state: State = $"../NinjaIdle"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"
@onready var sword_swoosh_sfx: AudioStream = preload("res://Assets/SFX/SwordSwoosh.wav")
var attacking: bool

func enter() -> void:
	ninja.update_animation("attack")
	attacking = true
	audio_stream_player_2d.stream = sword_swoosh_sfx
	audio_stream_player_2d.pitch_scale = randf_range(0.8, 1.2)
	audio_stream_player_2d.play()
	await ninja.animation_player.animation_finished
	attacking = false

func exit() -> void:
	pass

func process(delta: float) -> State:
	if attacking == false:
		return idle_state
	return null

func physics_process(delta: float) -> State:
	ninja.velocity = Vector2.ZERO
	return null

func handle_input(event: InputEvent) -> State:
	return null
