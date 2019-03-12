extends CanvasModulate

const DARK = Color("100b2a")
const NIGHTVISION = Color("369f41")

func _ready():
	add_to_group("interface")
	color = DARK

func NightVision_mode():
	color = NIGHTVISION
	$AudioStreamPlayer.stream = load(Global.nightvision_on_sfx)
	play_sfx()

func DarkVision_mode():
	color = DARK
	$AudioStreamPlayer.stream = load(Global.nightvision_off_sfx)
	$AudioStreamPlayer.play()
	
func play_sfx():
	$AudioStreamPlayer.play()