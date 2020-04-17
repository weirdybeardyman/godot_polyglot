extends OptionButton

onready var localiser = get_parent()

func _process(_delta):
	if localiser.isLoaded && get_item_count() == 0:
		var index = 0
		var defaultLangIndex
		for lang in localiser.languages:
			add_item(lang[0], index)
			if lang[1]== localiser.defaultLang:
				defaultLangIndex = index
			index += 1
		select(defaultLangIndex)

func _on_OptionButton_item_selected(id):
	for l in localiser.languages:
		if l[0] == get_item_text(id):
			var i = localiser.languages.find(l)
			localiser.dict = localiser.selectLanguage(localiser.languages[i][1])
