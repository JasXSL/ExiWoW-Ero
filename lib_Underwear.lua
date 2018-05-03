local aName, aTable = ...;
local require = ExiWoW.require

aTable.underwear = function(self)

	local Underwear = require("Underwear");

	local out = {}
	table.insert(out, Underwear:new({
		id = "MUSHROOM_UNDERWEAR",
		name = "Mushroom Underwear",
		icon = "Inv_misc_herb_ghostmushroomcap",
		description = "Living mushroom underwear that grows to cover your essentials.",
		flavor = "It wiggles!",
		rarity = 4,
		effects = {
			"MUSHROOM_UNDERWEAR"
		},
		tags = {},
	}));

	table.insert(out, Underwear:new({
		id = "WITHERED_VINE_THONG",
		name = "Withered Vine Thong",
		icon = "spell_nature_naturetouchdecay",
		description = "A thong of dying vines. Not very fashionable.",
		--flavor = "It wiggles!",
		rarity = 2,
		tags = {},
	}));

	table.insert(out, Underwear:new({
		id = "EVERLIVING_VINE_THONG",
		name = "Everliving Vine Thong",
		icon = "spell_nature_magicimmunity",
		description = "A thong woven of everliving green vines.",
		flavor = "Favored by druids of Val'sharah!",
		rarity = 4,
		tags = {},
	}));


	-- This will cause the property to self delete, it's not needed. 
	return out
end