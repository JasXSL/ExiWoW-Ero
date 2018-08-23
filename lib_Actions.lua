local aName, aTable = ...;
local require = ExiWoW.require;

aTable.actions = function(self)

	local out = {}
	
	local libAssets = ExiWoW.LibAssets;
	local Action = require("Action");
	local Effect = require("Effect");
	local Func = require("Func");
	local toggleVibHubProgram = Func.get("toggleVibHubProgram");
	local Condition = require("Condition");

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
			self:receiveRPText(sender, target, args); -- Default behavior
			-- Custom actions
			Func.get("addExcitementDefault")();
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
				Func.get("addExcitementDefault")(self, true)
			end, 1, 30)
			text(self, true, {receiver=true});
			toggleVibHubProgram("BUZZROCKET", 20);
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("BUZZROCKET");
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
				Func.get("addExcitementDefault")(self, true);
			end, 1, 30)
			text(self, true, {receiver=true});
			toggleVibHubProgram("JADE_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("JADE_ROD")
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
				Func.get("addExcitementDefault")(self, true);
			end, 1, 30)
			text(self, true, {receiver=true});
			toggleVibHubProgram("SHARAS_FEL_ROD", 20)
		end,
		fn_done = function(self, success)
			Timer.clear(self.interval)
			toggleVibHubProgram("SHARAS_FEL_ROD")
			return true
		end
	}));

	-- Groin Rumble Totem (Item) --
	table.insert(out, Action:new({
		id = "GROIN_RUMBLE_TOTEM",
		name = "Groin Tremble Totem",
		description = "Stick in your target's pants to stimulate them for 5 minutes or until they remove it. Weaker than a regular Tremble Totem, but still pretty powerful.",
		texture = "spell_nature_tremortotem",
		cast_time = 0,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_start = 1217,
		--cast_sound_loop = 85132,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("melee_range"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args); -- Default behavior
			Effect.run("GROIN_RUMBLE_TOTEM");
			return true;
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

	-- PULSATING_MANA_GEM consumable
	table.insert(out, Action:new({
		id = "PULSATING_MANA_GEM",
		name = "Pulsating Mana Gem",
		description = "Slip a pulsating mana gem into your target's underwear. Nightborne feel double the intensity.",
		texture = "inv_leycrystalmedium",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		max_charges = 50,
		cast_sound_loop = 6425,
		conditions = {
			Condition.get("target_not_moving"),
			Condition.get("sender_not_moving"),
			Condition.get("targetWearsUnderwear"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args) -- Default behavior
			Effect.run("PULSATING_MANA_GEM")
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
					Func.get("critSound")(self, race, gender);
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			DoEmote("GASP");
			Func.get("addExcitementMasochisticCrit")();
			self:receiveRPText(sender, target, args);
			return true
		end
	}));

	-- Vine Squirm (Learned action) --
	table.insert(out, Action:new({
		id = "VINE_SQUIRM",
		name = "Vine Squirm",
		description = "Makes the target's Everliving Vine Thong squirm against their groin, provided they're wearing one.",
		texture = "inv_misc_herb_nightmarevine",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_success = 47759,
		cast_sound_loop = 27,
		conditions = {
			Condition:new({id="vineThongCheck", type=Condition.Types.RTYPE_UNDIES, data={["EVERLIVING_VINE_THONG"]=true}}),
			Condition.get("caster_range"),
			Condition.get("sender_not_moving"),
		},
		not_defaults = {},
		fn_send = Action.sendRPText,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args) -- Default behavior
			--TODO: Run effect
			Effect.run("VINE_SQUIRM");
			return true
		end
	}));

	-- Vine Squirm (Learned action) --
	table.insert(out, Action:new({
		id = "VINE_THRASH",
		name = "Vine Thrash",
		description = "Makes the target's Everliving Vine Thong do evil things to the wearer, provided they're wearing one.",
		texture = "ability_hunter_onewithnature",
		cast_time = 2,
		charges = 0,
		rarity = 3,
		cooldown = 120,
		cast_sound_success = 47759,
		cast_sound_loop = 27,
		conditions = {
			Condition:new({id="vineThongCheck", type=Condition.Types.RTYPE_UNDIES, data={["EVERLIVING_VINE_THONG"]=true}}),
			Condition.get("caster_range"),
			Condition.get("sender_not_moving"),
		},
		not_defaults = {},
		fn_send = function(self, sender, target, suppressErrors)
			local race = UnitRace(target)
			local gender = UnitSex(target)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			self:receiveRPText(sender, target, args); -- Default behavior
			Func.get("addExcitementCrit")();
			DoEmote("gasp", "player");
			return true
		end
	}));


	table.insert(out, Action:new({
		id = "NETTLE_RUB",
		name = "Nettle Rub",
		description = "Rub a Stinging Nettle against your target's rear.",
		texture = "inv_misc_spineleaf _01",
		cooldown = 10,
		cast_time = 2,
		cast_sound_loop = 1142,
		fn_send = function(self, sender, target, suppressErrors)
			return self:sendRPText(sender, target, suppressErrors, function(se, success)
				if success and not UnitIsUnit(target, "player") then
					Func.get("critSound")(self, race, gender)
				end
			end);
		end,
		fn_receive = function(self, sender, target, args)
			print("Received nettle rub");
			self:receiveRPText(sender, target, args);
			Func.get("addExcitementMasochistic")();
			if not UnitIsUnit(Ambiguate(sender, "all"), "player") then
				DoEmote("GASP", sender);
			end
			return true
		end,
		conditions = {
			Condition.get("sender_not_moving"),
			Condition.get("melee_range"),
		},
		filters = {
			Condition:new({
				type = Condition.Types.RTYPE_HAS_INVENTORY,
				data = {{name="Stinging Nettle"}},
				sender = true
			})
		}

	}));

	return out;

end


