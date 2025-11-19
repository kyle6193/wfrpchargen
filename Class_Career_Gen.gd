extends Node

func generate_human_career() -> String:
	var roll = Dice.roll_d100()
	if roll <= 1:
		return "Apothecary"
	elif roll <= 2:
		return "Engineer"
	elif roll <= 3:
		return "Lawyer"
	elif roll <= 5:
		return "Nun"
	elif roll <= 6:
		return "Physician"
	elif roll <= 11:
		return "Priest"
	elif roll <= 13:
		return "Scholar"
	elif roll <= 14:
		return "Wizard"
	elif roll <= 15:
		return "Agitator"
	elif roll <= 17:
		return "Artisan"
	elif roll <= 19:
		return "Beggar"
	elif roll <= 20:
		return "Investigator"
	elif roll <= 21:
		return "Merchant"
	elif roll <= 23:
		return "Rat Catcher"
	elif roll <= 26:
		return "Townsman"
	elif roll <= 27:
		return "Watchman"
	elif roll <= 28:
		return "Advisor"
	elif roll <= 29:
		return "Artist"
	elif roll <= 30:
		return "Duellist"
	elif roll <= 31:
		return "Envoy"
	elif roll <= 32:
		return "Noble"
	elif roll <= 35:
		return "Servant"
	elif roll <= 36:
		return "Spy"
	elif roll <= 37:
		return "Warden"
	elif roll <= 38:
		return "Bailiff"
	elif roll <= 39:
		return "Hedge Witch"
	elif roll <= 40:
		return "Herbalist"
	elif roll <= 42:
		return "Hunter"
	elif roll <= 43:
		return "Miner"
	elif roll <= 44:
		return "Mystic"
	elif roll <= 45:
		return "Scout"
	elif roll <= 50:
		return "Villager"
	elif roll <= 51:
		return "Bounty Hunter"
	elif roll <= 52:
		return "Coachman"
	elif roll <= 54:
		return "Entertainer"
	elif roll <= 56:
		return "Flagellant"
	elif roll <= 57:
		return "Messenger"
	elif roll <= 58:
		return "Pedlar"
	elif roll <= 59:
		return "Road Warden"
	elif roll <= 60:
		return "WitchHunter"
	elif roll <= 62:
		return "Boatman"
	elif roll <= 63:
		return "Huffer"
	elif roll <= 65:
		return "Riverwarden"
	elif roll <= 68:
		return "Riverwoman"
	elif roll <= 70:
		return "Seaman"
	elif roll <= 71:
		return "Smuggler"
	elif roll <= 73:
		return "Stevedore"
	elif roll <= 74:
		return "Wrecker"
	elif roll <= 76:
		return "Bawd"
	elif roll <= 77:
		return "Charlatan"
	elif roll <= 78:
		return "Fence"
	elif roll <= 79:
		return "Grave Robber"
	elif roll <= 83:
		return "Outlaw"
	elif roll <= 84:
		return "Racketeer"
	elif roll <= 87:
		return "Thief"
	elif roll <= 88:
		return "Witch"
	elif roll <= 90:
		return "Cavalryman"
	elif roll <= 92:
		return "Guard"
	elif roll <= 93:
		return "Knight"
	elif roll <= 94:
		return "Pit Fighter"
	elif roll <= 95:
		return "Protagonist"
	elif roll <= 99:
		return "Soldier"
	return "Warrior Priest"

func generate_dwarf_career() -> String:
	var roll = Dice.roll_d100()
	if roll <= 1:
		return "Apothecary"
	elif roll <= 4:
		return "Engineer"
	elif roll <= 6:
		return "Lawyer"
	elif roll <= 7:
		return "Physician"
	elif roll <= 9:
		return "Scholar"
	elif roll <= 11:
		return "Agitator"
	elif roll <= 17:
		return "Artisan"
	elif roll <= 18:
		return "Beggar"
	elif roll <= 20:
		return "Investigator"
	elif roll <= 24:
		return "Merchant"
	elif roll <= 25:
		return "Rat Catcher"
	elif roll <= 31:
		return "Townsman"
	elif roll <= 34:
		return "Watchman"
	elif roll <= 36:
		return "Advisor"
	elif roll <= 37:
		return "Artist"
	elif roll <= 38:
		return "Duellist"
	elif roll <= 40:
		return "Envoy"
	elif roll <= 41:
		return "Noble"
	elif roll <= 42:
		return "Servant"
	elif roll <= 43:
		return "Spy"
	elif roll <= 45:
		return "Warden"
	elif roll <= 47:
		return "Bailiff"
	elif roll <= 49:
		return "Hunter"
	elif roll <= 54:
		return "Miner"
	elif roll <= 55:
		return "Scout"
	elif roll <= 56:
		return "Villager"
	elif roll <= 60:
		return "Bounty Hunter"
	elif roll <= 61:
		return "Coachman"
	elif roll <= 63:
		return "Entertainer"
	elif roll <= 65:
		return "Messenger"
	elif roll <= 67:
		return "Pedlar"
	elif roll <= 69:
		return "Boatman"
	elif roll <= 70:
		return "Huffer"
	elif roll <= 72:
		return "Riverwoman"
	elif roll <= 73:
		return "Seaman"
	elif roll <= 75:
		return "Smuggler"
	elif roll <= 77:
		return "Stevedore"
	elif roll <= 78:
		return "Wrecker"
	elif roll <= 79:
		return "Fence"
	elif roll <= 82:
		return "Outlaw"
	elif roll <= 83:
		return "Racketeer"
	elif roll <= 84:
		return "Thief"
	elif roll <= 87:
		return "Guard"
	elif roll <= 90:
		return "Pit Fighter"
	elif roll <= 93:
		return "Protagonist"
	elif roll <= 96:
		return "Soldier"
	return "Slayer"

