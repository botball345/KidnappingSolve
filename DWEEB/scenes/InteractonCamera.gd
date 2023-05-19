extends CanvasLayer

@onready var DialogFrame = $Container/Dialog
@onready var Decisions = $Container/Decisions
@onready var button_a = $Container/Decisions/Button_A
@onready var button_b = $Container/Decisions/Button_B
@onready var dialog = DialogFrame.get_node("Text")
@onready var dialogName = DialogFrame.get_node("Name")

@onready var player = get_node("/root/Node2D/Player")
@onready var animation = player.get_node("Sprite2D").get_node("PlayerAnimation")

signal buttondown(choice: bool)

func set_visibility(obj):
	player.movement = false
	animation.play("idle")
	
	if obj.visible == false:
		obj.visible = true
		
func invis(obj):
	if obj.visible:
		obj.visible = false
		
func setText(obj, text):
	obj.text = text

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_a_button_down():
	emit_signal("buttondown", true)
	pass # Replace with function body.


func _on_button_b_button_down():
	emit_signal("buttondown", false)
	pass # Replace with function body. 
