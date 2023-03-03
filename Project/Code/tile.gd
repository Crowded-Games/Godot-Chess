extends Button

# Tile Color. true means black. false means white.
@export var tile_color = false

@export var white_color: StyleBoxFlat
@export var black_color: StyleBoxFlat

var piece: String = ""

func _ready():
	if tile_color == false:
		self.set("theme_override_styles/disabled", white_color)
		self.set("theme_override_styles/focus", white_color)
		self.set("theme_override_styles/hover", white_color)
		self.set("theme_override_styles/normal", white_color)
		self.set("theme_override_styles/pressed", white_color)
	else:
		self.set("theme_override_styles/disabled", black_color)
		self.set("theme_override_styles/focus", black_color)
		self.set("theme_override_styles/hover", black_color)
		self.set("theme_override_styles/normal", black_color)
		self.set("theme_override_styles/pressed", black_color)

func _on_pressed():
	# get_parent().get_parent() gets a node that is above the board
	get_parent().get_parent().select(self.get_button_icon(), self.name)

func set_piece(the_icon: CompressedTexture2D):
	self.set_button_icon(the_icon)
