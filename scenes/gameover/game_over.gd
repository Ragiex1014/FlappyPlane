extends Control

@onready var space_label = $SpaceLabel
@onready var game_over_label = $GameOverLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("fly") == true && space_label.visible == true:
		GameManager.load_main_scene()


func run_sequence() -> void:
	game_over_label.hide()
	space_label.show()


func on_plane_died() -> void:
	show()
	timer.start()
	game_over_sound.play()
	


func _on_timer_timeout():
	run_sequence()
