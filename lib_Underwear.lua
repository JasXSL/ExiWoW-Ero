local aName, aTable = ...;
local require = ExiWoW.require

aTable.underwear = function(self)

	local Underwear = require("Underwear");
	local Event = require("Event");
	local Effect = require("Effect");

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

	table.insert(out, Underwear:new({
		id = "THONG_OF_VALOR",
		name = "Thong of Valor",
		icon = "70_inscription_vantus_rune_odyn",
		description = "A thong adorned with golden borders, with a glowing rune in the front. Arouses the wearer while they are in combat.",
		flavor = "Prove your valor!",
		rarity = 4,
		tags = {},
		on_equip = function(self)
			self:bind(Event.Types.ENTER_COMBAT, function()
				Effect.get("THONG_OF_VALOR"):add();
			end);
			self:bind(Event.Types.EXIT_COMBAT, function()
				Effect.remByID("THONG_OF_VALOR");
			end);
		end
	}));

	

	-- This will cause the property to self delete, it's not needed. 
	return out
end