local aName, aTable = ...;
local require = ExiWoW.require

aTable.effects = function(self)

	local ef = ExiWoW.LibAssets.effects
	local Effect = require("Effect");
	local Timer = require("Timer");
	local Action = require("Action");
	local RPText = require("RPText");

	local out = {};

	-- These are Effect effect definitions
	table.insert(out, Effect:new({
		id = "debuffShardTickleButt",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is lodged between your buttcheeks!",
		onAdd = function()
			ef:toggleVibHubProgram("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			ef:toggleVibHubProgram("SMALL_TICKLE");
		end
	}));

	table.insert(out, Effect:new({
		id = "debuffShardTickleBreasts",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is lodged between your breasts!",
		onAdd = function()
			ef:toggleVibHubProgram("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			ef:toggleVibHubProgram("SMALL_TICKLE");
		end
	}));
	table.insert(out, Effect:new({
		id = "debuffShardTickleGroin",
		detrimental = true,
		duration = 10,
		ticking = 0,
		max_stacks = 1,
		texture = "Interface/Icons/inv_enchanting_wod_crystalshard2",
		name = "Vibrating Shard",
		description = "A vibrating shard is stuck in your underwear!",
		onAdd = function()
			ef:toggleVibHubProgram("SMALL_TICKLE", 11);
		end,
		onRemove = function()
			ef:toggleVibHubProgram("SMALL_TICKLE");
		end
	}));
	
	-- /run Effect.run("oozeInClothes")
	table.insert(out, Effect:new({
		id = "oozeInClothes",
		detrimental = true,
		duration = 600,
		ticking = 5,
		max_stacks = 1,
		texture = "Interface/Icons/inv_misc_food_legion_gooslime_chunk",
		name = "Ooze",
		description = "Living ooze has made it into your clothes! Right click to remove it.",
		onAdd = function(self, binding, fromReload)
			self.rightClicked = false
			ef:toggleVibHubProgram("IDLE_OOZE", 600)
			if not fromReload then
				RPText.trigger("FX_OozeInClothesAdd", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onTick = function(self)
			if math.random() < 0.35 then
				RPText.trigger("FX_OozeInClothesTick", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onRemove = function(self)
			ef:toggleVibHubProgram("IDLE_OOZE")
			
			if not self.rightClicked then
				RPText.trigger("FX_OozeInClothesFade", ExiWoW.ME, ExiWoW.ME)
			end
			--ef:toggleVibHubProgram("SMALL_TICKLE");
		end,
		onRightClick = function(self, data)
			self.rightClicked = true
			local effect = data.effect
			local id = data.id

			-- Create a custom removal action
			local remAction =  Action:new({
				id = "_",
				self_only = true,
				name = "Remove Goo",
				description = "Removes the living goo from your clothes.",
				texture = "ability_bossfelmagnaron_handempowered",
				cooldown = 0,
				cast_sound_loop = 79252,
				allow_caster_moving = false,
				cast_time = 5,
				allow_targ_combat = false,
				-- Handle the receiving end here
				fn_send = function(self, sender, target, suppressErrors)
		
					RPText.trigger("FX_OozeInClothesRem", ExiWoW.ME, ExiWoW.ME)
					Effect.rem(id)

					return false
				end
			})
			Action.useOnTarget(remAction, "player")
			
			return false
		end
	}));

	-- /run Effect.run("PULSATING_MUSHROOM")
	table.insert(out, Effect:new({
		id = "PULSATING_MUSHROOM",
		detrimental = true,
		duration = 0,
		max_stacks = 1,
		texture = "Interface/Icons/druid_ability_wildmushroom_b",
		name = "Pulsating Mushroom",
		description = "Someone stuck a pulsating mushroom in your clothes! Right click to remove it.",
		sound_loop = 25152,
		onAdd = function(self, binding, fromReload)
			self.rightClicked = false
			ef:toggleVibHubProgram("PULSATING_MUSHROOM", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.01)
			end, 2, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			ef:toggleVibHubProgram("PULSATING_MUSHROOM")
			if not self.rightClicked then
				RPText.trigger("FX_PULSATING_MUSHROOM_REM", ExiWoW.ME, ExiWoW.ME)
			end
		end,
		onRightClick = function(self, data)
			self.rightClicked = true
			local effect = data.effect
			local id = data.id

			-- Create a custom removal action
			local remAction =  Action:new({
				id = "_",
				self_only = true,
				name = "Remove Mushroom",
				description = "Removes the mushroom from your clothes.",
				texture = "ability_bossfelmagnaron_handempowered",
				cooldown = 0,
				cast_sound_loop = 79252,
				allow_caster_moving = false,
				cast_time = 1.5,
				allow_targ_combat = false,
				-- Handle the receiving end here
				fn_send = function(self, sender, target, suppressErrors)
		
					RPText.trigger("FX_PULSATING_MUSHROOM_REM", ExiWoW.ME, ExiWoW.ME)
					Effect.rem(id)

					return false
				end
			})
			Action.useOnTarget(remAction, "player")
			
			return false
		end
	}));

	table.insert(out, Effect:new({
		id = "MUSHROOM_UNDERWEAR",
		detrimental = true,
		duration = 0,
		max_stacks = 1,
		texture = "Interface/Icons/Inv_misc_herb_ghostmushroomcap",
		name = "Pulsating Mushroom",
		description = "Your underwear are alive.",
		onAdd = function(self, binding, fromReload)
			ef:toggleVibHubProgram("PULSATING_MUSHROOM_SMALL", math.huge)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.01)
			end, 1, math.huge)
		end,
		onRemove = function(self)
			Timer.clear(self.interval);
			ef:toggleVibHubProgram("PULSATING_MUSHROOM_SMALL")
		end
	}));

	return out
end