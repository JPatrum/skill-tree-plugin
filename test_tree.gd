extends Control

var skills : Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	skills = self.get_children()
	SkillManager.initSkills(["First Skill"])
	for skill in skills:
		skill.purchased.connect(detect_purchase.bind(skill))
		skill.sold.connect(detect_sell.bind(skill))

func detect_purchase(skill:Node):
	print("Purchased skill: " + skill.name)

func detect_sell(skill:Node):
	print("Sold skill: " + skill.name)
