extends Button

var loader: ResourceInteractiveLoader

func _ready():
	if OS.get_name() == "HTML5":
		JavaScript.eval("console.log('done');")

func _pressed():
	get_node("/root/Menu/VBox/EnBtn").hide()
	get_node("/root/Menu/VBox/ChBtn").hide()
	
	if self.text == "English":
		TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale("zh-TW")
	loader = ResourceLoader.load_interactive("res://game/game.tscn")
	assert(loader)
	get_node("../../ColorRect/Fade").play("fade_in")

func _on_Fade_animation_finished(_anim_name):
	var err := loader.wait()
	assert(err == ERR_FILE_EOF)
	err = get_tree().change_scene_to(loader.get_resource())
	assert(err == OK)
