#save_load.gd
class_name SaveLoad
extends Node

func save_game(content):
	if content.size() == 0: # это сбросить сохранения
		var file = FileAccess.open("user://ginger_beard.save", FileAccess.WRITE)
		file.store_line(JSON.stringify(content))
		return
	var previous_save = load_game()
	for save in previous_save:
		if save['room'] == content['room']:
			save = content
			var file = FileAccess.open("user://ginger_beard.save", FileAccess.WRITE)
			file.store_line(JSON.stringify(previous_save))
			return
	previous_save.append(content)
	var file = FileAccess.open("user://ginger_beard.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(previous_save))
	print(previous_save,content)
func load_game():
	if not FileAccess.file_exists("user://ginger_beard.save"):
		return # Error! We don't have a save to load.
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var loaded_game = FileAccess.open("user://ginger_beard.save", FileAccess.READ)
	while loaded_game.get_position() < loaded_game.get_length():
		var json_string = loaded_game.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		# Get the data from the JSON object
		var node_data = json.get_data()
		return node_data
