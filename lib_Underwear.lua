local aName, aTable = ...;
aTable.underwear = function(self)

	local out = {}
	local uw = ExiWoW.Underwear;
	table.insert(out, uw:new({
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


	-- This will cause the property to self delete, it's not needed. 
	return out
end