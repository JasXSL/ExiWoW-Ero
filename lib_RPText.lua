local aName, aTable = ...;
local require = ExiWoW.require

aTable.rpTexts = function(self)

	local R = {};
	local RPText = require("RPText");
	local Condition = require("Condition");	-- RPText requirement constructor
	local Effect = require("Effect");
	local Database = require("Database");
	local Func = require("Func");

	local ty = Condition.Types;			-- Local filter types
	
	-- Shortcuts for the templates library
	-- It's recommended to use templates if one is available, you can also use lib_Assets to extend the templates library
	local assetLib = ExiWoW.LibAssets;
	local spellKits = assetLib.spell_kits;		-- RP Text spell kits library
	-- Gets a spell kit condition formated for RP texts
	local getsk = function(...)
		local kits = {...};
		local out = {};
		for _,v in pairs(kits) do
			if type(spellKits[v]) == "table" then
				for k,t in pairs(spellKits[v]) do
					out[k] = t;
				end
			end
		end
		return out;
	end


	local function getCondition(id)
		return Database.getID("Condition", id);
	end
	
	local spellAddOrTick = Database.getIDs("Condition", {spellAdd=true, spellTick=true});

-- ACTIONS
	-- Fondle --
	-- You can set text_sender to nil to set self_cast_only to true

		-- TARGET --

			-- Fondle breasts target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tbreasts!",
				text_sender = "You grab a hold of and rub %T's %Tbreasts!",
				text_receiver = "%S grabs a hold of and rubs your %Tbreasts!",
				sound = 57179,
				requirements = {getCondition("victimBreasts")}
			}))

			-- Fondle groin target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tgroin!",
				text_sender = "You grab a hold of and rub %T's %Tgroin!",
				text_receiver = "%S grabs a hold of and rubs your %Tgroin!",
				sound = 57179,
				requirements = {}
			}))

			-- Fondle butt target
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%S grabs a hold of and rubs %T's %Tbutt!",
				text_sender = "You grab a hold of and rub %T's %Tbutt!",
				text_receiver = "%S grabs a hold of and rubs your %Tbutt!",
				sound = 57179,
				requirements = {}
			}))

		-- SELF --
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%T rubs %This %Tgroin!",
				text_receiver = "You rub your %Tgroin!",
				sound = 57179,
				requirements = {}
			}))
			table.insert(R, RPText:new({
				id = "FONDLE",
				text_bystander = "%T rubs %This %Tbreasts!",
				text_receiver = "You rub your %Tbreasts!",
				sound = 57179,
				requirements = { getCondition("victimBreasts") }
			}))
		--

	-- TICKLE --
			-- Tickle target
			table.insert(R, RPText:new({
				id = "TICKLE",
				text_bystander = "%S tickles %T between %This legs!",
				text_sender = "You tickle %T between %This legs!",
				text_receiver = "%S tickles you between your legs!",
				requirements = {},
			}))
			table.insert(R, RPText:new({
				id = "TICKLE",
				text_bystander = "%S tickles %T between %This legs with %Shis %item!",
				text_sender = "You tickle %T between %This legs with your %item!",
				text_receiver = "%S tickles your %Tgroin with %Shis %item!",
				requirements = {getCondition("invFeathers")},
			}))

			-- Tickle self
			table.insert(R, RPText:new({
				id = "TICKLE",
				text_bystander = "%T tickles %Thimself with %This %item!",
				text_receiver = "You tickle your own %Tgroin with %This %item!",
				requirements = {getCondition("invFeathers")},
				
			}))

	-- Throw sand --
		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%S throws a handful of sand at %T, the majority of which falls into %This cleavage!", 
			text_sender = "You throw a handful of sand at %T, the majority of which falls into %This cleavage!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which falls into your cleavage!",
			sound = 907,
			requirements = {getCondition("victimBreasts")},
			
		}))

		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%S throws a handful of sand at %T, the majority of which gets into %This %Tundies!", 
			text_sender = "You throw a handful of sand at %T, the majority of which gets into %This %Tundies!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which gets into your %Tundies!",
			sound = 907,
			requirements = {getCondition("targetWearsUnderwear")},
			
		}))

		-- Self
		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%T lets a trickle of sand fall down %This cleavage!",
			text_receiver = "You let a trickle of sand fall down your cleavage!",
			sound = 73172,
			requirements = {getCondition("victimBreasts")},
			
		}))

		table.insert(R, RPText:new({
			id = "THROW_SAND",
			text_bystander = "%T stretches out %This waistline and pours some sand into %This %Tundies!",
			text_receiver = "You stretch out your waistline and pour some sand into your %Tundies!",
			sound = 73172,
			requirements = {getCondition("targetWearsUnderwear")},
			
		}))


	-- Claw pinch --
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's %Tbutt with %Shis big claw!",
			text_sender = "You pinch %T's %Tbutt with your big claw!",
			text_receiver = "%S pinches your %Tbutt with %Shis big claw!",
			sound = 36721,
			requirements = {},
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's %Tgroin with a big claw!",
			text_sender = "You pinch %T's %Tgroin with your big claw!",
			text_receiver = "%S pinches your %Tgroin with %Shis big claw!",
			sound = 36721,
			requirements = {},
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%S pinches %T's nipple with a big claw!",
			text_sender = "You pinch %T's nipple with your big claw!",
			text_receiver = "%S pinches your nipple with %Shis big claw!",
			sound = 36721,
			requirements = {getCondition("victimBreasts")},
			
		}))

		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%T pinches %This %Tbutt with a big claw!",
			text_receiver = "You pinch your %Tbutt with your big claw!",
			sound = 36721,
			requirements = {},
			
		}))
		table.insert(R, RPText:new({
			id = "CLAW_PINCH",
			text_bystander = "%T pinches %This %leftright nipple with a big claw!",
			text_receiver = "You pinch your %leftright nipple with your big claw!",
			sound = 36721,
			requirements = {getCondition("victimBreasts")},
			
		}))


	-- Goblin buzzrocket
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander =  "%T pushes a vibrational rocket into %This %Tvagina and hits the ingition!",
			text_receiver = "You push the vibrational rocket into your %Tvagina and hit the ingition!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T sticks a vibrational rocket between %This %Tbreasts and hits the ingition!",
			text_receiver = "You stick the vibrational rocket between your %Tbreasts and hit the ingition!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T pushes a vibrational rocket against %This %Tgroin and hits the ingition!",
			text_receiver = "You push the vibrational rocket against your %Tgroin and hit the ingition!",
		}))
		table.insert(R, RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_bystander = "%T pushes a vibrational rocket into %This %Tbutt and hits the ingition!",
			text_receiver = "You push the vibrational rocket into your %Tbutt and hit the ingition!",
		}))
		

	-- Jade Rod
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade into %This %Tvagina where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade into your %Tvagina where it starts pleasantly pulsating!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T sticks an elongated slab of jade between %This %Tbreasts where it starts pulsating!",
			text_receiver = "You stick the elongated slab of jade between your %Tbreasts where it starts pleasantly pulsating!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade against %This %Tgroin where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade against your %Tgroin where it starts pleasantly pulsating!",
		}))
		table.insert(R, RPText:new({
			id = "JADE_ROD",
			text_bystander = "%T pushes an elongated slab of jade into %This %Tbutt where it starts pulsating!",
			text_receiver = "You push the elongated slab of jade into your %Tbutt where it starts pleasantly pulsating!",
		}))

	-- Shara's fel rod
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron inside %This %Tvagina!",
			text_receiver = "You push the corrupted rod of fel iron into your %Tvagina!",
			requirements = {getCondition("victimVagina")}
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T sticks a corrupted rod of fel iron between %This %Tbreasts!",
			text_receiver = "You stick the corrupted rod of fel iron between your %Tbreasts!",
			requirements = {getCondition("victimBreasts")}
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron against %This %Tgroin!",
			text_receiver = "You push the corrupted rod of fel iron against your %Tgroin!",
		}))
		table.insert(R, RPText:new({
			id = "SHARAS_FEL_ROD",
			text_bystander = "%T pushes a corrupted rod of fel iron into %This %Tbutt!",
			text_receiver = "You push the corrupted rod of fel iron into your %Tbutt!",
		}))
		
	-- PULSATING_MUSHROOM
		table.insert(R, RPText:new({
			id = "PULSATING_MUSHROOM",
			sound = 43036,
			text_bystander = "%S sticks a pulsating mushroom into %T's %Tundies!",
			text_sender = "You stick your pulsating mushroom into %T's %Tundies!",
			text_receiver = "%S sticks a pulsating mushroom into your %Tundies!",
		}))
		table.insert(R, RPText:new({
			id = "PULSATING_MUSHROOM",
			sound = 43036,
			text_bystander = "%T sticks a pulsating mushroom into %This %Tundies!",
			text_receiver = "You stick a pulsating mushroom into your %Tundies!",
		}))
		table.insert(R, RPText:new({
			id = "FX_PULSATING_MUSHROOM_REM",
			text_bystander = "%T removes the pulsating mushroom from %This %Tundies!",
			text_receiver = "You remove the pulsating mushroom from your %Tundies!",
			sound = 73580
		}))
		
	-- HEADMISTRESS_PADDLE
		table.insert(R, RPText:new({
			id = "HEADMISTRESS_PADDLE",
			sound = 3338,
			text_bystander = "%S slaps %T hard across %This %Tbutt with the headmistress' paddle!",
			text_sender = "You slap %T hard across %This %Tbutt with your headmistress' paddle!",
			text_receiver = "%S slaps you hard across your %Tbutt with %Shis headmistress' paddle!",
		}))
		table.insert(R, RPText:new({
			id = "HEADMISTRESS_PADDLE",
			sound = 3338,
			text_bystander = "%T slaps %Thimself across %This %Tbutt with the headmistress' paddle!",
			text_receiver = "You slap your own %Tbutt with the headmistress' paddle!",
		}))
		

		
	



