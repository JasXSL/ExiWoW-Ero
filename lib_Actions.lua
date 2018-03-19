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

	return out;

end
