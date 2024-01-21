extends TextureRect

onready var scrollContainer: ScrollContainer = $ScrollContainer
const slotclass = preload("res://slot.gd")
var temp_item_texture = null
var current_slot = null
var next_slot = null
var place_item = false
var timer = 0.1
onready var movable_item: Node2D = $movable_item

func _ready():
	for h_slot in scrollContainer.get_node("HBoxContainer").get_children():
		h_slot.connect("gui_input", self, "slot_gui_input", [h_slot])

func _process(delta):
	if place_item:
		timer -= delta
		if timer <= 0:
			place_item = false
			timer = 0.1

func slot_gui_input(event, slot):
	if place_item:
		next_slot = slot
		if next_slot.item.get_texture() == null:
			current_slot.pickFromSlot()
			next_slot.putIntoSlot(temp_item_texture)
			temp_item_texture = null
			place_item = false

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed: # left mouse click pressed
			temp_item_texture = slot.item.get_texture()
			current_slot = slot
			movable_item.get_node("Item").set_texture(temp_item_texture)
			movable_item.global_position = current_slot.item.get_global_transform().origin
			current_slot.pickFromSlot()

		if event.button_index == BUTTON_LEFT and event.pressed: # left mouse click release
			movable_item.visible = false
			if temp_item_texture != null:
				current_slot.putIntoSlot(temp_item_texture)
				place_item = true

func _input(event):
	if movable_item.visible:
		movable_item.global_position = get_global_mouse_position() + Vector2(-60, -60)

