local aName, aTable = ...;
aTable.actions = function(self)

	local out = {}
	local ef = ExiWoW.LibAssets.effects;

	-- Fondle (Public) --
	table.insert(out, ExiWoW.Action:new({
		id = "FONDLE",
		name = "Fondle",
		description = "Fondle a player.",
		texture = "ability_paladin_handoflight",
		--cooldown = 1.5,
		cast_sound_success = 57179,
		allow_instance = true,
		max_distance = ExiWoW.Action.MELEE_RANGE,
		fn_send = ExiWoW.Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args) -- Default behavior
			-- Custom actions
			ExiWoW.LibAssets.effects.addExcitementDefault();
			return true
		end
	}));


	-- Goblin Buzzrocket (Item) --
	table.insert(out, ExiWoW.Action:new({
		id = "GOBLIN_BUZZROCKET",
		name = "Experimental Buzzrocket",
		description = "An experimental goblin buzzrocket to enjoy some me-time with. The rocket fuel makes it hightly volatile.",
		texture = "ability_mount_rocketmount",
		cast_time = 20,
		charges = 0,
		self_cast_only = true,
		cast_sound_start = 43508,
		cast_sound_loop = 50858,
		allow_caster_moving = false,
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			ExiWoW.Timer:clear(self.interval)
			self.interval = ExiWoW.Timer:set(function()
				ExiWoW.ME:addExcitement(0.05)
			end, 1, 30)
			text(self, true, {receiver=true});
			ef:toggleVibHubProgram("BUZZROCKET", 20);
		end,
		fn_done = function(self, success)
			ExiWoW.Timer:clear(self.interval)
			ef:toggleVibHubProgram("BUZZROCKET");
			return true
		end
	}));


	-- Goblin Buzzrocket (Public) --
	table.insert(out, ExiWoW.Action:new({
		id = "JADE_ROD",
		name = "Jade Rod",
		description = "A smooth jade rod to play with.",
		texture = "inv_misc_silverjadenecklace",
		cast_time = 20,
		charges = 0,
		self_cast_only = true,
		cast_sound_start = 39653,
		cast_sound_loop = 39638,
		allow_caster_moving = false,
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			ExiWoW.Timer:clear(self.interval)
			self.interval = ExiWoW.Timer:set(function()
				ExiWoW.ME:addExcitement(0.05)
			end, 1, 30)
			text(self, true, {receiver=true});
			ef:toggleVibHubProgram("JADE_ROD", 20)
		end,
		fn_done = function(self, success)
			ExiWoW.Timer:clear(self.interval)
			ef:toggleVibHubProgram("JADE_ROD")
			return true
		end
	}));

	return out;

end


