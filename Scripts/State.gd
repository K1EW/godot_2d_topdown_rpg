class_name State extends Node

func enter() -> void:
	pass

func exit() -> void:
	pass

func process(delta: float) -> State:
	return null

func physics_process(delta: float) -> State:
	return null

func handle_input(event: InputEvent) -> State:
	return null
