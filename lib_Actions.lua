local aName, aTable = ...;
aTable.actions = function(self)

	local out = {}

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
			ExiWoW.ME:addExcitement(0.05);
			return true
		end
	}));


	-- Goblin Buzzrocket (Public) --
	table.insert(out, ExiWoW.Action:new({
		id = "GOBLIN_BUZZROCKET",
		name = "Experimental Buzzrocket",
		description = "An experimental goblin buzzrocket to enjoy some me-time with. The rocket fuel makes it hightly volatile.",
		texture = "ability_mount_rocketmount",
		cast_time = 8,
		charges = 0,
		self_cast_only = true,
		cast_sound_start = 43508,
		cast_sound_loop = 50858,
		allow_caster_moving = false,
		fn_cast = function(self)
			local _, text = self:sendRPText("player", "player", false);
			text(self, true, {receiver=true});
			print("Begin")
		end,
		fn_done = function(self, success)
			print("Done", success)
			return true
		end
	}));

	return out;

end


