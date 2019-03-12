extends CanvasModulate

const DARK = Color("100b2a")
const NIGHTVISION = Color("369f41")

func _ready():
	add_to_group("interface")
	color = DARK

func NightVision_mode():
	inform_npcs("NightVision_mode")
	color = NIGHTVISION
	$AudioStreamPlayer.stream = load(Global.nightvision_on_sfx)
	play_sfx()

func DarkVision_mode():
	inform_npcs("DarkVision_mode")
	color = DARK
	$AudioStreamPlayer.stream = load(Global.nightvision_off_sfx)
	$AudioStreamPlayer.play()
	
func play_sfx():
	$AudioStreamPlayer.play()

func inform_npcs(vision_mode):
	get_tree().call_group("npc", vision_mode)