extends Control

const path = "res://Localisation/"

var defaultLang = "enUS_enGB.json"
var selectedLang

onready var languages = loadLanguages()
var dict = {}
var isLoaded

func _process(_delta):
	if dict.size() == 0 && languages.size() > 1:
		dict = selectLanguage(defaultLang)
		isLoaded = true

func loadLanguages():
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var fileName = dir.get_next()
		if fileName == "":
			break
		elif !fileName.begins_with("."):
			var file = File.new()
			if not file.file_exists(path+fileName):
				print("file not found")
				continue
			file.open(path+fileName, file.READ)
			var txt = file.get_as_text()
			var data = parse_json(txt)
			var langName = data.get("resources").get("polyglot").get("LANG")
			files.append([langName,fileName])
	return files

func selectLanguage(var lang): #TODO not necesarry to store whole dictionary
	selectedLang = lang
	var file = File.new()
	if not file.file_exists(path+lang):
		print("file not found")
		return null
	file.open(path+lang, file.READ)
	var txt = file.get_as_text()
	var data = parse_json(txt).get("resources").get("data")
	return data

func getLocalString(var id):
	for d in dict:
		if d.get("n") == id:
			return d.get("s")
