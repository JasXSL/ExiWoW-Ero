local aName, aTable = ...;
aTable.rpTexts = function(self)

	local R = {};
	local req = ExiWoW.RPText.Req;	-- RPText requirement constructor
	local ty = req.Types;			-- Local filter types
	
	-- Shortcuts for the templates library
	-- It's recommended to use templates if one is available, you can also use lib_Assets to extend the templates library
	local assetLib = ExiWoW.LibAssets;
	local spellKits = assetLib.kits;		-- RP Text spell kits library
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

	-- TICKLE --
			-- Tickle target
			table.insert(R, ExiWoW.RPText:new({
				id = "TICKLE",
				text_sender = "You tickle %T between %This legs!",
				text_receiver = "%T tickles you between your legs!",
				requirements = {},
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "TICKLE",
				text_sender = "You tickle %T between %This legs with your %item!",
				text_receiver = "%S tickles your %Tgroin with %Shis %item!",
				requirements = {rtc.invFeathers},
			}))

			-- Tickle self
			table.insert(R, ExiWoW.RPText:new({
				id = "TICKLE",
				text_receiver = "You tickle your own %Tgroin with a %item!",
				requirements = {rtc.invFeathers},
				--fn = ef.addExcitementMasochisticDefault
			}))

	-- Throw sand --
		table.insert(R, ExiWoW.RPText:new({
			id = "THROW_SAND",
			text_sender = "You throw a handful of sand at %T, the majority of which falls into %This cleavage!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which falls into your cleavage!",
			sound = 907,
			requirements = {rtc.victimBreasts},
			--fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "THROW_SAND",
			text_sender = "You throw a handful of sand at %T, the majority of which gets into %This %Tundies!", 
			text_receiver = "%S throws a handful of sand at you, the majority of which gets into your %Tundies!",
			sound = 907,
			requirements = {rtc.targetWearsUnderwear},
			--fn = ef.addExcitementMasochisticDefault
		}))

		-- Self
		table.insert(R, ExiWoW.RPText:new({
			id = "THROW_SAND",
			text_receiver = "You let a trickle of sand fall down your cleavage!",
			sound = 73172,
			requirements = {rtc.victimBreasts},
			--fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "THROW_SAND",
			text_receiver = "You stretch out your waistline and pour some sand into your %Tundies!",
			sound = 73172,
			requirements = {rtc.targetWearsUnderwear},
			--fn = ef.addExcitementMasochisticDefault
		}))


	-- Claw pinch --
		table.insert(R, ExiWoW.RPText:new({
			id = "CLAW_PINCH",
			text_sender = "You pinch %T's %Tbutt with your big claw!",
			text_receiver = "%S pinches your %Tbutt with %Shis big claw!",
			sound = 36721,
			requirements = {},
			--fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "CLAW_PINCH",
			text_sender = "You pinch %T's %Tgroin with your big claw!",
			text_receiver = "%S pinches your %Tgroin with %Shis big claw!",
			sound = 36721,
			requirements = {},
			--fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "CLAW_PINCH",
			text_sender = "You pinch %T's nipple with your big claw!",
			text_receiver = "%S pinches your nipple with %Shis big claw!",
			sound = 36721,
			requirements = {rtc.victimBreasts},
			--fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "CLAW_PINCH",
			text_receiver = "You pinch your %Tbutt with your big claw!",
			sound = 36721,
			requirements = {},
			--fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "CLAW_PINCH",
			text_receiver = "You pinch your %leftright nipple with your big claw!",
			sound = 36721,
			requirements = {rtc.victimBreasts},
			--fn = ef.addExcitementMasochisticDefault
		}))


	-- Goblin buzzrocket
		table.insert(R, ExiWoW.RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_receiver = "You push the vibrational rocket into your %Tvagina and hit the ingition!",
			requirements = {rtc.victimVagina}
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_receiver = "You stick the vibrational rocket between your %Tbreasts and hit the ingition!",
			requirements = {rtc.victimBreasts}
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_receiver = "You push the vibrational rocket against your %Tgroin and hit the ingition!",
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "GOBLIN_BUZZROCKET",
			text_receiver = "You push the vibrational rocket into your %Tbutt and hit the ingition!",
		}))
		

	-- Jade Rod
		table.insert(R, ExiWoW.RPText:new({
			id = "JADE_ROD",
			text_receiver = "You push the vibrational rocket into your %Tvagina where it starts pleasantly pulsating!",
			requirements = {rtc.victimVagina}
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "JADE_ROD",
			text_receiver = "You stick the vibrational rocket between your %Tbreasts where it starts pleasantly pulsating!",
			requirements = {rtc.victimBreasts}
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "JADE_ROD",
			text_receiver = "You push the vibrational rocket against your %Tgroin where it starts pleasantly pulsating!",
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "JADE_ROD",
			text_receiver = "You push the vibrational rocket into your %Tbutt where it starts pleasantly pulsating!",
		}))
		



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

	-- Pinchers --
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S pinches your %leftright nipple!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S pinches your %leftright %Tbreast!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S pinches your %Tgroin!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S clamps down hard on your %Tgroin!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy, rtc.victimPenis},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S clamps down hard and tugs at both your nipples!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S clamps down hard on your %leftright nipple, twisting it in the process!",
			--sound = 57787,
			requirements = {rtc.attackerIsPinchy, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))


	-- Wasps
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S's stinger tickles between your legs!",
			--sound = 57787,
			requirements = {rtc.attackerIsWasp, rtc.rand50},
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
	
	-- Lashing NPCs
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S lashes your %Tgroin!",
			sound = 3338,
			requirements = {rtc.attackerIsLasher},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S lashes your %leftright %Tbreast!",
			sound = 3338,
			requirements = {rtc.attackerIsLasher, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {rtc.attackerIsLasher},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S slips a vine between your legs, tickling your %Tgroin!",
			sound = 21727,
			requirements = {rtc.attackerIsVines},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "A vine slips across your %Tbreasts, tickling your nipples!",
			sound = 21727,
			requirements = {rtc.attackerIsVines, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S lashes across both your %Tbreasts!",
			sound = 3338,
			requirements = {rtc.attackerIsLasher, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S envelops your package with a vine, squeezing hard!",
			sound = 25626,
			requirements = {rtc.attackerIsVines, rtc.victimPenis},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S envelops your %Tbreasts with vines, squeezing hard!",
			sound = 25626,
			requirements = {rtc.attackerIsVines, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S lashes vines around your nipples and tugs back!",
			sound = 25626,
			requirements = {rtc.attackerIsVines, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING_CRIT",
			text_receiver = "%S pushes a vine up between your legs, rigorously rubbing your clit through your clothes!",
			sound = 21727,
			requirements = {rtc.attackerIsVines, rtc.victimVagina},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "%S takes advantage of you being knocked down and lashes hard across your %Tgroin!",
			sound = 3338,
			requirements = {rtc.attackerIsVines, rtc.victimKnockedDown},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementMasochisticCrit
		}))

	-- Ooze NPCs
		table.insert(R, ExiWoW.RPText:new({
			id = "SWING",
			text_receiver = "Some ooze trickles into your cleavage.",
			--sound = 3338,
			requirements = {rtc.attackerIsOoze, rtc.victimBreasts},
			-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
			fn = ef.addExcitementDefault
		}))

-- SPELLS --

		-- GENERIC / NPC --

			-- Ice spells
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("ice", "ice_common"),
					text_receiver = "The cold spell causes your nipples to harden!",
					--sound = 48289,
					requirements = {rtc.spellAddOrTick, rtc.victimBreasts},
					fn = ef.addExcitementMasochisticDefault
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
					fn = ef.addExcitementMasochisticDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("electric"),
					text_receiver = "The %spell painfully shocks your %Tbreasts!",
					sound = 35286,
					requirements = {
						rtc.spellAddOrTick,  -- OR
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticDefault
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
					id = "Uppercut",
					text_receiver = "%S uppercuts your %Tbreasts with enough force to knock you back!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticCrit
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = "Uppercut",
					text_receiver = "%S uppercuts your %leftright %Tbreast, jiggling it around heavily as you stagger backwards!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticCrit
				}))

			-- Shield bash
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("shield_bash"),
					text_receiver = "%S' shield slams across your %Tbreasts!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticDefault
				}))

			-- Headbutt
				table.insert(R, ExiWoW.RPText:new({
					id = "Headbutt",
					text_receiver = "%S headbutts straight into your %Tbreasts!",
					--sound = 35103,
					requirements = {
						rtc.spellTick,
						rtc.victimBreasts
					},
					fn = ef.addExcitementMasochisticCrit
				}))

			-- Shield bash
				table.insert(R, ExiWoW.RPText:new({
					id = "Shield Bash",
					text_receiver = "%S's %spell slams against your %Tbreasts!",
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

			-- Bone toss
				table.insert(R, ExiWoW.RPText:new({
					id = "Bone Toss",
					text_receiver = "%S's %spell hit you right between the legs!",
					sound = 78936,
					requirements = {},
					fn = ef.addExcitementMasochisticDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = "Bone Toss",
					text_receiver = "%S's %spell hits your %leftright %Tbreast!",
					sound = 78936,
					requirements = {rtc.victimBreasts},
					fn = ef.addExcitementMasochisticDefault
				}))

			-- Slosh
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell trickles down between your %Tbreasts!",
					requirements = {rtc.victimBreasts},
					fn = ef.addExcitementDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell pours into your %Tundies!",
					requirements = {rtc.targetWearsUnderwear},
					fn = ef.addExcitementDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("slosh"),
					text_receiver = "Liquid from the %spell seeps into your clothes.",
					requirements = {}
				}))


			-- Insect swarm
				table.insert(R, ExiWoW.RPText:new({
					id = getsk("insects"),
					text_receiver = "An insect gets into your chestpiece and bites your %leftright nipple!",
					--sound = 35103,
					requirements = {rtc.spellTick, rtc.victimBreasts},
					fn = ef.addExcitementMasochisticDefault
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

			-- Bonk
				table.insert(R, ExiWoW.RPText:new({
					id = "Bonk",
					text_receiver = "%S bonks your %leftright %Tbreast!",
					sound = 33927,
					requirements = {rtc.victimBreasts, rtc.spellAdd},
					fn = ef.addExcitementMasochisticDefault
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = "Bonk",
					text_receiver = "%S bonks across both of your %Tbreasts!",
					sound = 33927,
					requirements = {rtc.victimBreasts, rtc.spellAdd},
					fn = ef.addExcitementMasochisticCrit
				}))
				
				table.insert(R, ExiWoW.RPText:new({
					id = "Bonk",
					text_receiver = "%S bonks your %Tgroin!",
					sound = 33927,
					requirements = {rtc.spellAdd},
					fn = ef.addExcitementMasochisticCrit
				}))

			-- Shoot
				table.insert(R, ExiWoW.RPText:new({
					id = "Shoot",
					text_receiver = "%S's projectile bounces off your chestplate!",
					sound = 57073,
					requirements = {rtc.spellTick, rtc.chestPlate, rtc.victimBreasts},
					fn = ef.addExcitementMasochistic
				}))
				table.insert(R, ExiWoW.RPText:new({
					id = "Shoot",
					text_receiver = "%S shot bounces off your crotchplate!",
					sound = 57073,
					requirements = {rtc.spellTick, rtc.crotchPlate},
					fn = ef.addExcitementMasochistic
				}))

		-- DRUID --

			-- Entangling Roots
			table.insert(R, ExiWoW.RPText:new({
				id = "Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and starts tickling your %Tbutt!",
				sound = 48289,
				requirements = {rtc.spellAdd},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = ef.addExcitementDefault
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and squeezes your %Tpenis!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimPenis},
				-- FN is currently only supported for NPC actions. PC->PC actions should use the Action system instead
				fn = ef.addExcitementDefault
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and up inside your %Tvagina where it wiggles about!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimVagina},
				fn = ef.addExcitementCrit
			}))
			table.insert(R, ExiWoW.RPText:new({
				id = "Entangling Roots",
				text_receiver = "A vine from the roots slips inside your clothes and wrap around your %Tbreasts, squeezing them rigorously!",
				sound = 48289,
				requirements = {rtc.spellAdd, rtc.victimBreasts},
				fn = ef.addExcitementMasochisticDefault
			}))
			


		

		


	return R;
end