func generate_halfling_career() -> String:
	var roll = Dice.roll_d100()
	if roll <= 1:
		return "Apothecary"
	elif roll <= 2:
		return "Engineer"
	elif roll <= 4:
		return "Lawyer"
	elif roll <= 6:
		return "Physician"
	elif roll <= 10:
		return "Scholar"
	elif roll <= 12:
		return "Agitator"
	elif roll <= 15:
		return "Artisan"
	elif roll <= 19:
		return "Beggar"
	elif roll <= 21:
		return "Investigator"
	elif roll <= 25:
		return "Merchant"
	elif roll <= 28:
		return "Rat Catcher"
	elif roll <= 31:
		return "Townsman"
	elif roll <= 33:
		return "Watchman"
	elif roll <= 34:
		return "Advisor"
	elif roll <= 36:
		return "Artist"
	elif roll <= 37:
		return "Envoy"
	elif roll <= 43:
		return "Servant"
	elif roll <= 44:
		return "Spy"
	elif roll <= 46:
		return "Warden"
	elif roll <= 47:
		return "Bailiff"
	elif roll <= 50:
		return "Herbalist"
	elif roll <= 52:
		return "Hunter"
	elif roll <= 53:
		return "Miner"
	elif roll <= 54:
		return "Scout"
	elif roll <= 57:
		return "Villager"
	elif roll <= 58:
		return "Bounty Hunter"
	elif roll <= 60:
		return "Coachman"
	elif roll <= 63:
		return "Entertainer"
	elif roll <= 65:
		return "Messenger"
	elif roll <= 67:
		return "Pedlar"
	elif roll <= 68:
		return "Road Warden"
	elif roll <= 69:
		return "Boatman"
	elif roll <= 70:
		return "Huffer"
	elif roll <= 71:
		return "Riverwarden"
	elif roll <= 74:
		return "Riverwoman"
	elif roll <= 75:
		return "Seaman"
	elif roll <= 79:
		return "Smuggler"
	elif roll <= 82:
		return "Stevedore"
	elif roll <= 85:
		return "Bawd"
	elif roll <= 86:
		return "Charlatan"
	elif roll <= 87:
		return "Fence"
	elif roll <= 88:
		return "Grave Robber"
	elif roll <= 89:
		return "Outlaw"
	elif roll <= 90:
		return "Racketeer"
	elif roll <= 94:
		return "Thief"
	elif roll <= 96:
		return "Guard"
	elif roll <= 97:
		return "Pit Fighter"
	return "Soldier"

func generate_highelf_career() -> String:
	var roll = Dice.roll_d100()
	if roll <= 2:
		return "Apothecary"
	elif roll <= 6:
		return "Lawyer"
	elif roll <= 8:
		return "Physician"
	elif roll <= 12:
		return "Scholar"
	elif roll <= 16:
		return "Wizard"
	elif roll <= 19:
		return "Artisan"
	elif roll <= 21:
		return "Investigator"
	elif roll <= 26:
		return "Merchant"
	elif roll <= 28:
		return "Townsman"
	elif roll <= 29:
		return "Watchman"
	elif roll <= 31:
		return "Advisor"
	elif roll <= 32:
		return "Artist"
	elif roll <= 34:
		return "Duellist"
	elif roll <= 37:
		return "Envoy"
	elif roll <= 40:
		return "Noble"
	elif roll <= 43:
		return "Spy"
	elif roll <= 45:
		return "Warden"
	elif roll <= 47:
		return "Herbalist"
	elif roll <= 50:
		return "Hunter"
	elif roll <= 56:
		return "Scout"
	elif roll <= 59:
		return "Bounty Hunter"
	elif roll <= 62:
		return "Entertainer"
	elif roll <= 63:
		return "Messenger"
	elif roll <= 64:
		return "Boatman"
	elif roll <= 79:
		return "Seaman"
	elif roll <= 80:
		return "Smuggler"
	elif roll <= 82:
		return "Bawd"
	elif roll <= 85:
		return "Charlatan"
	elif roll <= 88:
		return "Outlaw"
	elif roll <= 92:
		return "Cavalryman"
	elif roll <= 94:
		return "Guard"
	elif roll <= 95:
		return "Knight"
	elif roll <= 97:
		return "Pit Fighter"
	elif roll <= 98:
		return "Protagonist"
	return "Soldier"

func generate_woodelf_career() -> String:
	var roll = Dice.roll_d100()
	if roll <= 1:
		return "Scholar"
	elif roll <= 5:
		return "Wizard"
	elif roll <= 10:
		return "Artisan"
	elif roll <= 14:
		return "Advisor"
	elif roll <= 18:
		return "Artist"
	elif roll <= 25:
		return "Envoy"
	elif roll <= 31:
		return "Noble"
	elif roll <= 35:
		return "Spy"
	elif roll <= 42:
		return "Herbalist"
	elif roll <= 52:
		return "Hunter"
	elif roll <= 57:
		return "Mystic"
	elif roll <= 68:
		return "Scout"
	elif roll <= 70:
		return "Bounty Hunter"
	elif roll <= 75:
		return "Entertainer"
	elif roll <= 78:
		return "Messenger"
	elif roll <= 79:
		return "Wrecker"
	elif roll <= 85:
		return "Outlaw"
	elif roll <= 90:
		return "Cavalryman"
	elif roll <= 92:
		return "Guard"
	elif roll <= 94:
		return "Knight"
	elif roll <= 96:
		return "Pit Fighter"
	return "Soldier"
