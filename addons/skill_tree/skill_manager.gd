@tool
extends Node

var experience := 0
var purchasedSkills := []

func initSkills(iSkills:Array[String]):
	for skillName:String in iSkills:
		purchasedSkills.append(skillName)

func buySkill(skill:SkillNode):
	if not purchasedSkills.has(skill.name) and experience >= skill.cost:
		purchasedSkills.append(skill.name)
		experience -= skill.cost
		return true
	return false

func sellSkill(skill:SkillNode):
	if purchasedSkills.has(skill.name):
		for s:SkillNode in skill.next:
			if purchasedSkills.has(s.name):
				return false
		purchasedSkills.erase(skill.name)
		experience += skill.cost
		return true
	return false

func isSkillPurchased(skillName:String):
	return purchasedSkills.has(skillName)
