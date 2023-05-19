extends CharacterBody2D

var speed = 60
var movement = true
var motion = Vector2()
@onready var animation = $Sprite2D/PlayerAnimation
@onready var cutScene = $Camera2D/InteractonCamera

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
	if movement:
		velocity = input_direction * speed
		read_input()
	else:
		velocity = input_direction * 0
	

func _physics_process(_delta):
	get_input()
	move_and_slide()
