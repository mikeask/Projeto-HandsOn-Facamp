extends Node

onready var file = File.new()

func loadData(url):
	if url == null: return
	if !file.file_exists(url): return
	file.open(url, File.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data
	
func writeData(url, dict):
	if url == null: return
	file.open(url, file.WRITE)
	file.store_line(to_json(dict))
	file.close()
	return 