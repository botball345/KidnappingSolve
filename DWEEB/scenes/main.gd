extends Node2D

@onready var player = get_node("/root/Node2D/Player")
@onready var canvas = $Player/Camera2D/InteractonCamera
@onready var cutSceneOne = $cutScene
@onready var container = canvas.get_node("Container")
@onready var endScreen = canvas.get_node("Endgame")
@onready var Dialog = container.get_node("Dialog").get_node("Text")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Dialog.visible_ratio != 1:
		Dialog.visible_ratio = Dialog.visible_ratio + 0.01
	

func _on_cut_scene_body_entered(body):
	if body == player:
		Dialog.visible_ratio = 0
		cutSceneOne.get_node("CollisionShape2D").disabled = true
		canvas.set_visibility(container)
		var choice = await canvas.buttondown
		if choice == true:
			canvas.invis(container)
			
			
			player.visible = false
			endScreen.visible = true
			
		else:
			player.movement = true
			canvas.invis(container)
