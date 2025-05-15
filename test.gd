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

func _ready():
	for i in range(10):
		print(generate_species())
		print(generate_player_career())
		print("")
