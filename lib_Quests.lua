local aName, aTable = ...;
local require = ExiWoW.require

aTable.quests = function(self)

	local Quest = require("Quest");
	local Objective = Quest.Objective;
	local Event = require("Event");
	local Reward = Quest.Reward;
	local Timer = require("Timer");
	local Character = require("Character");
	local RPText = require("RPText");
	local UI = require("UI");
	local Condition = require("Condition");
	local Talkbox = require("Talkbox");


	local out = {}

	-- Undervine 0
	table.insert(out, Quest:new({
		id = "UNDERVINE_0",
		name = "Vine Research",
		start_text = {
			"Ishnu alah, traveler. I need help with some research I'm doing.",
			"Life out here tends to get lonely, and I have been working on a way to spice things up a little.",
			"I have a spell to craft living vine underwear, but I'm severely lacking in living vines.",
			"That's where you come in. Interested?"
		},
		journal_entry = "Myria Glenbrook in Lightsong south east in Val'sharah is working on vine-based underwear but is lacking vines.\n\nI could go north to Moonrest and collect small vines from the Deathblossoms there.",
		end_journal = "Return to Myria Glenbrook in Lightsong",
		questgiver = 70971,
		end_text = {
			"These vines look a little dead, but it's a start.",
			function()
				PlaySound(23435, "SFX");
				return "[Myria fashions a makeshift thong from the vines]";
			end,
			"There you are, the next step will be to purify them."
		},
		rewards = {
			Reward:new({
				id = "WITHERED_VINE_THONG",
				type = "Underwear"
			})
		},
		objectives = {
			Objective:new({
				id = "vinesCollected",
				name = "Creeping Deathblossom Vines",
				num = 15,				-- Num of name to do to complete it
				onObjectiveEnable = function(self)
					self:on(Event.Types.MONSTER_KILL, function(data)
						if data.name == "Creeping Deathblossom" or data.name == "Mature Deathblossom" then
							PlaySound(1187, "SFX");
							self:add(1);
						end
					end);
				end,		-- Raised when objective is activated
				onObjectiveDisable = function(self)
				end	-- Raised when objective is completed or disabled
			}),		
		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Val'sharah", sub="Lightsong", x=60.18, y=84.83, dist=0.21},
				max = 1,
				fn = function(self, data)
					return true;
				end
			}
		},
		end_events = true
	}));


	-- Undervine 1
	table.insert(out, Quest:new({
		id = "UNDERVINE_1",
		name = "Pricks and Goo",
		start_text = {
			"We have the thong, but it's much too withered to animate.",
			"I know of a few reagents that will liven things up a little. Would you be willing to help some more?",
			"Lostlight Grotto just east of here has slimes that can lubricate the vines.",
			"Lunarwing Shallows to the west is home to Thistleleaf Thorndancers who throw enchanted Quill Barbs at you.",
			"For either of the reagents to work, they will have to make direct contact with the thong.",
			"The vines SHOULD protect you, but it might still sting. I have no doubts that one such as yourself can handle it!"
		},
		journal_entry = 
			"Myria Glenbrook in Lightsong south east in Val'sharah asked me to infuse the Withered Vine Thong with two reagents.\n\n"..
			"For it to work I must first take off my pants and wear the Withered Vine Thong."..
			"The first reagent is ooze from the slimes in Lostlight Grotto, just east of Lightsong. Simply killing the slimes should be enough to make them splatter across the thong.\n\n"..
			"The other reagent is quill barbs cast by the Thistleleaf Thorndancers further west and across the road. I should make sure I don't use any shields obstructing the quill barb's path.\n\n"
		,
		end_journal = "Return to Myria Glenbrook",
		questgiver = 70971,
		end_text = {
			function()
				local text = "Excellent! Just a moment.";
				if not GetInventoryItemID("player", 7) then
					text = text.." Feel free to put your leggings back on.";
				end
				return text;
			end,
			function()
				PlaySound(3331, "SFX");
				return "[Myria purifies your thong]";
			end,
			"A resounding success!"
		},
		rewards = {
			Reward:new({
				id = "EVERLIVING_VINE_THONG",
				type = "Underwear"
			})
		},
		onCompletion = function(self)
			if ExiWoW.ME:getUnderwear() and ExiWoW.ME:getUnderwear().id == "WITHERED_VINE_THONG" then
				ExiWoW.ME:useUnderwear("EVERLIVING_VINE_THONG");
			end
			ExiWoW.ME:removeUnderwear("WITHERED_VINE_THONG");
		end,
		objectives = {
			{
				Objective:new({
					id = "wearThong",
					name = "Withered Vine Thong Worn",
					num = 1,				-- Num of name to do to complete it
					onObjectiveEnable = function(self)
						self.timer = Timer.set(function()
							if ExiWoW.ME:getUnderwear() and ExiWoW.ME:getUnderwear().id == "WITHERED_VINE_THONG" then
								self:add(1);
							end
						end, 1, math.huge);
					end,		-- Raised when objective is activated
					onObjectiveDisable = function(self)
						if self.timer then Timer.clear(self.timer); end
					end	-- Raised when objective is completed or disabled
				}),	
				Objective:new({
					id = "removePants",
					name = "Pants unequipped",
					num = 1,				-- Num of name to do to complete it
					onObjectiveEnable = function(self)
						self.timer = Timer.set(function()
							if GetInventoryItemID("player", 7) == nil then
								self:add(1);
							end
						end, 1, math.huge);
					end,		-- Raised when objective is activated
					onObjectiveDisable = function(self)
						if self.timer then Timer.clear(self.timer); end
					end	-- Raised when objective is completed or disabled
				}),	
			},
			{
				Objective:new({
					id = "slimeInfusions",
					name = "Slime Infusions",
					num = 8,				-- Num of name to do to complete it
					onObjectiveEnable = function(self)
						self:on(Event.Types.MONSTER_KILL, function(data)
							if 
								data.name == "Undulating Boneslime" and 
								GetInventoryItemID("player", 7) == nil and 
								ExiWoW.ME:getUnderwear() and
								ExiWoW.ME:getUnderwear().id == "WITHERED_VINE_THONG"
							then
								RPText.trigger("BONESLIME_PROC", "none", "player", Character.buildNPC("none", "Undulating Boneslime"), ExiWoW.ME, nil, Event.Types.MONSTER_KILL);
								PlaySound(73080, "SFX");
								self:add(1);
							end
						end);
					end,		-- Raised when objective is activated
					onObjectiveDisable = function(self)
					end	-- Raised when objective is completed or disabled
				}),	
				Objective:new({
					id = "quillBarbInfusions",
					name = "Quill Barb Infusions",
					num = 3,				-- Num of name to do to complete it
					onObjectiveEnable = function(self)
						self:on(Event.Types.SPELL_TICK, function(data)
							if 
								data.aura and data.aura.name == "Quill Barb" and
								GetInventoryItemID("player", 7) == nil and 
								ExiWoW.ME:getUnderwear() and
								ExiWoW.ME:getUnderwear().id == "WITHERED_VINE_THONG"
							then
								RPText.trigger("QUILLBARB_PROC", data.unit, "player", Character.buildNPC(data.unit, data.name), ExiWoW.ME, nil, Event.Types.SPELL_TICK);
								PlaySound(75922, "SFX");
								self:add(1);
							end
						end);
					end,		-- Raised when objective is activated
					onObjectiveDisable = function(self)
					end	-- Raised when objective is completed or disabled
				}),		
			}
		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Val'sharah", sub="Lightsong", x=60.18, y=84.83, dist=0.21},
				fn = function(self, data)
					if Quest.isCompleted("UNDERVINE_0") then
						return true;
					end
				end
			}
		},
		end_events = true
	}));

	-- Undervine 2
	table.insert(out, Quest:new({
		id = "UNDERVINE_2",
		name = "Bear for Honey",
		start_text = {
			"While you were out I received a visit from a furbolg named Grizzleback.",
			"A big, warm man bear with soft fur, wearing only a loincloth to conceal his large...",
			"[Myria bites her lower lip]",
			"Do you think you could visit Elandris Bladesong and see if he has any honey to present as a gift?",
			"I'm sure if you help him defend his home, he'll let you have some. Then could you present it to Grizzleback and tell him it's from me?",
			"If all goes well, I'll let you keep the vine thong, and I'll even teach you a spell to make it wiggle pleasantly!"
		},
		journal_entry = 
			"Myria Glenbrook in Lightsong south east in Val'sharah asked me to visit Elandris Bladesong living above Grizzleweald north east of Lightsong.\n\n"..
			"I am to collect honey from him and present it to Old Grizzleback in Grizzleweald, as a gift from Myria."
		,
		end_journal = "Return to Myria Glenbrook",
		questgiver = 70971,
		end_text = {
			"He said he'll meet me? That's wonderful news! Now these woods won't be so lonely.",
			"Keep the thong, you've earned it! And take this spell, I won't be needing it anymore!"
		},
		rewards = {
			Reward:new({
				id = "VINE_SQUIRM",
				type = "Charges",
				quant = math.huge
			})
		},
		objectives = {
			Objective:new({
				id = "visitElandris",
				name = "Elandris Visited",
				num = 1,
				onObjectiveEnable = function(self)
					-- Success
					self:on(Event.Types.POINT_REACHED, function()
						if GetQuestsCompleted()[43176] then
							UI.talkbox.set(Talkbox:new({
								lines = {
									"I am in your debt. I have a jar of honey, it's around here... somewhere.",
									"Sorry I am afraid you will have to search my home for it."
								},
								displayInfo = 70942,
								title = "",
							}));
							self:add(1);
						end
					end, {zone="Val'sharah", sub="Bladesong's Retreat", x=67.43, y=69.42, dist=0.25});
				end,
				onObjectiveDisable = function(self)
				end
			}),	
			Objective:new({
				id = "findHoney",
				name = "Forage for Honey",
				num = 1,
				onObjectiveEnable = function(self)
					-- Success
					self:on(Event.Types.FORAGE, function()
						if math.random() < 0.75 then return false end
						if Condition.all({
							Condition:new({
								type = Condition.Types.RTYPE_LOC,
								data = {x=67.43, y=69.42, rad=0.25}
							}),
							Condition:new({
								type = Condition.Types.RTYPE_ZONE,
								data = "Val'sharah"
							}),
							Condition:new({
								type = Condition.Types.RTYPE_SUBZONE,
								data = "Bladesong's Retreat"
							}),
						}, "player", "player", ExiWoW.ME, ExiWoW.ME) then 
							PlaySound(1217, "SFX");
							UI.talkbox.set(Talkbox:new({
								lines = {
									"Ah you found it! Give Myria my regards!",
								},
								displayInfo = 70942,
								title = "",
							}));
							self:add(1);
						end
					end);
				end,
				onObjectiveDisable = function(self)
				end
			}),	
			Objective:new({
				id = "deliverHoney",
				name = "Deliver Honey to Grizzleback",
				num = 1,
				onObjectiveEnable = function(self)
					self:on(Event.Types.GOSSIP_SHOW, function()
						if UnitName("target") == "Old Grizzleback" then
							UI.talkbox.set(Talkbox:new({
								lines = {
									"She said she wanted to see me again AND brought me this honey?",
									"Of course! Do you think she could use some druidic rejuvenate magic on me? I may not be as limber anymore, but I bet I can still give her a good time.",
									"Tell her that I will be over as soon as we are done with these grells."
								},
								displayInfo = 62198,
								title = "",
								onComplete = function()
									self:add(1);
								end
							}));
						end
					end);
				end,
				onObjectiveDisable = function(self)
				end
			}),	
		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Val'sharah", sub="Lightsong", x=60.18, y=84.83, dist=0.21},
				fn = function(self, data)
					if Quest.isCompleted("UNDERVINE_1") then
						return true;
					end
				end
			}
		},
		end_events = true
	}));

	-- Undervine 3
	table.insert(out, Quest:new({
		id = "UNDERVINE_3",
		name = "Mischief, naturally!",
		start_text = {
			"Ooh, I sense someone with an interesting garment. Come over here by the gazebo for a moment!",
		},
		journal_entry = {
			"Azalea by the gazebo in Lorlathil wants to talk to you.",
			"She has offered to make your Everliving Vine Thong more spritely if you exact revenge on Callista Swiftglaive who is the armorsmith in Lorlathil.\n\n"..
				"To do so, you must go find dark tentacle powder that some of the Darkfiend Tormentors in Sleeper's Barrow to the south might be carrying. "..
				"Then hide it in the plate panties located somewhere in Callista's house, probably her drawer."
			,
		},
		end_journal = "Return to Azalea",
		questgiver = 13672,
		end_text = {
			"Ahaha! This is going to be so good. Next time she complains about muddy hooves I will be all like 'WOOSH!' and the tentacles will all come to life! Ehehe I can NOT wait to see the look on her face!",
			"Good job! Here is the spell if you too want to make some mischief!",
		},
		rewards = {
			Reward:new({
				id = "VINE_THRASH",
				type = "Charges",
				quant = math.huge
			})
		},
		objectives = {
			Objective:new({
				id = "talkToAzalea",
				name = "Talk to Azalea",
				num = 1,
				onObjectiveEnable = function(self)
					-- Success
					self:on(Event.Types.GOSSIP_SHOW, function()
						if UnitName("target") == "Azalea" then
							UI.talkbox.set(Talkbox:new({
								lines = {
									"That vine thong you're wearing. I have seen other adventurers with it, and I think it is time for some mischief.",
									"You may know how to make it squirm a little, but we can use some wild magic to REALLY make it go!",
									"I will teach you a spell if you help me play a little prank.",
									"Callista Swiftglaive, the armorsmith here in Lorlathil had the nerve to kick me out of her house JUST because my hooves were a little muddy.",
									"She is wearing that skimpy chestplace and I KNOW she has plate panties to go with them somewhere.",
									"Go to Sleeper's Barrow to the south where the satyr are summoning their tentacle fiends, hunt them until you find some tentacle powder.",
									"Go to Callista's shack and place the seed in her panties, my nature magic will take care of the rest."
								},
								displayInfo = 13672,
								title = "",
								onComplete = function()
									self:add(1);
								end
							}));
						end
					end);
				end,
				onObjectiveDisable = function(self)
				end
			}),	
			Objective:new({
				id = "darkTentaclePowder",
				name = "Dark Tentacle Powder Bag",
				num = 1,				-- Num of name to do to complete it
				onObjectiveEnable = function(self)
					self:on(Event.Types.MONSTER_KILL, function(data)
						if data.name == "Darkfiend Tormentor" and math.random() < 0.25 then
							PlaySound(1187, "1187");
							RPText.print("You found a small bag of dark tentacle powder on the satyr!");
							self:add(1);
						end
					end);
				end,		-- Raised when objective is activated
				onObjectiveDisable = function(self)
				end	-- Raised when objective is completed or disabled
			}),	
			Objective:new({
				id = "sprinklePowder",
				name = "Powder Sprinkled in Callista's Plate Panties",
				num = 1,				-- Num of name to do to complete it
				onObjectiveEnable = function(self)
					self:on(Event.Types.POINT_REACHED, function()
						if GetQuestsCompleted()[43176] then
							UI.talkbox.set(Talkbox:new({
								lines = {
									"This is the drawer holding Callista's plate panties.",
									function()
										DoEmote("KNEEL", "none");
										PlaySound(1277, "SFX");
										return "[You quickly sprinkle the powder into them and put them back]";
									end
								},
								onComplete = function()
									self:add(1);
								end,
								displayInfo = "player",
								title = "",
							}));
						end
					end, {zone="Val'sharah", sub="Lorlathil", x=54.42, y=71.89, dist=0.05});
				end,
				onObjectiveDisable = function(self)
				end
			}),	
		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Val'sharah", sub="Lorlathil"},
				fn = function(self, data)
					if Quest.isCompleted("UNDERVINE_2") then
						return true;
					end
				end
			}
		},
		end_events = {
			{
				event = Event.Types.GOSSIP_SHOW,
				fn = function(self, data)
					return UnitName("target") == "Azalea";
				end
			}
		}
	}));





	-- Highmountain 1
	table.insert(out, Quest:new({
		id = "HIGHMOUNTAIN_1",
		name = "For relaxation... obviously",
		start_text = {
			"Greetings traveler. I have received a task from Ebonhorn, but I need someone adventurous and on good standing with Mayla to help me.",
			"You see, with the Legion and everything going on here recently, Ebonhorn is worried that Mayla is getting too stressed. He wants me to craft a totem to help her... relax.",
			"There are two problems, but let us focus on the first. In order to make the totem, I need certain reagents. This is where you come in. I need three materials:",
			"A sturdy log from an ettin to the south.\nA charm of arousal from one of the Crawliac harpies.\nA Rumblerock from the drogbar in Rockcrawler Chasm.",
			"Want to help me help your friend?"
		},
		journal_entry = {
			"Slyhoof the Shameless Shaman near the eastern exist to Thunder Totem needs help crafting a totem of relaxation for Mayla. He needs 3 reagents to craft it.\n\n"..
				"1. A sturdy log from an ettin south of Thunder Totem.\n"..
				"2. A charm of arousal from any crawliac harpy in Highmountain.\n"..
				"3. A Rumblerock form the drogbar in Rockcrawler Chasm, north of Skyhorn."
		},
		end_journal = "Return to Slyhoof",
		questgiver = 66237,
		end_text = {
			"Excellent. I believe this should do the trick. There is only one small problem...",
		},
		rewards = {
			--[[
			Reward:new({
				id = "VINE_THRASH",
				type = "Charges",
				quant = math.huge
			})
			]]
		},
		objectives = {
			{
				Objective:new({
					id = "sturdyLog",
					name = "Sturdy Log",
					num = 1,
					onObjectiveEnable = function(self)
						self:on(Event.Types.MONSTER_KILL, function(data)
							if data.name:find("Hill Ettin") then
								PlaySound(1199, "SFX");
								RPText.print("You found a sturdy log on the ettin!");
								self:add(1);
							end
						end);
					end,
					onObjectiveDisable = function(self)
					end
				}),	
				Objective:new({
					id = "rumblerock",
					name = "Rumblerock",
					num = 1,
					onObjectiveEnable = function(self)
						self:on(Event.Types.MONSTER_KILL, function(data)
							if data.name:find("Deeprock ") and math.random() < 0.15 then
								PlaySound(1194, "SFX");
								RPText.print("You found a rumbling rock on the dead drogbar!");
								self:add(1);
							end
						end);
					end,
					onObjectiveDisable = function(self)
					end
				}),	
				Objective:new({
					id = "arousalCharm",
					name = "Charm of Arousal",
					num = 1,
					onObjectiveEnable = function(self)
						self:on(Event.Types.MONSTER_KILL, function(data)
							if data.name:find("Crawliac ") and math.random() < 0.15 then
								PlaySound(1204, "SFX");
								RPText.print("You find a sparkling charm on the harpy, this must be the Charm of Arousal!");
								self:add(1);
							end
						end);
					end,
					onObjectiveDisable = function(self)
					end
				}),	
			}
		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Thunder Totem", x=60.96, y=59.19, dist=1.86},
				fn = function(self, data)
					local comp = GetQuestsCompleted();
					if comp[39780] then
						return true;
					end
				end
			}
		},
		end_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Thunder Totem", x=60.96, y=59.19, dist=1.86},
				fn = function(self, data)
					return true;
				end
			}
		}
	}));

	table.insert(out, Quest:new({
		id = "HIGHMOUNTAIN_2",
		name = "Since You're Friends",
		start_text = {
			"I have made the Groin Rumble Totem, packs quite a punch too. Only problem is if I go down there and stick it between Mayla's legs, the guards will arrest me.",
			"You two are good friends though, so I don't think she'll mind.",
			"Let me know how it goes, and I might carve up a little something for you too."
		},
		journal_entry = {
			"Slyhoof the Shameless Shaman near the eastern exist to Thunder Totem wants you to use his Groin Rumble Totem on Mayla at the bottom of Thunder Totem."
		},
		end_journal = "Return to Slyhoof",
		questgiver = 66237,
		end_text = {
			Talkbox.Line:new({text = "Did she enjoy my handywork?", animation=65, animLength=1.8}),
			Talkbox.Line:new({text = "Excellent! I had enough reagents for an extra totem. Enjoy your reward!", animation=64, animLength=1.8})
		},
		rewards = {
			Reward:new({
				id = "GROIN_RUMBLE_TOTEM",
				type = "Charges",
				quant = math.huge
			})
		},
		objectives = {

			Objective:new({
				id = "totemUsed",
				name = "Totem Used on Mayla",
				num = 1,
				onObjectiveEnable = function(self)
					-- Success
					self:on(Event.Types.POINT_REACHED, function()

						UI.talkbox.set(Talkbox:new({
							lines = {
								Talkbox.Line:new({text = "What can I do for you, champion?\n\n[Push the totem between her legs]", animation = 65, animLength = 1.7}),
								Talkbox.Line:new({
									text = function()
										local _, snd = PlaySound(23269, "SFX");
										Timer.set(function()
											StopSound(snd, 2000);
										end, 1);
										return "\n\n\n      [Mayla gasps]"
									end, 
									animation = 64, 
									animLength = 1.7
								}),
								Talkbox.Line:new({text = "Well now. When Ebonhorn spoke about it, I never suspected such... intensity. Very well. Let them know I'll accept this gift.", animation=83, animLength=4})
							},
							displayInfo = 63703,
							title = "",
							onComplete = function()
								self:add(1);
							end
						}));
						
					end, {zone="Thunder Totem", sub="Hall of Chieftains", x=54.91, y=63.26, dist=1});
				end,
				onObjectiveDisable = function(self)
				end
			}),


		},		-- You can wrap objectives in {} to create packages
		start_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Thunder Totem", sub="", x=60.96, y=59.19, dist=1.86},
				fn = function(self, data)
					local comp = GetQuestsCompleted();
					if comp[39780] then
						return true;
					end
				end
			}
		},
		end_events = {
			{
				event = Event.Types.POINT_REACHED,
				data = {zone="Thunder Totem", sub="", x=60.96, y=59.19, dist=1.86},
				fn = function(self, data)
					return true;
				end
			}
		}
	}));

	-- This will cause the property to self delete, it's not needed. 
	return out
end
