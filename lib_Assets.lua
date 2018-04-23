local aName, aTable = ...;
local require = ExiWoW.require

aTable.assets = function(self)
	-- Use this if you want to extend the default triggers, such as electric/frost spells etc
	-- Feel free to supply any interesting triggers you find to the official project!
	local RPText = require("RPText");
	print("Todo: Convert loot in lib_Assets.lua")
	-- Add loot
	--[[
	local loot = ExiWoW.LibAssets.loot;
	table.insert(loot, {
		zone = "Netherstorm",
		sub = "Area 52",
		name = "_FORAGE_",
		points = {
			{x = 32.57, y=66.94, rad=0.2},
			{x = 31.2, y=67.02, rad=0.16},
			{x = 33.39, y=64.37, rad=0.2},
		},
		items={
			{
				type = "Charges", 
				id = "GOBLIN_BUZZROCKET", 
				chance = 1,
				quant = math.huge,
				sound = 1213,
				text = RPText:new({
					text_receiver = "This old goblin grinder rocket contraption looks to have been obsoleted and thrown away.\nMaybe I could find another use for it..."
				})
			}
		}
	})


	-- Jade rod
	table.insert(loot, {
		zone = "The Jade Forest",
		name = "_FORAGE_",
		points = {
			{x = 39.39, y=46.2, rad=0.21},
			{x = 47.58, y=31.97, rad=0.17},
			{x = 48.24, y=30.62, rad=0.14},
			{x = 48.61, y=31.53, rad=0.24},
			{x = 45.21, y=22.31, rad=0.18},
			
		},
		items={
			{
				type = "Charges", 
				id = "JADE_ROD", 
				chance = 1,
				quant = math.huge,
				sound = 1221,
				text = RPText:new({
					text_receiver = "You found a jade rod! It seems to be pulsating gently..."
				})
			}
		}
	})
	table.insert(loot, {
		zone = "The Jade Forest",
		sub = "Serpent's Heart",
		name = "_FORAGE_",
		items={
			{
				type = "Charges", 
				id = "JADE_ROD", 
				chance = 0.2,
				quant = math.huge,
				sound = 1221,
				text = RPText:new({
					text_receiver = "You found a jade rod! It seems to be pulsating gently..."
				})
			}
		}
	})

	-- Shara's fel rod
	table.insert(loot, {
		zone = "Highmountain",
		sub = "Bloodhunt Highland",
		name = "_FORAGE_",
		points = {
			{x = 50.85, y=25.39, rad=0.11},
		},
		items={
			{
				type = "Charges", 
				id = "SHARAS_FEL_ROD", 
				chance = 1,
				quant = math.huge,
				sound = 1191,
				text = RPText:new({
					text_receiver = "You found an uncomfortable pulsating fel iron rod. You decide that it'd be better with you than with Shara..."
				})
			}
		}
	})

	-- Mushrooms
	table.insert(loot, {
		zone = zones.shrooms,
		name = "_FORAGE_",
		items={
			{
				type = "Charges", 
				id = "PULSATING_MUSHROOM", 
				chance = 0.5,
				quant = 1,
				quantRand = 3,
				sound = 1221,
				text = RPText:new({
					text_receiver = "You found %Q pulsating mushroom%Qs!"
				})
			}
		}
	})

	-- Mushroom underwear
	table.insert(loot, {
		zone = "Zangarmarsh",
		sub = "Sporeggar",
		name = "_FORAGE_",
		items={
			{
				type = "Underwear", 
				id = "MUSHROOM_UNDERWEAR", 
				chance = 0.25,
				sound = 1185,
				text = RPText:new({
					text_receiver = "You find an interesting cluster of mushrooms that seem to shape themselves to your body!"
				})
			}
		}
	})

	-- Headmistress' paddle
	table.insert(loot, {
		zone = "Azsuna",
		sub = "Hall of Arcane Learning",
		name = "_FORAGE_",
		items={
			{
				type = "Charges", 
				id = "HEADMISTRESS_PADDLE", 
				chance = 0.25,
				quant = math.huge,
				sound = 1199,
				text = RPText:new({
					text_receiver = "You found the headmistress' paddle laying around. You decide it's probably better for someone more... 'responsible' to hold it."
				})
			}
		}
	})
	]]

	-- This will cause the property to self delete, it's not needed. 
	return nil
end