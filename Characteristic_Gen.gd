extends Node

#var character_generator = preload("res://CharacterGenerator.gd").new() #Loads the script and creates an instance of it to use its functions

#Roll 2d10 for each of the Characteristics
func generate_start_charac(species_choice: String) -> Dictionary: 
	var attrs = {} # Both this and the next line create an empty dictionary that will have data added later
	var stat_bonus_dict = {}
	if species_choice == "Human":
		var base = { # Creates a dictionary with the following keys and values to be used as the base for the character's attributes
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
		for key in base: # For Loop that iterates through the keys of the base dictionary. Important to note this "key in base" is grabbing the Strings ie "Weapon Skill". The next line's "base[key]" is what actually grabs the value of said key.
			attrs[key] = Dice.roll_2d10() + base[key] # Calls the roll_2d10 function from the Dice script and adds the result to the base value for each attribute, then stores it in the attrs dictionary
		for key in attrs: # After the previous loop finishes, the attrs dictionary is fully populated and can be used to calculate the stat bonuses.
			var stat = attrs[key] 
			var stat_bonus = int(str(stat)[0]) 
			'''
			You can't index or slice an integer, so we need to convert to a string first. We take our "stat" variable and convert it to a string.
			Then we take index 0 of that string.
			Then we convert the result of this back to an integer for later purposes.
			'''
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"] 
		attrs["Fate"] = 2
		attrs["Resilience"] = 1
		attrs["Extra Points"] = 3
		attrs["Movement"] = 4 # all similar above lines are keys and values being added to the attrs dictionary
		return attrs # very last thing this func does is send the attrs dictionary back to the caller, which is the generate_attributes function in CharacterGenerator.gd
	elif species_choice == "Dwarf":
		var base = {
			"Weapon Skill": 30,
			"Ballistic Skill": 20,
			"Strength": 20,
			"Toughness": 30,
			"Initiative": 20,
			"Agility": 10,
			"Dexterity": 30,
			"Intelligence": 20,
			"Willpower": 40,
			"Fellowship": 10
		}
		for key in base:
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs:
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 0
		attrs["Resilience"] = 2
		attrs["Extra Points"] = 2
		attrs["Movement"] = 3
		return attrs
	elif species_choice == "Halfling":
		var base = {
			"Weapon Skill": 10,
			"Ballistic Skill": 30,
			"Strength": 10,
			"Toughness": 20,
			"Initiative": 20,
			"Agility": 20,
			"Dexterity": 30,
			"Intelligence": 20,
			"Willpower": 30,
			"Fellowship": 30
		}
		for key in base:
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs:
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 0
		attrs["Resilience"] = 2
		attrs["Extra Points"] = 3
		attrs["Movement"] = 3
		return attrs
	else:
		var base = {
			"Weapon Skill": 30,
			"Ballistic Skill": 30,
			"Strength": 20,
			"Toughness": 20,
			"Initiative": 40,
			"Agility": 30,
			"Dexterity": 30,
			"Intelligence": 30,
			"Willpower": 30,
			"Fellowship": 20
		}
		for key in base:
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs:
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 0
		attrs["Resilience"] = 0
		attrs["Extra Points"] = 2
		attrs["Movement"] = 5
		return attrs
