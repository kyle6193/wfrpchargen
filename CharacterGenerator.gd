extends Node

# Step 1: Generate Species using weighted random (1d100)
func generate_species() -> String:
	var species : String = ""
	var roll = Dice.roll_d100() # "Dice" was made a singleton, so it can be invoked by name from any script. 
	if roll <= 90:
		species = "Human"
	elif roll <= 94:
		species = "Halfling"
	elif roll <= 98:
		species = "Dwarf"
	elif roll == 99:
		species = "High Elf"
	else:
		species = "Wood Elf"
	var species_choice = species
	return species_choice

func generate_player_career(species_choice) -> String:
	var career_generator = load("res://Class_Career_Gen.gd").new() # loads and instantiates this script so you can use functions from it.
	var chosen_career : String = "" # create the chosen_career variable to place the return value in.
	if species_choice == "Human":
		chosen_career = career_generator.generate_human_career()
	elif species_choice == "Halfling":
		chosen_career = career_generator.generate_halfling_career()
	elif species_choice == "Dwarf":
		chosen_career = career_generator.generate_dwarf_career()
	elif species_choice == "High Elf":
		chosen_career = career_generator.generate_highelf_career()
	else: 
		chosen_career = career_generator.generate_woodelf_career()
	return chosen_career

func report_career_class(chosen_career: String) -> String:	# Without the chosen_career parameter, you can't access the result of the above function.
	var classes = {
		"Academics": ["Apothecary", "Engineer", "Lawyer", "Nun", "Physician", "Priest", "Scholar", "Wizard"],
		"Burghers": ["Agitator", "Artisan", "Beggar", "Investigator", "Merchant", "Rat Catcher", "Townsman", "Watchman"],
		"Courtiers": ["Advisor", "Artist", "Duellist", "Envoy", "Noble", "Servant", "Spy", "Warden"],
		"Peasants": ["Bailiff", "Hedge Witch", "Herbalist", "Hunter", "Miner", "Mystic", "Scout", "Villager"],
		"Rangers": ["Bounty Hunter", "Coachman", "Entertainer", "Flagellant", "Messenger", "Pedlar", "Road Warden", "WitchHunter"],
		"Riverfolk": ["Boatman", "Huffer", "Riverwarden", "Riverwoman", "Seaman", "Smuggler", "Stevedore", "Wrecker"],
		"Rogues": ["Bawd", "Charlatan", "Fence", "Grave Robber", "Outlaw", "Thief", "Racketeer", "Witch"],
		"Warriors": ["Cavalryman", "Guard", "Knight", "Pit Fighter", "Protagonist", "Soldier", "Troll Slayer", "Warrior Priest"],
	}
	for key in classes: # You can read this as "for each Class....
		if chosen_career in classes[key]: #... if the chosen_career is in that class...
			return key #... send the class to the caller."
	return "Error: Career not found in any class" # Fallback

# Step 3: Generate Attributes.
func generate_attributes(species_choice: String) -> Dictionary: 
	var characteristic_gen = load("res://Characteristic_Gen.gd").new()
	return characteristic_gen.generate_start_charac(species_choice)

func organize_attributes(attrs: Dictionary) -> void:
	for key in attrs:
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

var allskills = ["Art", "Athletics", "Bribery", "Charm", "Charm Animal", "Climb", "Cool", "Consume Alcohol", "Dodge", "Drive", "Endurance", "Entertain", "Gamble", "Gossip", "Haggle", "Intimidate", "Intuition", "Leadership", "Melee", "Navigation", "Outdoor Survival", "Perception", "Ride", "Row", "Stealth", "Animal Care", "Animal Training", "Channelling", "Evaluate", "Heal", "Language", "Lore", "Perform", "Pick Lock", "Play", "Pray", "Ranged", "Research", "Sail", "Secret Signs", "Set Trap", "Sleight of Hand", "Swim", "Track", "Trade"]
var alltalents = ["Accurate Show", "Acute Sense (Sense)", "Aethyric Attunement", "Alley Cat", "Ambidextrous", "Animal Affinity", "Arcane Magic (Lore)", "Argumentative", "Artistic", "Attractive", "Battle Rage", "Beat Blade", "Beneath Notice", "Bersek Charge", "Blather", "Bless (Divine Lore)", "Bookish", "Break and Enter", "Briber", "Cardsharp", "Careful Strike", "Carouser", "Catfall", "Cat-tongued", "Chaos Magic (Lore)", "Combat Aware", "Combat Master", "Combat Reflexes", "Commanding Presence", "Concoct", "Contortionist", "Coolheaded", "Creak the Whip", "Craftsman (Trade)", "Criminal", "Deadeye Shot", "Dealmaker", "Detect Artefact", "Diceman", "Dirty Fighting", "Disarm", "Distract", "Doomed", "Drilled", "Dual Wielder", "Embezzle", "Enclosed Fighter", "Etiquette (Social Group)", "Fast Hands", "Fast Shot", "Fearless (Enemy)", "Feint", "Field Dressing", "Fisherman", "Flagellant", "Flee!", "Fleet Footed", "Frenzy", "Frightening", "Furious Assault", "Gregarious", "Gunner", "Hardy", "Hatred (Group)", "Holy Hatred", "Holy Visions", "Hunter's Eye", "Impassioned Zeal", "Implacable", "In-fighter", "Inspiring", "Instinctive Diction", "Invoke (Divine Lore)", "Iron Jaw", "Iron Will", "Jump Up", "Kingpin", "Lightning Reflexes", "Linguisitics", "Lip Reading", "Luck", "Magical Sense", "Magic Resistance", "Magnum Opus", "Marksman", "Master of Disguise", "Master Orator", "Master Tradesman (Trade)", "Menacing", "Mimic", "Night Vision", "Nimble Fingered", "Noble Blood", "Nose for Trouble", "Numismatics", "Old Salt", "Orientation", "Panhandle", "Perfect Pitch", "Petty Magic", "Pharmacist", "Pilot", "Public Speaker", "Pure Soul", "Rapid Reload", "Reaction Strike", "Read/Write", "Relentless", "Resistance (Threat)", "Resolute", "Reversal", "Riposte", "River Guide", "Robust", "Roughrider", "Rover", "Savant (Lore)", "Savvy", "Scale Sheer Surface", "Schemer", "Sea Legs", "Seasoned Traveller", "Second Sight", "Secret Identity", "Shadow", "Sharp", "Sharpshooter", "Shieldsman", "Sixth Sense", "Slayer", "Small", "Sniper", "Speedreader", "Sprinter", "Step Aside", "Stone Soup", "Stout-hearted", "Strider (Terrain)", "Strike Mighty Blow", "Strike to Injure", "Strike to Stun", "Strong Back", "Strong Legs", "Strong-minded", "Strong Swimmer", "Sturdy", "Suave", "Super Numerate", "Supportive", "Sure Shot", "Surgery", "Tenacious", "Tinker", "Tower of Memories", "Trapper", "Trick Riding", "Tunnel Rat", "Unshakable", "Very Resilient", "Very Strong", "War Leader", "War Wizard", "Warrior Born", "Waterman", "Wealthy", "Well-prepared", "Witch!"]

func _ready() -> void:
	var species = generate_species()
	print("Species: " + species)
	var career = generate_player_career(species)
	if career == null or career == "":
		career = "Error in class_career_gen"
	print("Class  : " + report_career_class(career))
	print("Career : " + career)
	var attrs = generate_attributes(species)
	organize_attributes(attrs)
