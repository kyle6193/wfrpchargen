extends Node

# Step 1: Generate Species using weighted random (1d100)
func generate_species() -> String:
	var roll = Dice.roll_d100()
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
	var CareerGenerator = load("res://Class_Career_Gen.gd")
	var career_generator = CareerGenerator.new()
	if generate_species() == "Human":
		var chosen_career = career_generator.generate_human_career()
		return chosen_career
	elif generate_species() == "Halfling":
		var chosen_career = career_generator.generate_halfling_career()
		return chosen_career
	elif generate_species() == "Dwarf":
		var chosen_career = career_generator.generate_dwarf_career()
		return chosen_career
	elif generate_species() == "High Elf":
		var chosen_career = career_generator.generate_highelf_career()
		return chosen_career
	else: 
		var chosen_career = career_generator.generate_woodelf_career()
		return chosen_career

# Step 3: Generate Attributes.
func generate_attributes() -> Dictionary: 
	var Characteristic_Gen = load("res://Characteristic_Gen.gd").new()
	var characteristic_gen = Characteristic_Gen
	return characteristic_gen.generate_start_charac()

func organize_attributes(attrs: Dictionary) -> void:
	for key in attrs.keys():
		var value = attrs[key]
		print("%s: %s" % [key, value])

'''
attrs originates from the other script, accessible via load(). generate_attributes calls the 
generate_start_charac function to have the attrs dictionary returned to it. This dictionary is 
mentioned in the parameter of organize_attributes (and explicitly labeled as a Dictionary). 
A for loop references the dictionary (passed to it by the preceding function) and interpolates 
the data into various Strings. Then in the ready function we don't print the generate_attributes 
function, instead we call it via a newly defined variable: attrs. 
This variable is the aforementioned required parameter inside the organize_attributes function. 
Finally we get our line by line data.
'''

func _ready() -> void:
	print(generate_species())
	print(generate_player_career())
	var attrs = generate_attributes()
	organize_attributes(attrs)
