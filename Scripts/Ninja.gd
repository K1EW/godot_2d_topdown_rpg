class_name Ninja extends CharacterBody2D

signal damaged

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var fsm: FiniteStateMachine = $FiniteStateMachine
@onready var hurt_state: Node = $FiniteStateMachine/NinjaHurt

var direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.DOWN
var invisible: bool = false

func _ready() -> void:
	damaged.connect(hurt_force_transition)

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))

func update_facing_direction() -> void:
	if direction == Vector2.ZERO:
		return
	if direction.x != 0:
		facing_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.y != 0:
		facing_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN

func play_animation_with_direction(anim: String) -> void:
	if facing_direction.x != 0:
		sprite_2d.scale.x = -abs(sprite_2d.scale.x) if facing_direction == Vector2.RIGHT else abs(sprite_2d.scale.x)
		animation_player.play(anim + "_side")
	else:
		if facing_direction == Vector2.DOWN:
			animation_player.play(anim + "_down")
		else:
			animation_player.play(anim + "_up")

func update_animation(anim: String) -> void:
	if animation_player == null:
		return
	update_facing_direction()
	play_animation_with_direction(anim)

func hurt_force_transition() -> void:
	fsm.transition_state(hurt_state)
