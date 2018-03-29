local aName, aTable = ...;
aTable.assets = function(self)
	-- Use this if you want to extend the default triggers, such as electric/frost spells etc
	-- Feel free to supply any interesting triggers you find to the official project!

	-- Add loot
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
				text = ExiWoW.RPText:new({
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
				text = ExiWoW.RPText:new({
					text_receiver = "You found a jade rod! It seems to be pulsating gently..."
				})
			}
		}
	})
	table.insert(loot, {
		zone = "The Jade Forest",
		name = "Serpent's Heart",
		items={
			{
				type = "Charges", 
				id = "JADE_ROD", 
				chance = 0.2,
				quant = math.huge,
				sound = 1221,
				text = ExiWoW.RPText:new({
					text_receiver = "You found a jade rod! It seems to be pulsating gently..."
				})
			}
		}
	})


	

	-- This will cause the property to self delete, it's not needed. 
	return nil
end