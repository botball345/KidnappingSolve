extends CharacterBody2D

var speed = 60
var movement = true
var motion = Vector2()
@onready var animation = $Sprite2D/PlayerAnimation
@onready var cutScene = $Camera2D/InteractonCamera
@onready var text = $Camera2D/InteractonCamera/Dialog/Text

func read_input():
	if movement:
		var sprite = $Sprite2D
		
		var right = Input.is_action_pressed("right")
		var left = Input.is_action_pressed("left")
		var down = Input.is_action_pressed("down")
		var up = Input.is_action_pressed("up")
		if right:
			sprite.flip_h = false
			animation.play("walk_right")
		elif left:
			sprite.flip_h = true
			animation.play("walk_right")
		elif down:
			sprite.flip_h = false
			animation.play("walk_down")
		elif up:
			sprite.flip_h = false
			animation.play("walk_up")
		else:
			animation.play("idle")
		
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	read_input()

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
func writeText():
	while text.visible_ratio < 1:
		text.visible_ratio = text.visible_ratio +0.01


func _on_cut_scene_body_entered(body):
	if body.name == "Player":
		movement = false
		animation.play("idle")
		speed = 0
		cutScene.visible = true
		writeText()
		print("cutScene")
