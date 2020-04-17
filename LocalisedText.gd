extends RichTextLabel

export(String) var id
onready var localiser = get_parent()
var lang

func _process(_delta):
	if lang != localiser.selectedLang && localiser.isLoaded:
		text = localiser.getLocalString(id)
		lang = localiser.selectedLang
