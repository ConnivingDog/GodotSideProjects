extends CanvasModulate

const DARK = Color("100b2a")
const NIGHTVISION = Color("369f41")

func _ready():
	add_to_group("interface")
	color = DARK

func NightVision_mode():
	color = NIGHTVISION

func DarkVision_mode():
	color = DARK