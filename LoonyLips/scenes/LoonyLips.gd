extends Node2D

var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

var player_words = []
var current_story
var strings

func _ready():
	set_random_story()
	strings = get_from_json("other_strings.json")
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	$Blackboard/StoryText.set_text(strings["intro_text"])
	prompt_player()

func set_random_story():
	var stories = get_from_json("stories.json")
	randomize()
	current_story = stories[randi() % stories.size()]

func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data 
	
func _on_EnterButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/Answers.text
		_on_Answers_text_entered(new_text)

func is_story_done():
	return player_words.size() == current_story.prompt.size()

func _on_Answers_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/StoryText.text = new_text
	$Blackboard/Answers.text = ""
	check_player_word_length()
	
func prompt_player():
	var next_prompt = current_story["prompt"][player_words.size()]
	$Blackboard/StoryText.text += (strings["prompt"] % next_prompt)

func check_player_word_length():
	if player_words.size() == current_story.prompt.size():
		tell_story()
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	$Blackboard/EnterButton/ButtonLabel.text = strings["again"]
	end_game()
	
func end_game():
	$Blackboard/Answers.queue_free()