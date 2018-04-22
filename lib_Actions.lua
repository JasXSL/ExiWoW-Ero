local aName, aTable = ...;
local require = ExiWoW.require;

aTable.actions = function(self)

	local out = {}
	
	local libAssets = ExiWoW.LibAssets;
	local ef = libAssets.effects;
	local Action = require("Action");
	local Effect = require("Effect");

	-- Fondle (Public) --
	table.insert(out, Action:new({
		id = "FONDLE",
		name = "Fondle",
		description = "Fondle a player.",
		texture = "ability_paladin_handoflight",
		--cooldown = 1.5,
		cast_sound_success = 57179,
		conditions = {
			Condition.get("melee_range"),
		},
		not_defaults = {
			"not_in_instance"
		},
		max_distance = Action.MELEE_RANGE,
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args) -- Default behavior
			-- Custom actions
			libAssets.effects.addExcitementDefault();
			return true
		end
	}));


	-- Goblin Buzzrocket (Item) --
	table.insert(out, Action:new({
		id = "GOBLIN_BUZZROCKET",
		name = "Experimental Buzzrocket",
		description = "An experimental goblin buzzrocket to enjoy some me-time with. The rocket fuel makes it hightly volatile.",
		texture = "ability_mount_rocketmount",
		cast_time = 20,
		charges = 0,
		cast_sound_start = 43508,
		cast_sound_loop = 50858,
		rarity = 3,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				libAssets.effects.addExcitementDefault(self, true)
			end, 1, 30)
			text(self, true, {receiver=true});
			ef:toggleVibHubProgram("BUZZROCKET", 20);
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			ef:toggleVibHubProgram("BUZZROCKET");
			return true
		end
	}));


	-- Jade rod (Item) --
	table.insert(out, Action:new({
		id = "JADE_ROD",
		name = "Jade Rod",
		description = "A smooth jade rod to play with.",
		texture = "inv_misc_silverjadenecklace",
		cast_time = 20,
		charges = 0,
		rarity = 3,
		cast_sound_start = 39653,
		cast_sound_loop = 39638,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				libAssets.effects.addExcitementDefault(self, true)
			end, 1, 30)
			text(self, true, {receiver=true});
			ef:toggleVibHubProgram("JADE_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			ef:toggleVibHubProgram("JADE_ROD")
			return true
		end
	}));

	-- Shara's Fel Rod (Item) --
	table.insert(out, Action:new({
		id = "SHARAS_FEL_ROD",
		name = "Shara's Fel Rod",
		description = "A barely polished rod of fel iron with glowing green runes. Looks powerful, but not very pleasurable.",
		texture = "Inv_rod_enchantedfelsteel",
		cast_time = 20,
		charges = 0,
		rarity = 3,
		cast_sound_start = 85131,
		cast_sound_loop = 85132,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
		},
		not_defaults = {},
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				libAssets.effects.addExcitementDefault(self, true)
			end, 1, 30)
			text(self, true, {receiver=true});
			ef:toggleVibHubProgram("SHARAS_FEL_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			ef:toggleVibHubProgram("SHARAS_FEL_ROD")
			return true
		end
	}));

	-- Pulsating mushroom consumable
	table.insert(out, Action:new({
		id = "PULSATING_MUSHROOM",
		name = "Pulsating Mushroom",
		description = "Stick a pulsating mushroom into your target's underwear. It will remain until manually removed.",
		texture = "druid_ability_wildmushroom_b",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		max_charges = 100,
		cast_sound_start = 1185,
		cast_sound_loop = 47693,
		conditions = {
			Condition.get("target_not_moving"),
			Condition.get("sender_not_moving"),
			Condition.get("only_selfcast"),
			Condition.get("targetWearsUnderwear"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args) -- Default behavior
			Effect.run("PULSATING_MUSHROOM")
			return true
		end
	}));

	-- Headmistress' paddle
	table.insert(out, Action:new({
		id = "HEADMISTRESS_PADDLE",
		name = "Headmistress' Paddle",
		description = "Whap your target across their rear.",
		texture = "inv_bullroarer",
		cooldown = 6,
		charges=0,
		rarity=3,
		conditions = {
			Condition.get("melee_range"),
		},
		not_defaults = {},
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
					if success and not UnitIsUnit(target, "player") then
					libAssets.effects:critSound(race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			DoEmote("GASP");
			libAssets.effects.addExcitementMasochisticCrit();
			self:receiveRPText(sender, target, args);
			return true
		end
	}));

	return out;


	--[[

	function(self)
			
			local _, text = self:sendRPText("player", "player", false);
			Timer.clear(self.interval)
			self.interval = Timer.set(function()
				ExiWoW.ME:addExcitement(0.05)
			end, 1, 30)
			
		end
	]]
end


