extends Popup

func _ready():     
    get_tree().get_root().connect("size_changed", self, "recenter_popups")  
 
func recenter_popups():  
    anchor_left = 0
    anchor_top = 0
    anchor_right = 0
    anchor_bottom = 0

func set_text(combination):
	$RichTextLabel.text = ("Will you stop forgetting your access code ?! I've set it to " 
			+ PoolStringArray(combination).join("") + ", this is the last time!")