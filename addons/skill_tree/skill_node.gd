@tool
extends Button
class_name SkillNode

##The name of your skill. Replaces the button text in-game.
@export var skill_name := "My Skill"
##The exp cost of purchasing your skill.
@export var cost := 0
##If true, allows the player to sell your skill and re-acquire the exp cost.
@export var sellable := true
##If true, marks your skill as unlocked by default.
@export var default := false
##Set to true to make your skill immediately purchasable, otherwise keep false.
@export var active := false
##Place all skills that immediately follow this skill on your tree in this array.
@export var next : Array[SkillNode]

signal purchased
signal sold

func _enter_tree():
	self.text = skill_name
	pressed.connect(clicked)
	purchased.connect(on_purchase)
	sold.connect(on_sell)

func _exit_tree():
	pressed.disconnect(clicked)
	purchased.disconnect(on_purchase)
	sold.disconnect(on_sell)

func _ready():
	if(default):
		for skill:SkillNode in next:
			skill.active = true

func clicked():
	if active and sellable and SkillManager.isSkillPurchased(name):
		if SkillManager.sellSkill(self):
			sold.emit()
	elif not SkillManager.isSkillPurchased(name) and active:
		if SkillManager.buySkill(self):
			purchased.emit()

func on_purchase():
	for skill in next:
		skill.active = true

func on_sell():
	for skill in next:
		skill.active = false
