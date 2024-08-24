class_name Card
extends IsometricObject

const movement_speed = 1.00 / 1.5
var sprite: Sprite2D
@export var number: int
@export var color: String

@export var facing: Constants.FACING


func _ready() -> void:
	super()
	update_sprite()
	pass


func _to_string() -> String:
	return "{0} {1}".format([color, number])


func show_card_sprite():
	self.sprite = Sprite2D.new()
	self.add_child(sprite)
	update_sprite()


func update_sprite():
	if not sprite:
		return
	sprite.texture = load("res://resources/sprites/cards/" + color + ".png")
	sprite.hframes = 10
	sprite.vframes = 2

	# Set facing of card
	match self.facing:
		Constants.FACING.DOWN:
			rotation_degrees = 0
			sprite.frame_coords = Vector2i(self.number, 0)
		Constants.FACING.UP:
			rotation_degrees = 180
			sprite.frame_coords = Vector2i(self.number, 0)
		Constants.FACING.RIGHT:
			rotation_degrees = 0
			sprite.frame_coords = Vector2i(self.number, 1)
		Constants.FACING.LEFT:
			rotation_degrees = 180
			sprite.frame_coords = Vector2i(self.number, 1)
