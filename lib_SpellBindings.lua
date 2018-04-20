local aName, aTable = ...;
local require = ExiWoW.require

aTable.spellBindings = function(self)

	local out = {};
	local sb = require("SpellBinding");
	local spellKits = ExiWoW.LibAssets.spell_kits;
	local Timer = Timer;
	
	-- Binds a custom function which is always raised
	table.insert(out, sb:new({
		name = {["Shoulder Demon"]=true, ["Request the Master Call on You"] = true},
		always_run = true,
		custom = {
			timer_speech = 0,
			texts = {
				{"DAGLOP_NIPPLE_TWIST", "DAGLOP_NIPPLE_TWIST_TEXT", "GASP"},
				{"DAGLOP_WEDIGE", "DAGLOP_WEDIGE_TEXT", "GASP"},
				{"DAGLOP_BUTTKICK", "DAGLOP_BUTTKICK_TEXT"},
				{"DAGLOP_BOOB_GRAB", "DAGLOP_BOOB_GRAB_TEXT"},
				{"DAGLOP_MOUTH_FINGER", "DAGLOP_MOUTH_FINGER_TEXT"},
				{"DAGLOP_RITUAL_TEXT"},
			},
			text_playing = false
		},
		onAdd = function(self, data)
			local se = self;
			Timer.clear(self.custom.timer_speech);
			self.custom.timer_speech = Timer.set(function()
				if math.random() < 0.25 then return end
				-- Play a random text
				local viable = {}
				for k,v in pairs(se.custom.texts) do
					table.insert(viable, {k=k, v=v});
				end
				if #viable < 1 then return end
				local tx = viable[ math.random( #viable ) ];
				se.custom.texts[tx.k] = nil;
				tx = tx.v;
				local rptext = RPText.trigger(tx[1], ExiWoW.ME, ExiWoW.ME)
				if not rptext then return end

				if tx[3] then
					DoEmote(tx[3], "player")
				end
				if tx[2] then
					Timer.set(function()
						RPText.trigger(tx[2], ExiWoW.ME, ExiWoW.ME);
					end, 2);
				end
			end, 30, math.huge)
		end,
		onRemove = function(self, data)
			Timer.clear(self.custom.timer_speech);
		end
	}))

	return out;

end