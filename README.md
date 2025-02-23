# skill-tree-plugin
A basic skill tree plugin for Godot 4


1. INSTALLATION
   - Create an "addons" folder in your Godot project
   - Add the "skill-tree" folder & its contents in this repository's addons folder into your own
   - Done!

2. CREATING SKILLS
   - Add the "SkillNode" node to your UI scene; this node extends the Button node
   - Give your SkillNode a unique name with the "Skill Name" property
   - Change the other properties to your liking:
       - Cost: how much experience your skill costs & sells for
       - Sellable: can the player sell this skill to regain experience?
       - Default: is this skill immediately purchased when starting the game?
       - Active: is this skill immediately available for purchase when starting the game?
       - Next: an array of all SkillNodes that follow this SkillNode on the tree

3. CREATING A CONNECTED TREE
   - Add your desired SkillNodes
   - In each SkillNode, open the "Next" array property
   - Assign the SkillNodes that immediately follow your SkillNode to the array
   - SkillNodes in the array will be marked as "active" (purchasable) when your skill is purchased

4. BEGINNING YOUR TREE
   - The first SkillNode on your skill tree will need to be "active" or "default" to make your tree accessible
   - IMPORTANT: Default SkillNodes will also need to be manually initialized with the SkillManager when the game starts (see below)
   - Default SkillNodes automatically mark SkillNodes in their "Next" arrays as active

5. SKILL MANAGER
   - SkillManager lets you reference your skill tree and change the player's experience from anywhere in the game
   - Invoke SkillManager and then use your desired property/function
       - experience: the player's current experience level (initialized as 0)
       - initSkills(Array[String]): initializes default skills given the names of the skills (present in the Skill Name properties of the SkillNodes)
       - isSkillPurchased(String): returns true or false depending on if a skill has been purchased, given the name of the skill (present in the Skill Name property of the SkillNode)

ADDITIONAL NOTES
   - This plugin does not have a built-in save feature, you will need to save and load data related to your skill tree manually
   - You can customize the appearance and functionality of the SkillNode by editing the base button properties and attaching your own script
