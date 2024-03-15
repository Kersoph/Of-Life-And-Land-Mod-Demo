extends Node


const AUTHORNAME_MODNAME_DIR = "AuthorName-ModName/" # name of the folder that this file is in
const AUTHORNAME_MODNAME_LOG_NAME = "AuthorName-ModName" # full ID of your mod (AuthorName-ModName)


var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)
	install_script_extensions()
	add_translations()
	install_virtual_files()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	# ModLoaderMod.install_script_extension(extensions_dir_path.plus_file(...))


func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
	ModLoaderMod.add_translation(translations_dir_path.plus_file("modname.en.translation"))
	ModLoaderMod.add_translation(translations_dir_path.plus_file("modname.de.translation"))
	ModLoaderMod.add_translation(translations_dir_path.plus_file("modname.de_CH.translation"))
	# ModLoaderMod. add_translation(translations_dir_path.plus_file(...))


func install_virtual_files() -> void:
	var zip_file_path = mod_dir_path.plus_file("res.zip")
	var result = ProjectSettings.load_resource_pack(zip_file_path)
	ModLoaderLog.info("install_virtual_files result: " + str(result), AUTHORNAME_MODNAME_LOG_NAME)


func _ready() -> void:
	ModLoaderLog.info("Test Mod Ready!", AUTHORNAME_MODNAME_LOG_NAME)
	ModLoaderLog.info(str("Translation Demo: ", tr("MODNAME_READY_TEXT")), AUTHORNAME_MODNAME_LOG_NAME)
