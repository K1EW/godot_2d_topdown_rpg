extends State

@onready var ninja: Ninja = $"../.."
@onready var idle_state: State = $"../NinjaIdle"
var attacking: bool

func enter() -> void:
	ninja.update_animation("attack")
	attacking = true
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
