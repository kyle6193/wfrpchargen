extends Node

var character_generator = preload("res://CharacterGenerator.gd").new()

#Roll 2d10 for each of the Characteristics
func generate_start_charac() -> Dictionary:
	var attrs = {}
	var stat_bonus_dict = {}
	if character_generator.generate_species() == "Human":
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
		for key in base.keys():
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs.keys():
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 2
		attrs["Resilience"] = 1
		attrs["Extra Points"] = 3
		attrs["Movement"] = 4
		return attrs
	elif character_generator.generate_species() == "Dwarf":
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
		for key in base.keys():
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs.keys():
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 0
		attrs["Resilience"] = 2
		attrs["Extra Points"] = 2
		attrs["Movement"] = 3
		return attrs
	elif character_generator.generate_species() == "Halfling":
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
		for key in base.keys():
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs.keys():
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
		for key in base.keys():
			attrs[key] = Dice.roll_2d10() + base[key]
		for key in attrs.keys():
			var stat = attrs[key]
			var stat_bonus = int(str(stat)[0])
			stat_bonus_dict[key] = stat_bonus
		attrs["Wounds"] = stat_bonus_dict["Strength"] + (stat_bonus_dict["Toughness"]*2) + stat_bonus_dict["Willpower"]
		attrs["Fate"] = 0
		attrs["Resilience"] = 0
		attrs["Extra Points"] = 2
		attrs["Movement"] = 5
		return attrs
