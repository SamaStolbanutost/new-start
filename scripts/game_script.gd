extends Node

var timer = 50
var width = 512
var height = 512

func think(text, timer0, delta):
	if timer >= timer0 and timer < timer0 + 1.5:
		$Camera2D/Sprite/SomePhilosophy.text = text
		$Camera2D/Sprite.modulate.a = 1

	if timer >= timer0 and timer < timer0 + 2.5 and $Camera2D/Sprite.modulate.a > 0:
		$Camera2D/Sprite.modulate.a -= delta


func _physics_process(delta):
	timer += delta
	$Camera2D.global_position = $Player.global_position
	
	# Why?
	if timer >= 2.0 and $Camera2D/Sprite.modulate.a > 0 and timer < 5.0:
		$Camera2D/Sprite.modulate.a -= delta
	
	# Uhm.. Welcome?
	think("Uhm.. Welcome?", 5.0, delta)

	# I do not understand your hopes
	think("Uhm.. Welcome?", 10.5, delta)

	# Do you even hope?
	think("Do you even hope?", 16.0, delta)
	
	# Do you think that something does really matter?
	think("Do you think something does reallly matter?", 21.5, delta)

	# Maybe.. Time?
	think("Maybe.. Time?", 27.0, delta)

	# You should close this game.
	think("You should close this game.", 32.5, delta)

	# Is this even a game?
	think("Is this even a game?", 38.0, delta)

	# Noone could say.
	think("No one could say.", 43.5, delta)
	
	# You definietly should stop.
	think("You definietly should stop.", 49.0, delta)
	
	# No, really.
	think("No, really.", 43.5, delta)

	if timer > 53.0:
		think("You waste " + str(int(timer)) + "s.", timer, delta)
