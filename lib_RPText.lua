local aName, aTable = ...;
aTable.rpTexts = function(self)

	local R = {};

	-- Shortcuts for the templates library
	-- It's recommended to use templates if one is available, you can also use lib_Assets to extend the templates library
	local assetLib = ExiWoW.LibAssets;
	local spellKits = assetLib.spell_kits;		-- RP Text spell kits library
	local rtc = ExiWoW.LibAssets.rpTextConds;	-- RP Text conditions
	local ef = ExiWoW.LibAssets.effects;		-- RP Text effects library
	-- Gets a spell kit condition formated for RP texts
	local getsk = assetLib.spellKitToRP
	

-- ACTIONS
	-- Fondle --
	-- You can set text_sender to nil to set self_cast_only to true

		-- TARGET --

			-- Fondle breasts target
			table.insert(R, ExiWoW.RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tbreasts!",
				text_receiver = "%S grabs a hold of and rubs your %Tbreasts!",
				sound = 57179,
				requirements = {rtc.victimBreasts}
			}))

			-- Fondle groin target
			table.insert(R, ExiWoW.RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tgroin!",
				text_receiver = "%S grabs a hold of and rubs your %Tgroin!",
				sound = 57179,
				requirements = {}
			}))

			-- Fondle butt target
			table.insert(R, ExiWoW.RPText:new({
				id = "FONDLE",
				text_sender = "You grab a hold of and rub %T's %Tbutt!",
				text_receiver = "%S grabs a hold of and rubs your %Tbutt!",
				sound = 57179,
				requirements = {}
			}))

		-- SELF --
			table.insert(R, ExiWoW.RPText:new({
				id = "FONDLE",
				text_receiver = "You rub your own %Tgroin!",
				sound = 57179,
				requirements = {}
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "FONDLE",
				text_receiver = "You rub your %Tbreasts!",
				sound = 57179,
				requirements = { rtc.victimBreasts }
			}))
		--




-- MELEE SWINGS --
	-- HUMANOIDISH (crits) --

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S's attacks smacks against your %leftright %Tbreast!",
			sound = 37472,
			requirements = {rtc.attackerHumanoidish, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))


		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S's attack smacks painfully across your %Tgroin!",
			sound = 37472,
			requirements = {rtc.attackerHumanoidish},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S throws a cheap shot at your %Tgroin!",
			sound = 37472,
			requirements = {rtc.attackerHumanoidish},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S's attack smacks painfully across your %Tbreasts!",
			sound = 37472,
			requirements = {rtc.attackerHumanoidish, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))


	-- Tentacle fiends (like the one in the draenei start area)
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S slips a tentacle into your clothes, tickling your %Tgroin!",
			sound = 21727,
			requirements = {rtc.attackerIsTentacleFiend},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S slips a tentacle into your clothes, tickling between your %Trtag buttcheeks!",
			sound = 21727,
			requirements = {rtc.attackerIsTentacleFiend},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S slips a tentacle into your clothes, slipping it up into your %Tvagina and wiggling it around!",
			sound = 21727,
			requirements = {rtc.attackerIsTentacleFiend, rtc.victimVagina},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementCrit
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S slips a tentacle into your clothes, hooping it around your nipples and tugs!",
			sound = 21729,
			requirements = {rtc.attackerIsTentacleFiend, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S slips a tentacle up between your legs, tickling your %Tgroin!",
			sound = 21727,
			requirements = {rtc.attackerIsTentacleFiend},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))
	--

-- SPELLS --

		-- GENERIC / NPC --

			-- Ice spells
			table.insert(R, ExiWoW.RPText:new({
				id = getsk("ice", "ice_common"),
				text_receiver = "The cold spell causes your nipples to harden!",
				--sound = 48289,
				requirements = {rtc.spellAddOrTick, rtc.victimBreasts},
				fn = ef.addExcitementPain
			}))

			-- Lightning
				
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("electric", "electric_common"),
					text_receiver = "The %spell shocks your nipples!",
					sound = 35286,
					requirements = {
						rtc.spellAddOrTick,  -- OR
						rtc.victimBreasts
					},
					fn = ef.addExcitementPain
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("electric"),
					text_receiver = "The %spell painfully shocks your %Tbreasts!",
					sound = 35286,
					requirements = {
						rtc.spellAddOrTick,  -- OR
						rtc.victimBreasts
					},
					fn = ef.addExcitementPain
				}))


			-- Basilisk stares
				
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("basilisk"),
					text_receiver = "The %spell causes your nipples to %harden!",
					--sound = 35103,
					requirements = {
						rtc.spellAdd,
						rtc.victimBreasts
					},
					fn = ef.addExcitementDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("basilisk"),
					text_receiver = "The %spell causes your %Tpenis to %harden!",
					--sound = 35103,
					requirements = {
						rtc.spellAdd,
						rtc.victimPenis
					},
					fn = ef.addExcitementDefault
				}))

			-- Uppercut
				table.insert(R, ExiWoW.RPText:new({
					id = "SPELL_Uppercut",
					text_receiver = "%S uppercuts your %Tbreasts with enough force to knock you back!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticCrit
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = "SPELL_Uppercut",
					text_receiver = "%S uppercuts your %leftright %Tbreast, jiggling it around heavily as you stagger backwards!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticCrit
				}))

			-- Spillable
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("spillable"),
					text_receiver = "Some of the %spell spills onto your %Tbreasts!",
					sound = 1059,
					requirements = {rtc.spellTick, rtc.victimBreasts},
					fn = ef.addExcitementDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("spillable_add"),
					text_receiver = "Some of the %spell spills onto your %Tbreasts!",
					sound = 1059,
					requirements = {rtc.spellAdd, rtc.victimBreasts},
					fn = ef.addExcitementDefault
				}))

			-- Insect swarm
			table.insert(R, ExiWoW.RPText:new({
				id = getsk("insects"),
				text_receiver = "An insect gets into your chestpiece and bites your %leftright nipple!",
				--sound = 35103,
				requirements = {rtc.spellTick, rtc.victimBreasts},
				fn = ef.addExcitementMasochistic
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = getsk("insects"),
				text_receiver = "An insect gets into your pants and bites your %Tpenis!",
				--sound = 35103,
				requirements = {rtc.spellTick, rtc.victimPenis},
				fn = ef.addExcitementMasochisticCrit
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = getsk("insects"),
				text_receiver = "An insect gets into your chestpiece and skitters across your %Tvagina!",
				--sound = 35103,
				requirements = {rtc.spellTick, rtc.victimVagina},
				fn = ef.addExcitementDefault
			}))




		-- DRUID --

			-- Entangling Roots
			table.insert(R, ExiWoW.RPText:new({
				id = "SPELL_Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and starts tickling your %Tbutt!",
				sound = 48289,
				requirements = {rtc.spellAdd},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = ef.addExcitement
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "SPELL_Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and squeezes your %Tpenis!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimPenis},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = ef.addExcitement
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "SPELL_Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and up inside your %Tvagina where it wiggles about!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimVagina},
				fn = ef.addExcitementCrit
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "SPELL_Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and wrap around your %Tbreasts, squeezing them rigorously!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimBreasts},
				fn = ef.addExcitementPain
			}))
			


		

		


	return R;
end