-- MELEE SWINGS --
	-- HUMANOIDISH (crits) --

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attacks smacks against %T's %leftright %Tbreast!",
			text_receiver = "%S's attacks smacks against your %leftright %Tbreast!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))


		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attack smacks across %T's %Tgroin!",
			text_receiver = "%S's attack smacks painfully across your %Tgroin!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S's attack smacks across %T's %Tbreasts!",
			text_receiver = "%S's attack smacks painfully across your %Tbreasts!",
			sound = 37472,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		-- Paralysis
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being paralyzed, squeezing %This %Tbreasts hard!",
			text_receiver = "%S takes advantage of you being paralyzed, squeezing your %Tbreasts hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "While %T is paralyzed, %S grabs a hold of %This nipples and twists hard!",
			text_receiver = "While you are paralyzed, %S grabs a hold of your nipples and twists hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being paralyzed, squeezing %This %Tgroin hard!",
			text_receiver = "%S takes advantage of you being paralyzed, squeezing your %Tgroin hard!",
			sound = 25626,
			requirements = {getCondition("attackerHumanoidish"), getCondition("victimBreasts"), getCondition("victimParalyzed")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

	-- Pinchers --
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S pinches %T's %leftright nipple!",
			text_receiver = "%S pinches your %leftright nipple!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S pinches %T's %leftright %Tbreast!",
			text_receiver = "%S pinches your %leftright %Tbreast!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S pinches %T's %Tgroin!",
			text_receiver = "%S pinches your %Tgroin!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S clamps down hard on %T's %Tgroin!",
			text_receiver = "%S clamps down hard on your %Tgroin!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S clamps down hard and tugs at both %T's nipples!",
			text_receiver = "%S clamps down hard and tugs at both your nipples!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S clamps down hard on %T's %leftright nipple, twisting it in the process!",
			text_receiver = "%S clamps down hard on your %leftright nipple, twisting it in the process!",
			--sound = 57787,
			requirements = {getCondition("attackerIsPinchy"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))


	-- Wasps
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S's stinger tickles between %T's legs!",
			text_receiver = "%S's stinger tickles between your legs!",
			--sound = 57787,
			requirements = {getCondition("attackerIsWasp"), getCondition("rand50")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))


	-- Tentacle fiends (like the one in the draenei start area)
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, wiggling against %This %Tgroin!",
			text_receiver = "%S slips a tentacle into your clothes, tickling your %Tgroin!",
			sound = 21727,
			requirements = {getCondition("attackerIsTentacleFiend")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, wiggling between %This %Trtag buttcheeks!",
			text_receiver = "%S slips a tentacle into your clothes, tickling between your %Trtag buttcheeks!",
			sound = 21727,
			requirements = {getCondition("attackerIsTentacleFiend")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S slips a tentacle into %T's clothes, slipping it up into %This %Tvagina and wiggling it around!",
			text_receiver = "%S slips a tentacle into your clothes, slipping it up into your %Tvagina and wiggling it around!",
			sound = 21727,
			requirements = {getCondition("attackerIsTentacleFiend"), getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a tentacle into %T's clothes, hooping it around %This nipples and tugs!",
			text_receiver = "%S slips a tentacle into your clothes, hooping it around your nipples and tugs!",
			sound = 21729,
			requirements = {getCondition("attackerIsTentacleFiend"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))

	-- Lashing NPCs
		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S lashes %T's %Tgroin!",
			text_receiver = "%S lashes your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S lashes %T's %leftright %Tbreast!",
			text_receiver = "%S lashes your %leftright %Tbreast!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes hard across %T's %Tgroin!",
			text_receiver = "%S lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S slips a vine between %T's legs and tickles %This %Tgroin!",
			text_receiver = "%S slips a vine between your legs, tickling your %Tgroin!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "A vine slips across %T's %Tbreasts wiggling against %This nipples!",
			text_receiver = "A vine slips across your %Tbreasts, tickling your nipples!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes across both %T's %Tbreasts!",
			text_receiver = "%S lashes across both your %Tbreasts!",
			sound = 3338,
			requirements = {getCondition("attackerIsLasher"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S envelops %T's package with a vine, squeezing hard!",
			text_receiver = "%S envelops your package with a vine, squeezing hard!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S envelops %T's %Tbreasts with vines, squeezing hard!",
			text_receiver = "%S envelops your %Tbreasts with vines, squeezing hard!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S lashes vines around %T's nipples and tugs back!",
			text_receiver = "%S lashes vines around your nipples and tugs back!",
			sound = 25626,
			requirements = {getCondition("attackerIsVines"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING_CRIT",
			text_bystander = "%S pushes a vine up between %T's legs, rigorously rubbing %This clit through %This clothes!",
			text_receiver = "%S pushes a vine up between your legs, rigorously rubbing your clit through your clothes!",
			sound = 21727,
			requirements = {getCondition("attackerIsVines"), getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

		table.insert(R, RPText:new({
			id = "SWING",
			text_bystander = "%S takes advantage of %T being knocked down and lashes hard across %This %Tgroin!",
			text_receiver = "%S takes advantage of you being knocked down and lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {getCondition("attackerIsVines"), getCondition("victimKnockedDown")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))

	-- Ooze NPCs
		table.insert(R, RPText:new({
			id = "SWING",
			text_receiver = "Some ooze trickles into your cleavage.",
			--sound = 3338,
			requirements = {getCondition("attackerIsOoze"), getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = function()
				Func.get("addExcitement")(self)
				if math.random() < 0.3 then
					Timer.set(function()
						Effect.run("oozeInClothes")
					end, 3+math.random()*3)
				end
			end
		}))
		table.insert(R, RPText:new({
			id = "SWING",
			text_receiver = "Some ooze trickles into your %Tundies.",
			--sound = 3338,
			requirements = {getCondition("attackerIsOoze"), getCondition("targetWearsUnderwear")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = function(self)
				Func.get("addExcitement")(self)
				if math.random() < 0.5 then
					Timer.set(function()
						Effect.run("oozeInClothes")
					end, 3+math.random()*3)
				end
			end
		}))

-- SPELLS --

		-- GENERIC / NPC --

			-- Ice spells
				table.insert(R, RPText:new({
					id = getsk("ice", "ice_common"),
					text_bystander = "The cold spell causes %T's nipples to harden!",
					text_receiver = "The cold spell causes your nipples to harden!",
					--sound = 48289,
					requirements = {"spellAddOrTick", getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("ice", "ice_common"),
					text_receiver = "%spell chills your nipples!",
					--sound = 48289,
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("ice", "ice_common"),
					text_receiver = "%spell chills your %Tgroin!",
					--sound = 48289,
					requirements = {spellAddOrTick, getCondition("victimPenis")},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Lightning
				
				table.insert(R, RPText:new({
					id = getsk("electric", "electric_common"),
					text_receiver = "The %spell shocks your nipples!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("electric"),
					text_receiver = "The %spell painfully shocks your %Tbreasts!",
					sound = 35286,
					requirements = {
						spellAddOrTick,  -- OR
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Basilisk stares
				
				table.insert(R, RPText:new({
					id = getsk("basilisk"),
					text_bystander = "%spell causes %T's nipples to %harden!",
					text_receiver = "%spell causes your nipples to %harden!",
					--sound = 35103,
					requirements = {
						getCondition("spellAdd"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = getsk("basilisk"),
					text_bystander = "%spell causes %T's %Tpenis to %harden!",
					text_receiver = "%spell causes your %Tpenis to %harden!",
					--sound = 35103,
					requirements = {
						getCondition("spellAdd"),
						getCondition("victimPenis")
					},
					fn = Func.get("addExcitement")
				}))

			-- Uppercut
				table.insert(R, RPText:new({
					id = "Uppercut",
					text_bystander = "%S uppercuts %T's %Tbreasts with enough force to knock %Thim back!",
					text_receiver = "%S uppercuts your %Tbreasts with enough force to knock you back!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Uppercut",
					text_bystander = "%S uppercuts %T's %leftright %Tbreast, jiggling it around heavily as %The stagger backwards!",
					text_receiver = "%S uppercuts your %leftright %Tbreast, jiggling it around heavily as you stagger backwards!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Shield bash
				table.insert(R, RPText:new({
					id = getsk("shield_bash"),
					text_bystander = "%S's shield slams across %T's %Tbreasts!",
					text_receiver = "%S's shield slams across your %Tbreasts!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Steam below
				table.insert(R, RPText:new({
					id = getsk("steam_below"),
					text_receiver = "Hot steam blasts up across your %Tgroin!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick")
					},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Headbutt
				table.insert(R, RPText:new({
					id = "Headbutt",
					text_bystander = "%S headbutts straight into %T's %Tbreasts!",
					text_receiver = "%S headbutts straight into your %Tbreasts!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts"),
						getCondition("attackerHumanoidish")
					},
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Slitherstrike
				table.insert(R, RPText:new({
					id = "Slitherstrike",
					text_receiver = "Cold goo from the %spell trickles down over your %Tbreasts!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = "Slitherstrike",
					text_receiver = "Cold goo from the %spell trickles down into your %Tundies!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("targetWearsUnderwear")
					},
					fn = Func.get("addExcitement")
				}))
				

			-- Ground spike
				table.insert(R, RPText:new({
					id = getsk("groundSpike"),
					text_bystander = "%spell prods up between %T's buttcheeks, striking a glancing blow!",
					text_receiver = "%spell prods up between your buttcheeks, tickling your behind!",
					sound = 48922,
					requirements = {
						getCondition("spellTick")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("groundSpike"),
					text_bystander = "%spell lands a glancing blow between %T's legs, smacking %This %Tbulge around!",
					text_receiver = "%spell lands a glancing blow between your legs, smacking your %Tbulge around!",
					sound = 48922,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimPenis")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("groundSpike"),
					text_bystander = "%spell lands a glancing blow between %T's legs, firmly prodding up against %This %Tgroin!",
					text_receiver = "%spell lands a glancing blow between your legs, firmly prodding up against your %Tgroin!",
					sound = 48922,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimVagina")
					},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Magic whips
				table.insert(R, RPText:new({
					id = getsk("magicWhip"),
					text_bystander = "%S's %spell lashes across %T's %Tbutt!",
					text_receiver = "%S's %spell lashes across your %Tbutt!",
					sound = 75769,
					requirements = {
						getCondition("spellTick")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("magicWhip"),
					text_bystander = "%S's %spell lashes across %T's %Tgroin!",
					text_receiver = "%S's %spell lashes across your %Tgroin!",
					sound = 75769,
					requirements = {
						getCondition("spellTick")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("magicWhip"),
					text_bystander = "%S's %spell lashes across both of %T's %Tbreasts!",
					text_receiver = "%S's %spell lashes across both of your %Tbreasts!",
					sound = 75769,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("magicWhip"),
					text_bystander = "%S's %spell lashes across %T's %leftright %Tbreast!",
					text_receiver = "%S's %spell lashes across your %leftright %Tbreast!",
					sound = 75769,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Shield bash
				table.insert(R, RPText:new({
					id = "Shield Bash",
					text_bystander = "%S's %spell slams against %T's %Tbreasts!",
					text_receiver = "%S's %spell slams against your %Tbreasts!",
					--sound = 35103,
					requirements = {
						getCondition("spellTick"),
						getCondition("victimBreasts")
					},
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Spillable
				table.insert(R, RPText:new({
					id = getsk("spillable"),
					text_bystander = "%spell spills onto %T's %Tbreasts!",
					text_receiver = "Some of the %spell spills onto your %Tbreasts!",
					sound = 1059,
					requirements = {getCondition("spellTick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = getsk("spillable_add"),
					text_bystander = "%spell spills onto %T's %Tbreasts!",
					text_receiver = "Some of the %spell spills onto your %Tbreasts!",
					sound = 1059,
					requirements = {getCondition("spellAdd"), getCondition("victimBreasts")},
					fn = Func.get("addExcitement")
				}))

			-- Bone toss
				table.insert(R, RPText:new({
					id = "Bone Toss",
					text_bystander = "%S's %spell hits %T right between %This legs!",
					text_receiver = "%S's %spell hit you right between the legs!",
					sound = 78936,
					requirements = {},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bone Toss",
					text_bystander = "%S's %spell hits %T's %leftright %Tbreast!",
					text_receiver = "%S's %spell hits your %leftright %Tbreast!",
					sound = 78936,
					requirements = {getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Slosh
				table.insert(R, RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell trickles down between your %Tbreasts!",
					requirements = {getCondition("victimBreasts")},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell pours into your %Tundies!",
					requirements = {getCondition("targetWearsUnderwear")},
					fn = Func.get("addExcitement")
				}))
				table.insert(R, RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell seeps into your clothes.",
					requirements = {}
				}))

			-- Small Shards
				table.insert(R, RPText:new({
					id = getsk("shards"),
					text_receiver = "A pulsating crystal shard tumbles into your clothes, coming to a rest between your %Tbreasts!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = function()
						Func.get("addExcitement")();
						DoEmote("LAUGH", "player");
						Effect.run("debuffShardTickleBreasts");
					end
				}))
				table.insert(R, RPText:new({
					id = getsk("shards"),
					text_receiver = "A pulsating crystal shard tumbles into your %Tundies, tickling your %Tgenitals!",
					requirements = {spellAddOrTick, getCondition("targetWearsUnderwear")},
					fn = function()
						DoEmote("LAUGH", "player");
						Func.get("addExcitement")();
						Effect.run("debuffShardTickleGroin")
					end
				}))
				table.insert(R, RPText:new({
					id = getsk("shards"),
					text_receiver = "A crystal shard tumbles down your buttcrack, tickling your %Tbutt!",
					requirements = {spellAddOrTick},
					fn = function()
						DoEmote("LAUGH", "player");
						Func.get("addExcitement")();
						Effect.run("debuffShardTickleButt")
					end
				}))
			
			-- Bop barrage
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops %T's %leftright %Tbreast!",
					text_receiver = "%S bops your %leftright %Tbreast!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops both %T's %Tbreasts!",
					text_receiver = "%S bops both your %Tbreasts!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bop Barrage",
					text_bystander = "%S bops %T's bulge!",
					text_receiver = "%S bops your bulge!",
					requirements = {spellAddOrTick, getCondition("targetWearsUnderwear"), getCondition("victimPenis")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Big Bop",
					text_bystander = "%S bops %T's %Tbreasts with enough force to knock %Thim down!",
					text_receiver = "%S bops your %Tbreasts with enough force to knock you down!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = "Big Bop",
					text_bystander = "%S bops %T's bulge with enough force to knock %Thim to the ground!",
					text_receiver = "%S bops your bulge with enough force to knock you to the ground!",
					requirements = {spellAddOrTick, getCondition("targetWearsUnderwear"), getCondition("victimPenis")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				
			-- Dancing thorns
				table.insert(R, RPText:new({
					id = "Dancing Thorns",
					text_receiver = "A dancing thorn pricks your %leftright %Tbreast!",
					requirements = {spellAddOrTick, getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Dancing Thorns",
					text_receiver = "A dancing thorn pricks your %Tbutt!",
					requirements = {spellAddOrTick},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Insect swarm
				table.insert(R, RPText:new({
					id = getsk("insects"),
					text_receiver = "An insect gets into your chestpiece and bites your %leftright nipple!",
					--sound = 35103,
					requirements = {getCondition("spellTick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = getsk("insects"),
					text_receiver = "An insect gets into your pants and bites your %Tpenis!",
					--sound = 35103,
					requirements = {getCondition("spellTick"), getCondition("victimPenis")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				table.insert(R, RPText:new({
					id = getsk("insects"),
					text_receiver = "An insect gets into your chestpiece and skitters across your %Tvagina!",
					--sound = 35103,
					requirements = {getCondition("spellTick"), getCondition("victimVagina")},
					fn = Func.get("addExcitement")
				}))

			-- Bonk
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks %T's %leftright %Tbreast!",
					text_receiver = "%S bonks your %leftright %Tbreast!",
					sound = 33927,
					requirements = {getCondition("victimBreasts"), getCondition("spellAdd")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks across both of %T's %Tbreasts!",
					text_receiver = "%S bonks across both of your %Tbreasts!",
					sound = 33927,
					requirements = {getCondition("victimBreasts"), getCondition("spellAdd")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))
				
				table.insert(R, RPText:new({
					id = "Bonk",
					text_bystander = "%S bonks %T's %Tgroin!",
					text_receiver = "%S bonks your %Tgroin!",
					sound = 33927,
					requirements = {getCondition("spellAdd")},
					fn = Func.get("addExcitementMasochisticCrit")
				}))

			-- Shoot
				table.insert(R, RPText:new({
					id = "Shoot",
					text_receiver = "%S's projectile bounces off your chestplate!",
					sound = 57073,
					requirements = {getCondition("spellTick"), getCondition("chestPlate"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Shoot",
					text_receiver = "%S shot bounces off your crotchplate!",
					sound = 57073,
					requirements = {getCondition("spellTick"), getCondition("crotchPlate")},
					fn = Func.get("addExcitementMasochistic")
				}))

			-- Lash of pain
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %leftright %Tbreast!",
					text_receiver = "%S's whip cracks across your %leftright %Tbreast!",
					sound = 3338,
					requirements = {getCondition("spellTick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %Tbreasts!",
					text_receiver = "%S's whip cracks across your %Tbreasts!",
					sound = 3338,
					requirements = {getCondition("spellTick"), getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}))
				table.insert(R, RPText:new({
					id = "Lash of Pain",
					text_bystander = "%S's whip cracks across %T's %Tgroin!",
					text_receiver = "%S's whip cracks across your %Tgroin!",
					sound = 3338,
					requirements = {getCondition("spellTick")},
					fn = Func.get("addExcitementMasochistic")
				}))


			-- Daglop
				table.insert(R, RPText:new({
					id = "DAGLOP_NIPPLE_TWIST",
					text_bystander = "Daglop reaches into %T's chestpiece and twists %This nipples!",
					text_receiver = "Daglop reaches into your chestpiece and twists your nipples!",
					sound = 25626,
					requirements = {},
					fn = Func.get("addExcitementMasochisticCrit")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_NIPPLE_TWIST_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Work harder, minion!",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_WEDIGE",
					text_bystander = "Daglop grabs a hold of %T's %Tundies from behind, giving %Thim a wedgie!",
					text_receiver = "Daglop grabs a hold of the back of your %Tundies, giving you a wedgie!",
					sound = 25626,
					requirements = {getCondition("targetWearsUnderwear")},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_WEDIGE_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Huh, interesting choice in underwear!",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK",
					text_bystander = "Daglop kicks %T's %Tbutt!",
					text_receiver = "Daglop kicks you in the %Tbutt!",
					sound = 31941,
					requirements = {},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Get to it, chop chop!",
					requirements = {}
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BUTTKICK_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Big butts are bound to be beaten for motivation!",
					requirements = {getCondition("largeButt")}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB",
					text_bystander = "Daglop grabs a hold of and squeezes %T's %Tbreasts!",
					text_receiver = "Daglop grabs a hold of and squeezes your %Tbreasts!",
					sound = 25626,
					requirements = {getCondition("victimBreasts")},
					fn = Func.get("addExcitementMasochistic")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Oh sorry, I was er... slipping...",
					requirements = {}
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_BOOB_GRAB_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Why don't I hold onto these big things so you don't get back problems?",
					requirements = {getCondition("largeBreasts")}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_MOUTH_FINGER",
					text_bystander = "Daglop forces a finger into %T's mouth!",
					text_receiver = "Daglop forces a finger into your mouth!",
					sound = 3541,
					requirements = {},
					fn = Func.get("addExcitement")
				}));
				table.insert(R, RPText:new({
					id = "DAGLOP_MOUTH_FINGER_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Just making sure my minion is in good health.",
					requirements = {}
				}));

				table.insert(R, RPText:new({
					id = "DAGLOP_RITUAL_TEXT",
					is_chat = true,
					sound = 770,
					text_bystander = true,
					text_receiver = "Daglop: Partake in a ritual some time! I could strap you to an altar, remove your %Tundies and you know...",
					requirements = {}
				}));

			-- Shattering song
				table.insert(R, RPText:new({
					id = "Shattering Song",
					text_receiver = "The shattering song causes your equipment to vibrate heavily!",
					fn = Func.get("addExcitement"),
					requirements = {}
				}));

				
		-- DRUID --

			-- Entangling Roots
			table.insert(R, RPText:new({
				id = getsk("roots"),
				text_bystander = "A vine from %S's roots slips inside %T's clothes and starts tickling against %This %Tbutt!",
				text_receiver = "A vine from the roots slips inside your clothes and starts tickling your %Tbutt!",
				sound = 48289,
				requirements = {getCondition("spellAdd")},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = Func.get("addExcitement")
			}))
			table.insert(R, RPText:new({
				id = getsk("roots"),
				text_bystander = "A vine from %S's roots slips inside %T's clothes and squeezes %This %Tpenis!",
				text_receiver = "A vine from the roots slips inside your clothes and squeezes your %Tpenis!",
				sound = 48289,
				requirements = {getCondition("spellAdd"), getCondition("victimPenis")},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = Func.get("addExcitement")
			}))
			table.insert(R, RPText:new({
				id = getsk("roots"),
				text_bystander = "A vine from %S's roots slips inside %T's clothes and up inside %This %Tvagina where it wiggles about!",
				text_receiver = "A vine from the roots slips inside your clothes and up inside your %Tvagina where it wiggles about!",
				sound = 48289,
				requirements = {getCondition("spellAdd"), getCondition("victimVagina")},
				fn = Func.get("addExcitementCrit")
			}))
			table.insert(R, RPText:new({
				id = getsk("roots"),
				text_bystander = "A vine from %S's roots slips inside %T's clothes and wraps around %This %Tbreasts, squeezing them rigorously!",
				text_receiver = "A vine from the roots slips inside your clothes and wraps around your %Tbreasts, squeezing them rigorously!",
				sound = 48289,
				requirements = {getCondition("spellAdd"), getCondition("victimBreasts")},
				fn = Func.get("addExcitementMasochisticCrit")
			}))
	--


-- CUSTOM TICKING BUFFS/DEBUFFS
	-- Living goo
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesAdd",
			text_receiver = "The goo in your outfit comes to life!",
			sound = 73580,
			requirements = {},
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesFade",
			text_receiver = "The living goo expires!",
			--sound = 73580,
			requirements = {},
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesRem",
			text_receiver = "You forcefully remove the living goo from your clothes!",
			sound = 73580,
			requirements = {},
		}))

		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tbutt!",
			sound = 48289,
			requirements = {},
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tvagina!",
			sound = 48289,
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %Tpenis!",
			sound = 48289,
			requirements = {getCondition("victimPenis")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your clit!",
			sound = 48289,
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo tickles your %leftright nipple!",
			sound = 48289,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitement")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo wraps around your %Tbreasts, squeezing both!",
			sound = 18711,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochistic")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo wraps around your nipples, pulling your %Tbreasts together!",
			sound = 18711,
			requirements = {getCondition("victimBreasts")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementMasochisticCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo prods inside your %Tvagina, swirling a tendril around!",
			sound = 21727,
			requirements = {getCondition("victimVagina")},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))
		table.insert(R, RPText:new({
			id = "FX_OozeInClothesTick",
			text_receiver = "The living goo prods inside your %Tbutt, swirling a tendril around!",
			sound = 21727,
			requirements = {},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = Func.get("addExcitementCrit")
		}))

	--
--

-- Voice chats
	
	-- Feltotem bull
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Soon you'll be choking on my fel empowered bull cock!",
			requirements = {
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Ever had fel infused bull dick shoved in your %Tvagina? You'll soon find out what that feels like!",
			requirements = {
				getCondition("victimVagina"),
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Ever had fel infused bull dick shoved in your %Tbutt? You'll soon find out what that feels like!",
			requirements = {
				getCondition("victimPenis"),
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Why don't skip directly to the point where I pin you to the ground and pound your %Tbutt relentlessy?",
			requirements = {
				getCondition("victimPenis"),
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Why don't skip directly to the point where I pin you to the ground and pound your %Tvagina relentlessy?",
			requirements = {
				getCondition("victimVagina"),
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: Nice %Tbreasts. Can't wait to stick my fel empowered %Spenis between them!",
			requirements = {
				getCondition("victimBreasts"),
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		table.insert(R, RPText:new({
			id = "_WHISPER_",
			is_chat = true,
			sound = 48315,
			text_receiver = "%S whispers: I will have my way with you before handing you to my demon masters!",
			requirements = {
				getCondition("attackerIsFeltotemMale"),
				getCondition("maleWhispers"),					-- User allows whispers from male
			},
		}))
		



	return R;
end