extends Node

var dice = preload("res://dice.gd").new()

# Step 1: Generate Species using weighted random (1d100)
func generate_species() -> String:
	var roll = dice.roll_d100()
	if roll <= 90:
		return "Human"
	elif roll <= 94:
		return "Halfling"
	elif roll <= 98:
		return "Dwarf"
	elif roll == 99:
		return "High Elf"
	else:
		return "Wood Elf"

# Step 2: Generate a Class/Career combination
var classes = ["Academics", "Burghers", "Courtiers", "Peasants", "Rangers", "Riverfolk", "Rogues", "Warriors"]
var careers = {
	"Academics": ["Apothecary", "Engineer", "Lawyer", "Nun", "Physician", "Priest", "Scholar", "Wizard"],
	"Burghers": ["Agitator", "Artisan", "Beggar", "Investigator", "Merchant", "Rat Catcher", "Townsman", "Watchman"],
	"Courtiers": ["Advisor", "Artist", "Duellist", "Envoy", "Noble", "Servant", "Spy", "Warden"],
	"Peasants": ["Bailiff", "Hedge Witch", "Herbalist", "Hunter", "Miner", "Mystic", "Scout", "Villager"],
	"Rangers": ["Bounty Hunter", "Coachman", "Entertainer", "Flagellant", "Messenger", "Pedlar", "Road Warden", "WitchHunter"],
	"Riverfolk": ["Boatman", "Huffer", "Riverwarden", "Riverwoman", "Seaman", "Smuggler", "Stevedore", "Wrecker"],
	"Rogues": ["Bawd", "Charlatan", "Fence", "Grave Robber", "Outlaw", "Thief", "Racketeer", "Witch"],
	"Warriors": ["Cavalryman", "Guard", "Knight", "Pit Fighter", "Protagonist", "Soldier", "Troll Slayer", "Warrior Priest"],
}

func generate_player_career() -> String:
	if generate_species() == "Human":
		var chosen_career = CareerGenerator.generate_human_career()
		return chosen_career
	elif generate_species() == "Halfling":
		var chosen_career = CareerGenerator.generate_halfling_career()
		return chosen_career
	elif generate_species() == "Dwarf":
		var chosen_career = CareerGenerator.generate_dwarf_career()
		return chosen_career
	elif generate_species() == "High Elf":
		var chosen_career = CareerGenerator.generate_highelf_career()
		return chosen_career
	else: 
		var chosen_career = CareerGenerator.generate_woodelf_career()
		return chosen_career

#func generate_class_career() -> String:
	#var chosen_class = classes[randi() % classes.size()]
	#var career_list = careers[chosen_class]
	#var chosen_career = career_list[randi() % career_list.size()]
	#return chosen_class + " - " + chosen_career

# Step 3: Generate Attributes.
func generate_attributes() -> Dictionary:
	var base = {
		"Weapon Skill": 20,
		"Ballistic Skill": 20,
		"Strength": 20,
		"Toughness": 20,
		"Initiative": 20,
		"Agility": 20,
		"Dexterity": 20,
		"Intelligence": 20,
		"Willpower": 20,
		"Fellowship": 20
	}
	var attrs = {}
	for key in base.keys():
		attrs[key] = dice.roll_2d10() + base[key]
	attrs["Movement"] = 4
	attrs["Fate"] = 2
	attrs["Resilience"] = 1
	attrs["Extra Points"] = 3
	return attrs

# Step 4: Generate Skills and Talents.
var possible_skills = ["Melee", "Ranged", "Cool", "Lore", "Haggle", "Perception", "Intuition"]
var possible_talents = ["Night Vision", "Acute Sense", "Strong", "Savvy", "Small"]

func generate_skills() -> Array:
	var skills = []
	var skill_pool = possible_skills.duplicate()
	for i in range(3):  # pick 3 skills
		var index = randi() % skill_pool.size()
		var skill = skill_pool[index]
		var advances = randi() % 6 + 5  # advances between 5 and 10
		skills.append(skill + ": " + str(advances))
		skill_pool.remove(index)
	return skills

func generate_talents() -> Array:
	var talents = []
	var talent_pool = possible_talents.duplicate()
	for i in range(2):  # pick 2 talents
		var index = randi() % talent_pool.size()
		talents.append(talent_pool[index])
		talent_pool.remove(index)
	return talents

# Step 5: Generate Trappings.
var possible_trappings = ["Dagger", "Coin Pouch", "Simple Armor", "Whetstone", "Backpack", "Rope", "Lantern"]

func generate_trappings() -> Array:
	var trappings = []
	var trapping_pool = possible_trappings.duplicate()
	for i in range(3):  # choose 3 random items
		var index = randi() % trapping_pool.size()
		trappings.append(trapping_pool[index])
		trapping_pool.remove(index)
	return trappings

# Main function to generate a character sheet and display it.
func _ready():
	randomize()  # Ensure randomness
	
	# Create a new CharacterSheet resource
	var character = CharacterSheet.new()
	character.species = generate_species()
	character.class_career = generate_player_career()
	character.attributes = generate_attributes()
	character.skills = generate_skills()
	character.talents = generate_talents()
	character.trappings = generate_trappings()
	
	# Optionally save the resource (uncomment the next line to save to a file)
	# ResourceSaver.save(character, "user://generated_character.tres")
	
	# Display the generated character sheet (basic output)
	print("-------------------------")
	print("WFRP Character Sheet")
	print("-------------------------")
	print("Species: ", character.species)
	print("Class/Career: ", character.class_career)
	print("\nAttributes:")
	for key in character.attributes.keys():
		print("  ", key, ": ", character.attributes[key])
	print("\nSkills:")
	for skill in character.skills:
		print("  ", skill)
	print("\nTalents:")
	for talent in character.talents:
		print("  ", talent)
	print("\nTrappings:")
	for item in character.trappings:
		print("  ", item)
