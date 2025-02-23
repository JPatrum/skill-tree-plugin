@tool
extends EditorPlugin

const SKILL_MANAGER = "SkillManager"

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("SkillNode", "Button", preload("res://addons/skill_tree/skill_node.gd"), preload("res://icon.svg"))
	add_autoload_singleton(SKILL_MANAGER, "res://addons/skill_tree/skill_manager.gd")

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("SkillNode")
	remove_autoload_singleton(SKILL_MANAGER)
