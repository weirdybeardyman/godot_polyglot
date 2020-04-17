# godot_polyglot
Godot Polyglot Gamedev intergration:
A quick and dirty implementation of the Polyglot Gamedev resource into a Godot project.
I did not create the Polyglot Gamedev project- Pay them a visit - https://github.com/PolyglotGamedev, http://www.bit.ly/1ESPiO6
You will need to use a font with CJK and other special character support, like Google Noto Sans.
How to use:
Ensure the Localisation script is a parent of any text and the language picker, you can also set the default language in the code, using the filename of that language document.
Place the LocalisedText script on any RichTextLabel and fill in the ID of the text you want on load it will get that text in the default language.
Place the LanguagePicker script on a OptionButton Node to select the languages and it will fill on load. Unfortunately only showing the language name in English.
