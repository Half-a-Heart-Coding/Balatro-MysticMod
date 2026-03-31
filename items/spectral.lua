local white_hole = {
	object_type = "Consumable",
	set = "Planet",
	name = "White Hole",
	key = "white_hole",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 100,
	pos = { x = 3, y = 3 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)	
		return true--always allow use, but not always allow pool
	end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self)
		local _hand, _tally = nil, -1
		for k, v in ipairs(G.handlist) do
			if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
				_hand = v
				_tally = G.GAME.hands[v].played
			end
		end
		local neutronhand = get_random_hand2(_hand, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
		if neutronhand and G.GAME.hands[neutronhand].level > 1 then
		return G.GAME.mechanics_galaxyMode
		else
		return false
		end
	end,
	init = function(self)
		function get_random_hand2(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			ignore = ignore or {}
			seed = seed or "randomhand"
			random_counter = 0
			if type(ignore) ~= "table" then
				ignore = { ignore }
			end
			while random_counter < 100 do
				chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
				if G.GAME.hands[chosen_hand].visible and G.GAME.hands[chosen_hand].level > 1 then
					local safe = true
					for _, v in pairs(ignore) do
						if v == chosen_hand then
							safe = false
						end
					end
					if safe then
						break
					end
				end
				random_counter = random_counter + 1
			end
			return chosen_hand
		end
	end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get most played hand type (logic yoinked from Telescope)
		local _hand, _tally = nil, -1
		for k, v in ipairs(G.handlist) do
			if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
				_hand = v
				_tally = G.GAME.hands[v].played
			end
		end
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(_hand, "poker_hands"),
			chips = G.GAME.hands[_hand].chips,
			mult = G.GAME.hands[_hand].mult,
			level = G.GAME.hands[_hand].level,
		})
		level_up_hand(used_consumable, _hand, false, 3)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)

		--level down random hand
		local neutronhand = get_random_hand2(_hand, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
		if neutronhand and G.GAME.hands[neutronhand].level > 1 then
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = localize(neutronhand, "poker_hands"),
				chips = G.GAME.hands[neutronhand].chips,
				mult = G.GAME.hands[neutronhand].mult,
				level = G.GAME.hands[neutronhand].level,
			})
			--level up once for each neutron star used this run
			level_up_hand(used_consumable, neutronhand, nil, -1)
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		end
	end,
}

local worm_hole = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Worm Hole",
	key = "worm_hole",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 4,
	pos = { x = 2, y = 5 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		return true
	end,
	init = function(self)
		function get_highest_hand2(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			local highestLevelHand = 1
					local highestLevelHandName = "High Card"
					local highestLevelHandPlays = 0
					for i = 1, #G.handlist do
						chosen_hand = G.handlist[i]
						if G.GAME.hands[chosen_hand].visible and G.GAME.hands[chosen_hand].level > highestLevelHand then
							highestLevelHandName = chosen_hand
							highestLevelHandPlays = G.GAME.hands[chosen_hand].played
							highestLevelHand = G.GAME.hands[chosen_hand].level
						end
						--ease_dollars(1)
					end
					--self.ability.hand_type = highestLevelHandName
			return highestLevelHandName
		end
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	in_pool = function(self)
		--highest hand and most played hand must be at least 3 levels apart
		local _hand, _tally = nil, -1
		for k, v in ipairs(G.handlist) do
			if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
				_hand = v
				_tally = G.GAME.hands[v].played
			end
		end
		local neutronhand = get_highest_hand2(_hand, "nstar" .. G.GAME.round_resets.ante) --Highest poker hand
		if neutronhand ~= _hand and ((G.GAME.hands[neutronhand].level >= (G.GAME.hands[_hand].level + 3)) or (G.GAME.hands[neutronhand].level <= (G.GAME.hands[_hand].level - 3))) then
			return true--G.GAME.mechanics_galaxyMode
		end
		return false
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get most played hand type (logic yoinked from Telescope)
		local _hand, _tally = nil, -1
		for k, v in ipairs(G.handlist) do
			if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
				_hand = v
				_tally = G.GAME.hands[v].played
			end
		end
		local neutronhand = get_highest_hand2(_hand, "nstar" .. G.GAME.round_resets.ante) --Highest poker hand
		local highestHandLevel = G.GAME.hands[neutronhand].level
		local mostPlayedHandLevel = G.GAME.hands[_hand].level

		local levelsToChangeHighestHand = highestHandLevel - mostPlayedHandLevel

		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(_hand, "poker_hands"),
			chips = G.GAME.hands[_hand].chips,
			mult = G.GAME.hands[_hand].mult,
			level = G.GAME.hands[_hand].level,
		})
		level_up_hand(used_consumable, _hand, false, levelsToChangeHighestHand)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)

		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(neutronhand, "poker_hands"),
			chips = G.GAME.hands[neutronhand].chips,
			mult = G.GAME.hands[neutronhand].mult,
			level = G.GAME.hands[neutronhand].level,
		})
		level_up_hand(used_consumable, neutronhand, false, -levelsToChangeHighestHand)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
}

local soul_but_weaker = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Soul Weak",
	key = "soul_but_weaker",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 29,
	pos = { x = 6, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		local jokerCount = 0
		--must have at least 3 noneternal jokers
		for _, value in ipairs(G.jokers.cards) do
			if value ~= card and not value.ability.eternal then
				jokerCount = jokerCount + 1
			end
		end
		return true--jokerCount > 1--nah, allow selling
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	in_pool = function(self)
		local jokerCount = 0
		--must have at least 3 noneternal jokers
		for _, value in ipairs(G.jokers.cards) do
			if value ~= card and not value.ability.eternal then
				jokerCount = jokerCount + 1
			end
		end
		return jokerCount > 1
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not v.ability.eternal then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, true, true, nil, nil, nil, "soul")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
	end,
}

local ectoplasm_butdifferent = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Ectoplasm 2",
	key = "ectoplasm_butdifferent",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 21,
	pos = { x = 4, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		return #G.jokers.cards > 0
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
	end,
	in_pool = function(self)
		return #G.jokers.cards > 0
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		local target = #G.jokers.cards == 1 and G.jokers.cards[1] or G.jokers.cards[math.random(#G.jokers.cards)]
		for k, v in pairs(G.jokers.cards) do
			if not v.ability.eternal and v ~= target then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				play_sound("card1", 0.9)
				target:flip()
				return true
			end,
		}))
		delay(0.2)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.3,
			func = function()
				--play_sound("dark_edition", 1.2, 0.4)
				play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
				play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
				target:juice_up(0.3, 0.3)
				target:set_edition("e_negative")
				return true
			end,
		}))
		delay(0.2)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				play_sound("card1", 1.1)
				target:flip()
				return true
			end,
		}))
		delay(0.6)
	end,
}

local crazy_seal = {
	object_type = "Seal",
	name = "pogoB-Crazy-Seal",
	key = "crazy_seal",
	badge_colour = HEX("e621c7"),--1d4fd7
	--config = { planets_amount = 3 },
	--loc_vars = function(self, info_queue)
	--	return { vars = { self.config.planets_amount } }
	--end,
	atlas = "extra_decks",
	order = 502,
	pos = { x = 0, y = 1 },
	-- This is still quite jank
	calculate = function(self, card, context)
		if context.destroying_card and context.cardarea == G.play and context.destroy_card == card and G.play.cards and #G.play.cards == 1 then
			--card.will_shatter = true
			add_tag(Tag("tag_ethereal"))
			--add_tag(Tag("tag_voucher"))
			--add_tag(Tag("tag_orbital"))
			play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
			play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
			card:set_seal(nil)
			return --{ remove = true }
		end
	end,
}

local typhoon = {
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-Typhoon",
	key = "typhoon",
	order = 29,
	config = {
		-- This will add a tooltip.
		mod_conv = "pogoB_crazy_seal",
		-- Tooltip args
		seal = { planets_amount = 3 },
		max_highlighted = 1,
	},
	loc_vars = function(self, info_queue, center)
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] =
			{ set = "Other", key = "pogoB_crazy_seal", specific_vars = { self.config.seal.planets_amount } }
		return { vars = { center.ability.max_highlighted } }
	end,
	cost = 4,
	atlas = "atlasnotjokers",
	pos = { x = 0, y = 4 },
	use = function(self, card, area, copier) --Good enough
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("pogoB_crazy_seal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

local death_but_for_jokers_spectral = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Death 2",
	key = "death_but_for_jokers_spectral",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 28,
	pos = { x = 5, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		return true--#G.jokers.cards > 1
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	--loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
	--end,
	in_pool = function(self)
		return #G.jokers.cards > 1
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		local target = G.jokers.cards[math.random(#G.jokers.cards)]
		for k, v in pairs(G.jokers.cards) do
			if not v.ability.eternal and v ~= target then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local _first_dissolve = nil
		local target2 = deletable_jokers[math.random(#deletable_jokers)]
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					if v == target2 then
						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end
				end
				return true
			end,
		}))
		--for i = 1, to_number(math.min(card.ability.copies, card.ability.immutable.max_copies)) do
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.4,
				func = function()
					local card = copy_card(target)
					card:start_materialize()
					card:set_procrast(true)
					card:add_to_deck()
					G.jokers:emplace(card)
					return true
				end,
			}))
		--end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				play_sound("card1", 0.9)
				target:flip()
				return true
			end,
		}))
		delay(0.2)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.3,
			func = function()
				--play_sound("dark_edition", 1.2, 0.4)
				target:set_procrast(true)
				return true
			end,
		}))
		delay(0.2)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				play_sound("card1", 1.1)
				target:flip()
				return true
			end,
		}))
		delay(0.6)
	end,
}

local black_goo = {
	object_type = "Consumable",
	set = "Tarot",
	name = "Ectoplasm 3",
	key = "black_goo",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 3,
	order = 1124,
	pos = { x = 2, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not v.edition then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		return #G.jokers.cards > 0 and #deletable_jokers > 0
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		if G.GAME and G.GAME.blackGoo_chance_upperNum then--this is because this is loaded before the game for some reason
			return {
				vars = {
					G.GAME.blackGoo_chance_upperNum,
					G.GAME.blackGoo_chance_lowerNum * G.GAME.probabilities.normal,
				},
			}
		end
	end,
	in_pool = function(self)
		return #G.jokers.cards > 0 and G.GAME.blackGoo_chance_upperNum < 9000 and G.GAME.blackGoo_chance_lowerNum > -100
	end,
	use = function(self, card, area, copier)
		if math.random() < ((G.GAME.blackGoo_chance_lowerNum * G.GAME.probabilities.normal) / G.GAME.blackGoo_chance_upperNum) then
			G.GAME.blackGoo_chance_upperNum = 99999
			G.GAME.blackGoo_chance_lowerNum = -9999
			local deletable_jokers = {}
			for k, v in pairs(G.jokers.cards) do
				if not v.edition then
					deletable_jokers[#deletable_jokers + 1] = v
				end
			end
			local target = #G.jokers.cards == 1 and G.jokers.cards[1] or deletable_jokers[math.random(#deletable_jokers)]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					play_sound("card1", 0.9)
					target:flip()
					return true
				end,
			}))
			delay(0.2)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				func = function()
					--play_sound("dark_edition", 1.2, 0.4)
					play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
					play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
					target:juice_up(0.3, 0.3)
					target:set_edition("e_negative")
					return true
				end,
			}))
			delay(0.2)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					play_sound("card1", 1.1)
					target:flip()
					return true
				end,
			}))
			delay(0.6)
		else
			if not G.GAME.blackGoo_chance_upperNum then
				G.GAME.blackGoo_chance_upperNum = 100
			end
			if not G.GAME.blackGoo_chance_lowerNum then
				G.GAME.blackGoo_chance_lowerNum = 1
			end
			G.GAME.blackGoo_chance_upperNum = G.GAME.blackGoo_chance_upperNum - 2
			G.GAME.blackGoo_chance_lowerNum = G.GAME.blackGoo_chance_lowerNum + 1
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_nope_ex"),
				colour = G.C.RARITY.BLACK,--PURPLE
			})
		end
	end,
}

local ceilingSpectralPlanet = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Gods Hole",--lol
	key = "ceilingSpectralPlanet",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 101,
	pos = { x = 3, y = 5 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	hidden = true, --default soul_rate of 0.3% in spectral packs is used
	soul_set = "Planet",
	can_use = function(self, card)
		return true
	end,
	--weight = 1000,
	--freq = 1000,
	galaxyCard = true,
	--set_card_type_badge = function(self, card, badges)
   --     badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    --end,
	in_pool = function(self)
		return G.GAME.mechanics_galaxyMode--this is extremely rare
	end,
	use = function(self, card, area, copier)
		local neutronhand = get_highest_hand(_hand, "nstar" .. G.GAME.round_resets.ante) --Highest poker hand
		local highestHandLevel = G.GAME.hands[neutronhand].level
		--local mostPlayedHandLevel = G.GAME.hands[_hand].level
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = "All Hands",
			chips = "",
			mult = "",
			level = "+?",
		})
			
		for k, eval in ipairs(G.handlist) do
			if eval ~= neutronhand then
				local levelsToUp = highestHandLevel - G.GAME.hands[eval].level 
				level_up_hand(card, eval, true, levelsToUp)
			end
		end

		level_up_hand(card, neutronhand, true, 1)

		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
}

local wraithMythicVersion = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Worm Hole",
	key = "wraithMythicVersion",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 3,
	pos = { x = 0, y = 5 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local removed_levels = 0
		for k, v in ipairs(G.handlist) do
			if G.GAME.hands[v].level > 1 then
				local this_removed_levels = G.GAME.hands[v].level - 1
				--if v ~= _hand then
					removed_levels = removed_levels + this_removed_levels
					level_up_hand(used_consumable, v, true, -this_removed_levels)
				--end
			end
		end
		ease_dollars(removed_levels)
		if pseudorandom("riffleRaffleDuplication") > 0.95 and 1==2 then
			local card_show2 = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic2", nil, nil, nil, "j_pogoB_anitmater")--5% chance to give antimatter, even though its not actually a mythic
			card_show2:add_to_deck()
			card_show2:start_materialize()
			--card_show2.eternal = true
			--card_show2.ability.perishimient = true
			--card_show2:set_eternal(true)
			--card_show2.ability.eternal = true
			card_show2:set_edition("e_negative")
			G.jokers:emplace(card_show2)
		else
			local card_show2 = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic", nil, nil, nil, "j_pogoB_riffRaffButGood")--"pogoB_hah_mythic"
			card_show2:add_to_deck()
			card_show2:start_materialize()
			--card_show2.eternal = true
			--card_show2.ability.perishimient = true
			--card_show2:set_eternal(true)
			--card_show2.ability.eternal = true
			--card_show2:set_edition("e_negative")
			G.jokers:emplace(card_show2)
		end
	end,
}

local gasterAHand = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Worm Hole",
	key = "gasterAHand",
	text = {
		"Upgrade {C:attention,E:1}most played{} poker hand",
		"by {C:attention}2{} levels",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 4,
	pos = { x = 1, y = 5 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Planet",
	can_use = function(self, card)
		return true
	end,
	--config = { pokerHandToGaster = "High Card" },
	loc_vars = function(self, info_queue, card)
		if G.GAME.round_resets and G.GAME.round_resets.ante and card.ability and not card.ability.pokerHandToGaster then
			card.ability.pokerHandToGaster = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
		end
		if G.GAME.round_resets and G.GAME.round_resets.ante and card.ability and not card.ability.pokerHandToGaster2 and card.ability.pokerHandToGaster then
			card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
			if card.ability.pokerHandToGaster2 == card.ability.pokerHandToGaster then
				card.ability.pokerHandToGaster2 = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante)
			end
		end
		return {
			vars = {
				localize(card.ability.pokerHandToGaster, "poker_hands"),
				localize(card.ability.pokerHandToGaster2, "poker_hands"),
				--localize(center.ability.extra.type),
			},
		}
	end,
	init = function(self)
		function get_random_hand3(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			ignore = ignore or {}
			seed = seed or "randomhand"
			random_counter = 0
			if type(ignore) ~= "table" then
				ignore = { ignore }
			end
			while random_counter < 1000 do
				chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
				if G.GAME.hands[chosen_hand].visible then
					local safe = true
					for _, v in pairs(ignore) do
						if v == chosen_hand then
							safe = false
						end
					end
					if safe then
						break
					end
				end
				random_counter = random_counter + 1
			end
			return chosen_hand
		end
	end,
	use = function(self, card, area, copier)
		local neutronhand = card.ability.pokerHandToGaster --Random poker hand
		if neutronhand and card.ability.pokerHandToGaster2 and G.GAME.hands[neutronhand].visible then
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = localize(neutronhand, "poker_hands"),
				chips = G.GAME.hands[neutronhand].chips,
				mult = G.GAME.hands[neutronhand].mult,
				level = G.GAME.hands[neutronhand].level,
			})
			--gone
			G.GAME.hands[neutronhand].visible = false
			G.GAME.hands[neutronhand].played = 0
			--level_up_hand(card, neutronhand, true, -1)
			--for k, v in ipairs(G.handlist) do
			--	if G.GAME.hands[v].visible then
					--local this_removed_levels = G.GAME.hands[v].level - 1
					--if v ~= _hand then
						--removed_levels = removed_levels + this_removed_levels
						level_up_hand(card, card.ability.pokerHandToGaster2, true, G.GAME.hands[neutronhand].level)
					--end
			--	end
			--end
			level_up_hand(card, neutronhand, true, (G.GAME.hands[neutronhand].level * -1))
			G.GAME.hands[neutronhand].chips = 0
			G.GAME.hands[neutronhand].mult = 0
			G.GAME.hands[neutronhand].s_chips = 0
			G.GAME.hands[neutronhand].s_mult = 0
			G.GAME.hands[neutronhand].l_chips = 0
			G.GAME.hands[neutronhand].l_mult = 0
			--G.GAME.hands[neutronhand].order = 20
			local handnameDeleted = localize(neutronhand, "poker_hands")
			local ConsumableThatGetsBanned = c_pluto--this variable only exists for quick copy
			--G.GAME.hands[neutronhand] = nil
			G.GAME.hands[neutronhand].sentToTheVoid = true
			if handnameDeleted == "Pair" then
				ConsumableThatGetsBanned = c_mercury
				G.P_CENTERS.c_mercury.softlock = true
				G.P_CENTERS.c_mercury.config.softlock = true
				G.P_CENTERS.c_mercury.freq = 0
				--ease_dollars(2)
			end
			if handnameDeleted == "Three of a Kind" then
				ConsumableThatGetsBanned = c_venus
				G.P_CENTERS.c_venus.softlock = true
				G.P_CENTERS.c_venus.config.softlock = true
				G.P_CENTERS.c_venus.freq = 0
				--ease_dollars(3)
			end
			if handnameDeleted == "Full House" then
				ConsumableThatGetsBanned = c_earth
				G.P_CENTERS.c_earth.softlock = true
				G.P_CENTERS.c_earth.config.softlock = true
				G.P_CENTERS.c_earth.freq = 0
				--ease_dollars(4)
			end
			if handnameDeleted == "Four of a Kind" then
				ConsumableThatGetsBanned = c_mars
				G.P_CENTERS.c_mars.softlock = true
				G.P_CENTERS.c_mars.config.softlock = true
				G.P_CENTERS.c_mars.freq = 0
				--ease_dollars(5)
			end
			if handnameDeleted == "Flush" then
				ConsumableThatGetsBanned = c_jupiter
				G.P_CENTERS.c_jupiter.softlock = true
				G.P_CENTERS.c_jupiter.config.softlock = true
				G.P_CENTERS.c_jupiter.freq = 0
				--ease_dollars(6)
			end
			if handnameDeleted == "Straight" then
				ConsumableThatGetsBanned = c_saturn
				G.P_CENTERS.c_saturn.softlock = true
				G.P_CENTERS.c_saturn.config.softlock = true
				G.P_CENTERS.c_saturn.freq = 0
				--ease_dollars(7)
			end
			if handnameDeleted == "Two Pair" then
				ConsumableThatGetsBanned = c_uranus
				G.P_CENTERS.c_uranus.softlock = true
				G.P_CENTERS.c_uranus.config.softlock = true
				G.P_CENTERS.c_uranus.freq = 0
				--ease_dollars(8)
			end
			if handnameDeleted == "Straight Flush" then
				ConsumableThatGetsBanned = c_neptune
				G.P_CENTERS.c_neptune.softlock = true
				G.P_CENTERS.c_neptune.config.softlock = true
				G.P_CENTERS.c_neptune.freq = 0
				--ease_dollars(9)
			end
			if handnameDeleted == "High Card" then
				ConsumableThatGetsBanned = c_pluto
				G.P_CENTERS.c_pluto.softlock = true
				G.P_CENTERS.c_pluto.config.softlock = true
				G.P_CENTERS.c_pluto.freq = 0
				--ease_dollars(1)
			end
			if handnameDeleted == "Five of a Kind" then
				ConsumableThatGetsBanned = c_planet_x
				G.P_CENTERS.c_planet_x.softlock = true
				G.P_CENTERS.c_planet_x.config.softlock = true
				G.P_CENTERS.c_planet_x.freq = 0
				--ease_dollars(10)
			end
			if handnameDeleted == "Flush House" then
				ConsumableThatGetsBanned = c_ceres
				G.P_CENTERS.c_ceres.softlock = true
				G.P_CENTERS.c_ceres.config.softlock = true
				G.P_CENTERS.c_ceres.freq = 0
				--ease_dollars(11)
			end
			if handnameDeleted == "Flush Five" then
				ConsumableThatGetsBanned = c_eris
				G.P_CENTERS.c_eris.softlock = true
				G.P_CENTERS.c_eris.config.softlock = true
				G.P_CENTERS.c_eris.freq = 0
				--ease_dollars(12)
			end
			if handnameDeleted == "Royal Flush" then
				ConsumableThatGetsBanned = c_pogoB_royalPlanet
				G.P_CENTERS.c_pogoB_royalPlanet.softlock = true
				G.P_CENTERS.c_pogoB_royalPlanet.config.softlock = true
				G.P_CENTERS.c_pogoB_royalPlanet.freq = 0
				--ease_dollars(13)
			end
			if handnameDeleted == "Flower Pot" then
				ConsumableThatGetsBanned = c_pogoB_garden
				G.P_CENTERS.c_pogoB_garden.softlock = true
				G.P_CENTERS.c_pogoB_garden.config.softlock = true
				G.P_CENTERS.c_pogoB_garden.freq = 0
				--ease_dollars(14)
			end
			--5 empty cards doesnt have a planet card
			--G.GAME.hands[neutronhand].played = 0
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		end
	end,
}

local cheesypack = {
	object_type = "Booster",
	key = "cheesy_pack",
	kind = "Buffoon",
	pos = { x = 0, y = 4 },
	--atlas = "pack",
	order = 800,
	--pos = { x = 0, y = 2 },
	--cry_baneful_punishment = true,
	no_music = true, --prevent override of music, such as in boss blinds
	no_doe = true,
	unskippable = function(self)
		--Only be unskippable if no VALID jokers are owned (if rightmost is eternal/cursed, the next)
		--if G.jokers and (#G.jokers.cards == 0 or not G.jokers.cards) then
		--	return true
		--end
		--For loop that iterates from right to left, breaking and returning false if finding the rightmost valid noneternal or cursed Joker
		--if G.jokers and G.jokers.cards then
		--	for i = #G.jokers.cards, 1, -1 do
		--		if
		--			not (G.jokers.cards[i].ability.eternal or G.jokers.cards[i].config.center.rarity == "cry_cursed")
		--		then
		--			return false
		--		end
		--	end
		--end
		return true
	end,
	config = { extra = 7, choose = 3 },
	cost = 1,
	immutable = true,
	weight = 0, --never spawn naturally
	create_card = function(self, card)
		card = create_card("Joker", G.jokers, nil, nil, true, nil)
		card.ability.negative = true
		card.ability.eternal = true
		--card.edition = 4
		return card
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, HEX("474931"))
		ease_background_colour({ new_colour = HEX("474931"), special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
	card.ability.negative = true
	card.ability.eternal = true
		return {
			vars = {
				card and card.ability.negative,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	--never spawn as well in pool
	in_pool = function()
		return false
	end,
	group_key = "k_buffoon_pack",
	--cry_digital_hallucinations = cursed_digital_hallucinations_compat,
}

G.FUNCS.can_skip_booster = function(e)
	if
		G.pack_cards
		and not (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)
		and (
			G.STATE == G.STATES.SMODS_BOOSTER_OPENED
			or G.STATE == G.STATES.PLANET_PACK
			or G.STATE == G.STATES.STANDARD_PACK
			or G.STATE == G.STATES.BUFFOON_PACK
			or G.hand
		)
	then
		--if a booster is unskippable (when its unskippable conditionsa re fulfilled), unhighlight it
		local obj = SMODS.OPENED_BOOSTER.config.center
		if obj.unskippable and type(obj.unskippable) == "function" then
			if obj:unskippable() == true then
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			else
				e.config.colour = G.C.GREY
				e.config.button = "skip_booster"
			end
		else
			e.config.colour = G.C.GREY
			e.config.button = "skip_booster"
		end
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

local mythic_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 3, y = 0 },
	name = "Mythical Tag",
	order = 1,
	min_ante = 2,--maybe 3
	max_ante = 4,--idk if this works--no it does not
	--odds = 4,
	--requires = "j_cry_googol_play",
	config = { type = "store_joker_create" },
	key = "mythic",
	in_pool = function(self) 
		if G.GAME.round_resets.blind_ante < 5 then
			return true
		else
			return false
		end
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			card = create_card("Joker", context.area, nil, "pogoB_hah_mythic", nil, nil, nil, "j_joker")
			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("+", G.C.RARITY.pogoB_hah_mythic, function()
				card:start_materialize()
				card:set_cost()
				return true
			end)
			tag.triggered = true
			return card
		end
	end,
}

local common_tag_butUseful = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 2, y = 1 },
	name = "Common Tag",
	order = 3,
	min_ante = 1,
	--requires = "j_cry_googol_play",
	config = { type = "store_joker_create" },
	key = "common_stamp",
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			tag:yep("+", G.C.RARITY.COMMON, function()
				use_consumable_animation(card, nil, function()
      if #G.jokers.cards < G.jokers.config.card_limit then
        G.SETTINGS.paused = true

        local selectable_jokers = {}

        for _, v in ipairs(G.P_CENTER_POOLS.Joker) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
          if v.discovered and not next(SMODS.find_card(v.key))
		      and v.rarity == 1 then
            selectable_jokers[#selectable_jokers + 1] = v
          end
        end

        -- If the list of jokers is empty, we want at least one option so the user can leave the menu
        if #selectable_jokers <= 0 then
          selectable_jokers[#selectable_jokers + 1] = G.P_CENTERS.j_joker
        end

        G.FUNCS.overlay_menu {
          config = { no_esc = true },
          definition = apostle_of_wands_collection_UIBox(
            selectable_jokers,
            { 5, 5, 5 },
            {
              no_materialize = true,
              modify_card = function(other_card, center)
                other_card.sticker = get_joker_win_sticker(center)
                create_select_card_ui(other_card, G.jokers)
              end,
              h_mod = 1.05,
            }
          ),
        }
      end
    end)
				return true
			end)
			tag.triggered = true
			return card
		end
	end,
}

local mosaic_shader = {
	object_type = "Shader",
	key = "mosaic",
	path = "mosaic.fs",
}
local mosaic = {
	object_type = "Edition",
	dependencies = {
		items = {
			"set_cry_misc",
		},
	},
	key = "mosaic",
	order = 2,
	weight = 0.01, --slightly rarer than Polychrome = 0.8
	shader = "mosaic",
	in_shop = true,
	extra_cost = 5,
	config = { x_chips = 2.5, trigger = nil },
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.x_chips } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { x_chips = self.config.x_chips } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
}

local antimatter_joker_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 4, y = 0 },
	name = "Antimatter Tag",
	order = 2,
	--odds = 1000,--impossibly rare
	min_ante = 5,--late antes only
	--requires = "j_cry_googol_play",
	config = { type = "store_joker_create" },
	key = "anitmaterJoke",
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			if math.random() < 0.01 then
				card = create_card("Joker", context.area, nil, "pogoB_hah_mythic2", nil, nil, nil, "j_pogoB_theFabledAntimatterJoker", "j_pogoB_theFabledAntimatterJoker")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.pogoB_hah_mythic2, function()
					card:start_materialize()
					card:set_edition("e_negative")
					card.ability.couponed = true
					card:set_cost()
					return true
				end)
				tag.triggered = true
				return card
			else
				card = create_card("Joker", context.area, nil, "pogoB_hah_mythic", nil, nil, nil, "j_joker")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.pogoB_hah_mythic, function()
					card:start_materialize()
					card.ability.couponed = true
					card:set_cost()
					return true
				end)
				tag.triggered = true
				return card
			end
		end
		--if context.type == "store_joker_create" then
		--	card = create_card("Joker", context.area, nil, "pogoB_hah_mythic2", nil, nil, nil, "j_pogoB_theFabledAntimatterJoker", "j_pogoB_theFabledAntimatterJoker")
		--	create_shop_card_ui(card, "Joker", context.area)
		--	card.states.visible = false
		--	tag:yep("+", G.C.RARITY.pogoB_hah_mythic2, function()
		--		card:start_materialize()
		--		--card.edition.negative = true
		--		card:set_edition("e_negative")
		--		--card.misprint_cost_fac = 0.5
		--		card.ability.couponed = true
		--		card:set_cost()
		--		return true
		--	end)
		--	tag.triggered = true
		--	return card
		--end
	end,
}

SMODS.Atlas({
	key = "poker_hands",
	path = "hands.png",
	px = 53,
	py = 13,
})
SMODS.Atlas({
	key = "pogo_tags",
	path = "pogo_tags.png",
	px = 34,
	py = 34,
})
SMODS.Atlas({
	key = "placeholders",
	path = "placeholders.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "cry_misc",
	path = "cry_misc.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "GodhoodCard",
	path = "GodhoodCard.png",
	px = 69,
	py = 93,
})
SMODS.Atlas({
	key = "GodhoodCard_Pre",
	path = "GodhoodCard_Pre.png",
	px = 69,
	py = 93,
})
SMODS.Atlas({
	key = "atlasnotjokers",
	path = "atlasnotjokers.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasvoucher",
	path = "atlasvoucher.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "pogoB_pack",
	path = "pogoB_pack.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "stamps_atlas",
	path = "stamps_atlas.png",
	px = 71,
	py = 95,
})

SMODS.PokerHandPart({
	key = "FlowerPotPart",
	func = function(hand)
		--if Cryptid.enabled("set_cry_poker_hand_stuff") ~= true or Cryptid.enabled("c_cry_void") ~= true then
		--	return {}
		--end
		local eligible_cards = {}
		for i, card in ipairs(hand) do
			if not card.config.center.not_fucked then --card.ability.name ~= "Gold Card"
				eligible_cards[#eligible_cards + 1] = card
			end
		end
		if #eligible_cards > 4 then
			return { eligible_cards }
		end
		return {}
	end,
})

SMODS.PokerHand({
	key = "RoyalFlush",
	visible = false,
	chips = 200,
	mult = 16,
	l_chips = 50,--this is the fastest scaling hand
	l_mult = 5,--this is the fastest scaling hand
	example = {
		{ "S_A", true },
		{ "S_K", true },
		{ "S_Q", true },
		{ "S_J", true },
		{ "S_T", true },
		--{ "D_8", true },
		--{ "S_6", true },
		--{ "C_5", true },
	},
	atlas = "poker_hands",
	pos = { x = 0, y = 1 },
	evaluate = function(parts, hand)
		local other_hands = next(parts._flush) and next(parts._straight)
		--if next(parts.pogoB_FlowerPotPart) then
			if other_hands then
				local stones = {}
				local unique_suits = 1
				local conidiontsMet = false--nema si speelleddddd wrang 
				local cardsToScore = {}
				for i, card in ipairs(hand) do
					if card.base.value == "Ace" or card.base.value == "A" or card.base.value == 14 then
						stones[#stones + 1] = card
					end
					if card.base.value == "King" or card.base.value == "K" or card.base.value == 13 then
						stones[#stones + 1] = card
					end
				end
				if #stones == 2 then
					--local unique_suits = 1
					for i, card in ipairs(hand) do
						cardsToScore[#cardsToScore + 1] = card
					end
					return { cardsToScore }
				end
			end
		--end
		return {}
	end,
})
SMODS.PokerHand({
	key = "BlackJack",
	visible = false,
	chips = 21,--dont question it
	mult = 10,--dont question it
	l_chips = 0,--dont question it
	l_mult = 5,--dont question it
	example = {
		{ "S_7", true },
		{ "H_7", true },
		{ "D_2", true },
		{ "C_5", true },
		{ "C_5", true, enhancement = "m_stone" },
	},
	atlas = "poker_hands",
	pos = { x = 0, y = 1 },
	evaluate = function(parts, hand)
		local other_hands = next(parts._flush) and next(parts._straight)
		--if next(parts.pogoB_FlowerPotPart) then
			--if other_hands then
				local stones = {}
				local unique_suits = 1
				local conidiontsMet = false--nema si speelleddddd wrang 
				local cardsToScore = {}
				local total_points = 0
				for i, card in ipairs(hand) do
					cardsToScore[#cardsToScore + 1] = card
				end
				if #cardsToScore >= 2 then
					--local unique_suits = 1
					for i, card in ipairs(hand) do
						if card.config.center_key ~= "m_pogoB_blankCardEnhance" and card.config.center_key ~= "m_stone" then
							if card.base.value == "Ace" or card.base.value == "A" or card.base.value == 14 then
								total_points = total_points + 11
							end
							if card.base.value == "Q" or card.base.value == "K" or card.base.value == "J" or card.base.value == "T" then
								total_points = total_points + 10
							end
							if card.base.value == 10 or card.base.value == 11 or card.base.value == 12 or card.base.value == 13 then
								total_points = total_points + 10
							end
							if card.base.value == "Queen" or card.base.value == "King" or card.base.value == "Jack" or card.base.value == "Ten" then
								total_points = total_points + 10
							end
							if card.base.value == "10" then
								total_points = total_points + 10
							end
							if card.base.value == "9" then
								total_points = total_points + 9
							end
							if card.base.value == "8" then
								total_points = total_points + 8
							end
							if card.base.value == "7" then
								total_points = total_points + 7
							end
							if card.base.value == "6" then
								total_points = total_points + 6
							end
							if card.base.value == "5" then
								total_points = total_points + 5
							end
							if card.base.value == "4" then
								total_points = total_points + 4
							end
							if card.base.value == "3" then
								total_points = total_points + 3
							end
							if card.base.value == "2" then
								total_points = total_points + 2
							end
						end
					end
					if total_points == 21 and pogoB_config.allow_blackJack then
						return { cardsToScore }
					elseif total_points == 21 and #cardsToScore == 5 then
						return { cardsToScore }
					end
				end
			--end
		--end
		return {}
	end,
})
SMODS.PokerHand({
	key = "BlankHand",
	visible = false,
	chips = 52,--must be more than 2560 (chipsxmult) to override flush 5
	mult = 52,--must be more than 2560 (chipsxmult) to override flush 5
	l_chips = 0,--it cant level up
	l_mult = 0,--it cant level up
	example = {
		{ "S_A", true, enhancement = "m_pogoB_blankCardEnhance" },
		{ "S_A", true, enhancement = "m_pogoB_blankCardEnhance" },
		{ "H_K", true, enhancement = "m_pogoB_blankCardEnhance" },
		{ "C_Q", true, enhancement = "m_pogoB_blankCardEnhance" },
		{ "D_J", true, enhancement = "m_pogoB_blankCardEnhance" },
		--{ "D_8", true },
		--{ "S_6", true },
		--{ "C_5", true },
	},
	atlas = "poker_hands",
	pos = { x = 0, y = 1 },
	evaluate = function(parts, hand)
		--local other_hands = next(parts._flush) or next(parts._all_pairs)
		--if next(parts.pogoB_FlowerPotPart) then
			--if not other_hands then
				local stones = {}--blank cards
				local unique_suits = 1
				for i, card in ipairs(hand) do
					if
						card.config.center_key == "m_pogoB_blankCardEnhance"
					then
						stones[#stones + 1] = card
					end
				end
				if #stones >= 5 then
					--local unique_suits = 1
					return { stones }
				end
			--end
		--end
		return {}
	end,
})

local garden = {
	object_type = "Consumable",
	set = "Planet",
	key = "garden",
	config = { hand_type = "pogoB_FlowerPot", softlock = true },
	pos = { x = 0, y = 2 },
	order = 1,
	atlas = "placeholders",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("pogoB_hand_FlowerPot"),
				G.GAME.hands["pogoB_FlowerPot"].level,
				G.GAME.hands["pogoB_FlowerPot"].l_mult,
				G.GAME.hands["pogoB_FlowerPot"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["pogoB_FlowerPot"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["pogoB_FlowerPot"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}
local royaltyPlante = {
	object_type = "Consumable",
	set = "Planet",
	key = "royalPlanet",
	config = { hand_type = "pogoB_RoyalFlush", softlock = true },
	pos = { x = 2, y = 4 },
	order = 1,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("pogoB_RoyalFlush"),
				G.GAME.hands["pogoB_RoyalFlush"].level,
				G.GAME.hands["pogoB_RoyalFlush"].l_mult,
				G.GAME.hands["pogoB_RoyalFlush"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["pogoB_RoyalFlush"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["pogoB_RoyalFlush"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}

local blackJackPlanet = {
	object_type = "Consumable",
	set = "Planet",
	key = "blackJackPlanet",
	config = { hand_type = "pogoB_BlackJack", softlock = true },
	pos = { x = 2, y = 3 },
	order = 1,
	atlas = "atlasnotjokers",
	aurinko = true,
	is_dwarf = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	in_pool = function()
		return G.GAME and G.GAME.hands["pogoB_BlackJack"].visible and G.GAME.hands["pogoB_BlackJack"].level < 7--effect is at level 7
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("pogoB_BlackJack"),
				G.GAME.hands["pogoB_BlackJack"].level,
				G.GAME.hands["pogoB_BlackJack"].l_mult,
				G.GAME.hands["pogoB_BlackJack"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["pogoB_BlackJack"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["pogoB_BlackJack"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}

-- BLANK (Enhancement)
-- Has no rank/suit
-- never scores when played
-- 10/10, always take
-- shatters when played
local blankCardEnhance = {
	object_type = "Enhancement",
	name = "Blank Card",
	key = "blankCardEnhance",
	not_stoned = true,
	overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	replace_base_card = true, --So no base chips and no image
	always_scores = true,
	no_rank = true,
    no_suit = true,
	atlas = "cry_misc",
	order = 205,
	pos = { x = 3, y = 3 },
	shatters = true, --SMODS has a new "shatters" function
	force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	specific_suit = "pogoB_blankCardEnhance",
	specific_rank = "pogoB_blankCardEnhance",
	config = { extra = { destroy_after = false } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	--loc_vars = function(self, info_queue, card)
	--	return {
	--		vars = {
	--			card.ability.extra.Emult,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_play, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_play,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_round, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_round,
	--		},
	--	}
	--end,
	calculate = function(self, card, context)
		--if card and card.base and card.base.value and card.base.suit then
		--	card.base.value = 2
		--	card.base.suit = "spades"
		--end
		
		if
			context.cardarea == G.play
			and context.after
			--card.ability.extra.destroy_after
			and not card.ability.eternal
			and 1 == 2--these cards used to shatter if they failed to score
		then -- the 'card.area' part makes sure the card has a chance to survive if in the play area
			--local eval = evaluate_poker_hand(context.full_hand)
			--if next(eval["pogoB_BlankHand"]) then
			G.E_MANAGER:add_event(Event({
				trigger = "immediate",
				func = function()
					card:juice_up(0.9, 0.9)
					card:shatter()
					return true
				end,
			}))
			--end
		end

		--end
		if context.cardarea == G.play and context.main_scoring and not context.before then
			--G.E_MANAGER:add_event(Event({
			--	trigger = "immediate",
			--	func = function()
			--		card:juice_up(0.9, 0.9)
			--		card:shatter()
			--		return true
			--	end,
			--}))
			--card:set_ability("m_glass")
			--card:set_edition("e_negative")
			local eval = evaluate_poker_hand(context.full_hand)
			local stones = 0--blank cards
				local unique_suits = 1
				for i, card2 in ipairs(G.play.cards) do
					if
						card2.config.center_key == "m_pogoB_blankCardEnhance"
					then
						stones = stones + 1
					end
				end
			--if next(eval["pogoB_BlankHand"]) then--and stones >= 5 and #context.full_hand >= 5
				if stones >= 5 then--10% chance, +20% per blanker
					--pseudorandom("cry_abstract_destroy") < (G.GAME.probabilities.normal * 0.1 * ((#SMODS.find_card("j_pogoB_blank_joke") * 2) + 1))
					--card.ability.extra.destroy_after = false
					--local picky = { "m_bonus", "m_mult", "m_wild", "m_glass", "m_steel", "m_stone", "m_gold", "m_lucky" }
					--card:set_ability(picky[math.random(#picky)])
					for i, card2 in ipairs(G.play.cards) do
						if
							card2.config.center_key == "m_pogoB_blankCardEnhance"
						then
							card2:set_ability(G.P_CENTERS.c_base, true, nil)--"m_glass", this is funny, 33.75%, 45%, 0%, if it don't hit, shatter, was removed, chance was halved though
							card2:juice_up()
							card2:set_edition("e_negative")
							
						end
					end
					return {
						message = localize({
							type = "variable",
							key = "letsGoItHit",
							vars = {
								number_format(1),
							},
						}),
								chip_mod = 1,
						colour = G.C.CHIPS,
				
					}
					--emult_mod = 3,
					--xmult_mod = 3,
					--mult_mod = 3,
					--echip_mod = 3,
					
				else
					--card.ability.extra.destroy_after = true
					--card.will_shatter = true
					return {
					message = localize({
						type = "variable",
						key = "lol_no_chips_for_you",--chip_x_ONE
						vars = {
							number_format(0),
						},
					}),
					--emult_mod = 3,
					--xmult_mod = 3,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
					chip_mod = 0,
					colour = G.C.CHIPS,
					
				}
				end
		end
	end,
}
local perfectionhance = {
	object_type = "Enhancement",
	name = "God Card",
	key = "perfectionhance",
	not_stoned = true,
	overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	replace_base_card = true, --So no base chips and no image
	atlas = "cry_misc",
	order = 206,
	pos = { x = 2, y = 3 },
	shatters = false, --SMODS has a new "shatters" function
	force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	specific_suit = "pogoB_perfectionhance",
	specific_rank = "pogoB_perfectionhance",
	config = { extra = { savedChipMod = 100 } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.savedChipMod,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_play, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_play,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_round, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_round,
			},
		}
	end,
	calculate = function(self, card, context)
		--if card and card.base and card.base.value and card.base.suit then
		--	card.base.value = 2
		--	card.base.suit = "spades"
		--end
		
		--end
		if context.cardarea == G.play and context.main_scoring and not context.before then
			--G.E_MANAGER:add_event(Event({
			--	trigger = "immediate",
			--	func = function()
			--		card:juice_up(0.9, 0.9)
			--		card:shatter()
			--		return true
			--	end,
			--}))
			--card:set_ability("m_glass")
			--card:set_edition("e_negative")
			
					--card.ability.extra.destroy_after = true
					--card.will_shatter = true
					if savedChipMod == nil or savedChipMod < 1 then
						savedChipMod = 100
					end
					savedChipMod = savedChipMod * 2
				return {
				message = localize({
					type = "variable",
					key = "godCard_yes",
					vars = {
						number_format(savedChipMod),
					},
				}),
				--emult_mod = 3,
				--xmult_mod = 3,
				--mult_mod = 3,
				--echip_mod = 3,
				--xchip_mod = 3,
				--Xchip_mod = 0,
				--chip_mod = -100,
				chip_mod = savedChipMod,
				colour = G.C.CHIPS,
					
			}
		end
	end,
}
local celestialCard = {
	object_type = "Enhancement",
	name = "Celeste Card",
	key = "celestialCard",
	not_stoned = true,
	--overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	--replace_base_card = true, --So no base chips and no image
	atlas = "cry_misc",
	order = 207,
	pos = { x = 2, y = 3 },
	shatters = false, --SMODS has a new "shatters" function
	--force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	--specific_suit = "pogoB_perfectionhance",
	--specific_rank = "pogoB_perfectionhance",
	--config = { extra = { savedChipMod = 100 } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.before then--context.main_scoring and
			--ease_dollars(1)
			local celesteCards = 0
			for i = 0, #G.play.cards do
				if G.play.cards[i] and G.play.cards[i].config.center_key == "m_pogoB_celestialCard" then
					celesteCards = celesteCards + 1
					--ease_dollars(1)
				end
			end
			if celesteCards >= #G.play.cards and G.play.cards[1] == card and #context.scoring_hand >= #G.play.cards then
				--ease_dollars(100)
				local eval = context.scoring_name
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
					handname = localize(eval, "poker_hands"),
					chips = G.GAME.hands[eval].chips,
					mult = G.GAME.hands[eval].mult,
					level = G.GAME.hands[eval].level,
				})
				level_up_hand(card, eval, false, 1)
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
				)
			end
		end
	end,
}
local ascendedCard = {
	object_type = "Enhancement",
	name = "Ascended Card",
	key = "ascendedCard",
	not_stoned = true,
	overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	--replace_base_card = true, --So no base chips and no image
	atlas = "cry_misc",
	order = 209,
	pos = { x = 3, y = 2 },
	--update = function(self, card)
	--	if card.base.suit == "Spades" then
	--		pos = { x = 2, y = 0 }
	--	else
	--		pos = { x = 3, y = 2 }
	--	end
	--end,
	config = {
		extra = {
			chance1 = 1,--in 2
			chance2 = 1000,--in 20
			chance3 = 3,--in 20
		},
	},
	shatters = false, --SMODS has a new "shatters" function
	weight = 0,
	in_pool = function()
		return G.GAME and G.GAME.used_vouchers["v_illusion"] and pogoB_config.vanilla_rework--actually makes it useful?
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.total_triggers,
				G.GAME.probabilities.normal,
				card.ability.extra.godhoodChance,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_play, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_play,
	--			cry_prob(card.ability.cry_prob, card.ability.extra.odds_after_round, card.ability.cry_rigged),
	--			card.ability.extra.odds_after_round,
			},
		}
	end,
	--force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	--specific_suit = "pogoB_perfectionhance",
	--specific_rank = "pogoB_perfectionhance",
	config = { extra = { total_triggers = 1, godhoodChance = 1000 } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.before then
			
			--end
			--card.ability.extra.savedChipMod = true
		end
		if context.before and context.cardarea == G.hand then--context.final_scoring_step
            --card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.change
			local eval = context.scoring_name
			card.ability.extra.total_triggers = 10
			--if G.play.cards[1] == card then
			--	levelsToRemember = get_lowest_hand_level()--incase this is lowest hand level or something
			--	level_up_hand(card, eval, true, 1)
			--	update_hand_text(
			--		{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--		{ mult = mult, chips = chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--	)
			--else
				--get_lowest_hand()
				level_up_hand(card, eval, true, 1)
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = mult, chips = chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
				)
			return {
					message = localize("k_mult_ascend_basic2"),
					card = card,
					colour = G.C.PURPLE,
					--emult_mod = 3,
					--mult_mod = 2,
					--chip_mod = 15,
					--Xchip_mod = 2,
					--mult_mod = totalHandMult,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = totalHandChips,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
            
        end
		if context.cardarea == G.hand and context.scoring_name and context.after and card.ability.extra.total_triggers > 8 then
			local eval = context.scoring_name
			--if G.play.cards[1] == card and levelsToRemember then 
			--	if G.GAME.modifiers.hah_doubleUp and G.GAME.modifiers.hah_doubleUp > 0 then
			--		level_up_hand(card, eval, true, -1 - G.GAME.modifiers.hah_doubleUp)
			--	else
			--		level_up_hand(card, eval, true, -1)
			--	end
			--else
				if G.GAME.modifiers.hah_doubleUp and G.GAME.modifiers.hah_doubleUp > 0 then
					level_up_hand(card, eval, true, -1 - G.GAME.modifiers.hah_doubleUp)
				else
					level_up_hand(card, eval, true, -1)
				end
			--end
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = mult, chips = chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--)
		end
		if context.cardarea == G.play and context.main_scoring and not context.before then--context.main_scoring and
			--ease_dollars(1)
			local celesteCards = 0
			for i = 0, #G.play.cards do
				if G.play.cards[i] and G.play.cards[i].config.center_key == "m_pogoB_ascendedCard" then
					celesteCards = celesteCards + 1
					--ease_dollars(1)
				end
			end
			--total_triggers = card.ability.extra.total_triggers
			--if total_triggers then
			--	total_triggers = total_triggers + 1
			--else
			--	total_triggers = 1
			--end
			--if total_triggers > 100 then
			--	total_triggers = 100
			--end
			--card.ability.extra.total_triggers = 1 + (total_triggers / 100)--we want these to be different since it makes coding easier
			if math.random() <= (1 * G.GAME.probabilities.normal) / card.ability.extra.godhoodChance and context.main_scoring and (G.play.cards[1] == card or G.play.cards[2] == card or G.play.cards[3] == card or G.play.cards[4] == card or G.play.cards[5] == card) then 
				card:set_ability("m_pogoB_GodHoodCard")
				card:juice_up()
				return {
					message = localize("k_hatch_ascendGod"),
					card = card,
					x_mult = 2.5,
					colour = G.C.DARK_EDITION,
					--emult_mod = 3,
					--Xmult_mod = 2,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
				}
				else
				card.ability.extra.godhoodChance = card.ability.extra.godhoodChance - 1
				return {
					--message = localize("k_mult_ascend_twox"),
					
					card = card,
					colour = G.C.MULT,
					--emult_mod = 3,
					x_mult = 1 + (celesteCards * 0.25),
				
					--x_chip = 1 + (total_triggers * 0.01),
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
			end
		end
	end,
}
local GodHoodCard = {
	object_type = "Enhancement",
	name = "GOD Card",
	key = "GodHoodCard",
	not_stoned = false,
	overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	--replace_base_card = true, --So no base chips and no image
	atlas = "GodhoodCard",
	order = 300,
	pos = { x = 0, y = 0 },
	always_scores = true,
	--update = function(self, card)
	--	if card.base.suit == "Spades" then
	--		pos = { x = 2, y = 0 }
	--	else
	--		pos = { x = 3, y = 2 }
	--	end
	--end,
	shatters = false, --SMODS has a new "shatters" function
	weight = 0,
	--hidden = true,
	--soul_set = "Standard",
	in_pool = function()
		return math.random() < 0.003--soul rarity
	end,
	--force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	--specific_suit = "pogoB_GodHoodCard",
	--specific_rank = "pogoB_GodHoodCard",
	config = { extra = { cardsThatWereInHandLastCheck = 0 } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.before then--blackhole effect, not temp
			--card.ability.cardsThatWereInHandLastCheck = 0
			if 1==2 then--removed mechanic
				local _hand = "High Card"
				local eval = context.scoring_name
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
					handname = "All Hands",
					chips = "",
					mult = "",
					level = "+1",
				})
				--local removed_levels = 0
				for k, v in ipairs(G.handlist) do
					level_up_hand(card, v, true, 1)
				end
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
				)
			end
			---------------------------------------------------------------------------------------------------------------

			
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = 0, chips = 0, handname = "", level = "" }
			--)
			--card.ability.extra.savedChipMod = true
		end
		if context.final_scoring_step and context.cardarea == G.hand then
            --card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.change
			return {
					message = localize("k_mult_ascend_twox"),
					card = card,
					colour = G.C.MULT,
					--emult_mod = 3,
					Xmult_mod = 2,
				
					--Xchip_mod = 2,
					--mult_mod = totalHandMult,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = totalHandChips,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
            
        end
		if context.cardarea == G.play and context.main_scoring and not context.before then--context.main_scoring and
			--ease_dollars(1)
			local celesteCards = 0
			for i = 0, #G.play.cards do
				if G.play.cards[i] and G.play.cards[i].config.center_key == "m_pogoB_GodHoodCard" then
					celesteCards = celesteCards + 1
					--ease_dollars(1)
				end
			end
			if celesteCards >= 5 and G.play.cards[1] == card and not context.retrigger and 1==2 then
				--ease_dollars(100)
				local totalHandChips = 0
				local totalHandMult = 0

				for k, v in ipairs(G.handlist) do
					--level_up_hand(card, v, true, 1)
					if G.GAME.hands[v].visible then
						totalHandChips = totalHandChips + G.GAME.hands[v].chips
						totalHandMult = totalHandMult + G.GAME.hands[v].mult
					end
				end
				local eval = context.scoring_name
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = totalHandMult, chips = totalHandChips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
				)
				--G.GAME.current_round.current_hand.mult = totalHandMult
				--G.GAME.current_round.current_hand.chips = totalHandChips
				--G.GAME.current_round.current_hand.chip_text = totalHandChips
				--G.GAME.current_round.current_hand.mult_text = totalHandMult
				return {
					--message = localize("k_mult_ascend_twox"),
					card = card,
					colour = G.C.MULT,
					--emult_mod = 3,
					--Xmult_mod = 3,
				
					Xchip_mod = 3,
					mult_mod = totalHandMult,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					chip_mod = totalHandChips,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
			else
				return {
					message = localize("k_mult_ascend_twoxx"),
					card = card,
					colour = G.C.DARK_EDITION,
					--emult_mod = 3,
					--Xmult_mod = 3,
				
					Xchip_mod = 3,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
			end
		end
	end,
}
local hatchlingCard = {
	object_type = "Enhancement",
	name = "Hatchling Card",
	key = "hatchlingCard",
	not_stoned = true,
	--overrides_base_rank = true, --enhancement do not generate in grim, incantation, etc...
	--replace_base_card = true, --So no base chips and no image
	atlas = "cry_misc",
	order = 208,
	pos = { x = 2, y = 2 },
	--update = function(self, card)
	--	if card.base.suit == "Spades" then
	--		pos = { x = 2, y = 0 }
	--	else
	--		pos = { x = 3, y = 2 }
	--	end
	--end,
	shatters = false, --SMODS has a new "shatters" function
	--force_no_face = true, --true = always face, false = always face--wtf are they trying to say?
	--NEW! specific_suit suit. Like abstracted!
	--specific_suit = "pogoB_perfectionhance",
	--specific_rank = "pogoB_perfectionhance",
	--config = { extra = { savedChipMod = 100 } },
	--#1# emult, #2# in #3# chance card is destroyed after play, #4# in #5$ chance card is destroyed at end of round (even discarded or in deck)
	loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
		--return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and not context.before then--context.main_scoring and
			--ease_dollars(1)
			local celesteCards = 0
			for i = 0, #G.play.cards do
				if G.play.cards[i] and G.play.cards[i].config.center_key == "m_pogoB_hatchlingCard" then
					celesteCards = celesteCards + 1
					--ease_dollars(1)
				end
				if G.play.cards[i] and G.play.cards[i].config.center_key == "m_pogoB_GodHoodCard" then
					celesteCards = celesteCards + 999
					--ease_dollars(1)
				end
			end
			if celesteCards > 99 and context.main_scoring and (G.play.cards[1] == card or G.play.cards[2] == card or G.play.cards[3] == card or G.play.cards[4] == card or G.play.cards[5] == card) then 
				card:set_ability("m_pogoB_ascendedCard")
				card:juice_up()
				return {
					message = localize("k_hatch_ascend"),
					card = card,
					colour = G.C.DARK_EDITION,
					--emult_mod = 3,
					--Xmult_mod = 2,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
				}
			elseif celesteCards >= #G.play.cards and #G.play.cards >= 5 and G.play.cards[1] == card and #context.scoring_hand >= #G.play.cards and context.main_scoring then
				--ease_dollars(100)
				card:set_ability("m_pogoB_ascendedCard")
				card:juice_up()
				return {
					message = localize("k_hatch_ascend"),
					card = card,
					colour = G.C.DARK_EDITION,
					--emult_mod = 3,
					--Xmult_mod = 2,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
				}
			elseif context.main_scoring then
				card:set_ability(G.P_CENTERS.c_base, true, nil)
				card:juice_up()
				return {
					message = localize("k_hatch_broken"),
					card = card,
					colour = G.C.PURPLE,
					--emult_mod = 3,
					--Xmult_mod = 2,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
				}
			end
		end
	end,
}
local getIDenhance = Card.get_id
function Card:get_id()
	--Force suit to be suit X if specified in enhancement, only if not vampired
	if self.config and self.config.center_key == "m_pogoB_blankCardEnhance" and not self.vampired then
		--Get the max value + 1, to always be the last at the list
		return SMODS.Rank.max_id.value + 1
	end
	if self.config and self.config.center_key == "m_pogoB_perfectionhance" and not self.vampired then
		--Get the max value + 1, to always be the last at the list
		return 0
	end
	--if self.config and self.config.center_key == "m_pogoB_GodHoodCard" and not self.vampired then
	--	--Get the max value + 1, to always be the last at the list
	--	return -1
	--end
	local vars = getIDenhance(self)
	return vars
end
--stability fix, many bugs can happen, this should prevent--word order wrong, but I know what i'm saying
G.FUNCS.draw_from_discard_to_deck = function(e)
	G.E_MANAGER:add_event(Event({
		trigger = "immediate",
		func = function()
			local discard_count = #G.discard.cards
			for i = 1, discard_count do --draw cards from deck
				local card = G.discard.cards[i]
				if not card.shattered and not card.destroyed then
					draw_card(
						G.discard,
						G.deck,
						i * 100 / discard_count,
						"up",
						nil,
						card,
						0.005,
						i % 2 == 0,
						nil,
						math.max((21 - i) / 20, 0.7)
					)
				end
			end
			return true
		end,
	}))
end
-- Instability (Tarot)
-- Makes a selected playing card Abstract
local instability = {
	object_type = "Consumable",
	--dependencies = {
	--	items = {
	--		"set_cry_misc",
	--		"m_cry_abstract",
	--	},
	--},
	set = "Tarot",
	name = "Test Tarot",
	key = "instability2ElectricBoogaloo",
	order = 206,
	pos = { x = 5, y = 5 },
	config = { mod_conv = "m_pogoB_blankCardEnhance", max_highlighted = 2 },
	atlas = "atlasnotjokers",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_blankCardEnhance
		--info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

		return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
}

local celesteTarot = {
	object_type = "Consumable",
	--dependencies = {
	--	items = {
	--		"set_cry_misc",
	--		"m_cry_abstract",
	--	},
	--},
	set = "Tarot",
	name = "Test Tarot",
	key = "celesteTarot",
	order = 207,
	pos = { x = 4, y = 5 },
	config = { mod_conv = "m_pogoB_celestialCard", max_highlighted = 2 },
	atlas = "atlasnotjokers",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_celestialCard

		return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
}

local ritualTarot = {
	object_type = "Consumable",
	--dependencies = {
	--	items = {
	--		"set_cry_misc",
	--		"m_cry_abstract",
	--	},
	--},
	set = "Tarot",
	name = "Test Tarot",
	key = "ritualTarot",
	order = 208,
	pos = { x = 4, y = 4 },
	config = { mod_conv = "m_pogoB_hatchlingCard", max_highlighted = 4 },--rare 3 card enhancement--update even rarer 4 card enhancement (because ascended got nerfed)
	atlas = "atlasnotjokers",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
		return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
}

local ascendedSpectral = {
	object_type = "Consumable",
	--dependencies = {
	--	items = {
	--		"set_cry_misc",
	--		"m_cry_abstract",
	--	},
	--},
	set = "Tarot",--this is not spectral level when I think about it, since it is already pretty rare
	name = "Ascsahdshjf",
	key = "ascendedSpectral",
	order = 1225,--delta
	pos = { x = 3, y = 1 },
	config = { mod_conv = "m_pogoB_ascendedCard", max_highlighted = 1 },--rare 3 card enhancement--update even rarer 4 card enhancement (because ascended got nerfed)
	atlas = "atlasnotjokers",
	can_use = function(self, card)
		local jokerCount = 0
		if G.hand and G.hand.highlighted then
			for i = 1, #G.hand.highlighted do
				if value ~= card and G.hand.highlighted[i] and G.hand.highlighted[i].config.center_key == "m_pogoB_hatchlingCard" then
					jokerCount = jokerCount + 1
				end
			end
		end
		return jokerCount == 1
	end,
	in_pool = function(self)
		local jokerCount = 0
		--must have at least 3 noneternal jokers--highlighted
		if G.hand and G.hand.cards then
			for i = 1, #G.hand.cards do
				if G.hand.cards[i] and G.hand.cards[i].config.center_key == "m_pogoB_hatchlingCard" then
					jokerCount = jokerCount + 1
				end
			end
			return jokerCount > 0
		elseif G.deck and G.deck.cards then
			for i = 1, #G.deck.cards do
				if G.deck.cards[i] and G.deck.cards[i].config.center_key == "m_pogoB_hatchlingCard" then
					jokerCount = jokerCount + 1
				end
			end
			return jokerCount > 5--at least 6
		else
			return false
		end
	end,
	loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
		return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
}

SMODS.Sticker({
	badge_colour = HEX("bdb84a"),
	prefix_config = { key = false },
	key = "procrast",
	atlas = "stickers_hah_stakesAndStuff_balatroMod",
	pos = { x = 6, y = 0 },
	should_apply = false,
	--config = { extra = { roundsLeft = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.roundsLeft } }
	end,
	calculate = function(self, card, context)
		if not card.debuff then
			if card.ability.waitARound_forProcrast then
				card.ability.waitARound_forProcrast = false
				card.debuff = true
			else
				card.ability.roundsLeft = card.ability.roundsLeft - 1
				card.ability.waitARound_forProcrast = true--jokers are undebuffed twice per round
				if card.ability.roundsLeft <= 0 then
					card.debuff = false
					card.ability.procrast = false--remove after
				end
			end
		end
		if card.ability.roundsLeft > 0 then
			card.debuff = true
		end
		if card.ability.perishimient then
			card.debuff = false
			card.ability.procrast = false--remove after
		end
	end,
})

SMODS.Sticker({
	badge_colour = HEX("ff0000"),
	prefix_config = { key = false },
	key = "perishimient",
	atlas = "stickers_hah_stakesAndStuff_balatroMod",
	pos = { x = 4, y = 4 },
	should_apply = false,
	--config = { extra = { roundsLeft = 3 } },
})

SMODS.Sticker({
	badge_colour = HEX("800000"),
	prefix_config = { key = false },
	key = "champion_sticker_stake",
	atlas = "stickers_hah_stakesAndStuff_balatroMod",
	pos = { x = 1, y = 5 },
	should_apply = false,
	--config = { extra = { roundsLeft = 3 } },
	--code is in mechanic card lua code file
})

function Card:set_procrast(_banana)
	self.ability.roundsLeft = 3
	self.ability.waitARound_forProcrast = true
	self.ability.procrast = _banana
	--self.debuff = _banana
end

local recentHandPlanet = {
	object_type = "Consumable",
	set = "Planet",
	key = "recentHandPlanet",
	config = { },
	pos = { x = 4, y = 3 },
	order = 102,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	init = function(self)
		--G.GAME.galaxy_roundBoost_total_used_this_run = 0
		function get_highest_hand(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			local highestLevelHand = 1
					local highestLevelHandName = "High Card"
					local highestLevelHandPlays = 0
					for i = 1, #G.handlist do
						chosen_hand = G.handlist[i]
						if G.GAME.hands[chosen_hand].visible and G.GAME.hands[chosen_hand].level > highestLevelHand then
							highestLevelHandName = chosen_hand
							highestLevelHandPlays = G.GAME.hands[chosen_hand].played
							highestLevelHand = G.GAME.hands[chosen_hand].level
						end
						--ease_dollars(1)
					end
					--self.ability.hand_type = highestLevelHandName
			return highestLevelHandName
		end
		function get_strongest_hand_godhood(eval)
			--local eval = evaluate_poker_hand(context.full_hand)
			local strongestHand = 1--"High Card"
			if next(eval["pogoB_RoyalFlush"]) then
				strongestHand = 13--"pogoB_RoyalFlush"
			elseif next(eval["Flush Five"]) then
				strongestHand = 12--"Flush Five"
			elseif next(eval["Flush House"]) then
				strongestHand = 11--"Flush House"
			elseif next(eval["Five of a Kind"]) then
				strongestHand = 10--"Five of a Kind"
			elseif next(eval["Straight"]) and next(eval["Flush"]) then
				strongestHand = 9--"Straight Flush"
			elseif next(eval["Four of a Kind"]) then
				strongestHand = 8--"Four of a Kind"
			elseif next(eval["Full House"]) then
				strongestHand = 7--"Full House"
			elseif next(eval["Flush"]) then
				strongestHand = 6--"Flush"
			elseif next(eval["Straight"]) then
				strongestHand = 5--"Straight"
			elseif next(eval["Three of a Kind"]) then
				strongestHand = 4--"Three of a Kind"
			elseif next(eval["Two Pair"]) then
				strongestHand = 3--"Two Pair"
			elseif next(eval["Pair"]) then
				strongestHand = 2--"Pair"
			--elseif next(eval["FlowerPot"]) then
				--strongestHand = 1.5--"FlowerPot",how the fuck would this happen?
			end
			return strongestHand
		end
		function get_lowest_hand(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			local highestLevelHand = 1000--lowest hand should be less than 1000
					local highestLevelHandName = "High Card"
					local highestLevelHandPlays = 0
					for i = 1, #G.handlist do
						chosen_hand = G.handlist[i]
						if G.GAME.hands[chosen_hand].visible and G.GAME.hands[chosen_hand].level < highestLevelHand then--only count lowest visible hand level
							highestLevelHandName = chosen_hand
							highestLevelHandPlays = G.GAME.hands[chosen_hand].played
							highestLevelHand = G.GAME.hands[chosen_hand].level
						end
						--ease_dollars(1)
					end
					--self.ability.hand_type = highestLevelHandName
			return highestLevelHandName
		end
		function get_lowest_hand_level(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			local highestLevelHand = 1000--lowest hand should be less than 1000
					local highestLevelHandName = "High Card"
					local highestLevelHandPlays = 0
					for i = 1, #G.handlist do
						chosen_hand = G.handlist[i]
						if G.GAME.hands[chosen_hand].visible and G.GAME.hands[chosen_hand].level < highestLevelHand then--only count lowest visible hand level
							highestLevelHandName = chosen_hand
							highestLevelHandPlays = G.GAME.hands[chosen_hand].played
							highestLevelHand = G.GAME.hands[chosen_hand].level
						end
						--ease_dollars(1)
					end
					--self.ability.hand_type = highestLevelHandName
			return highestLevelHand
		end
	end,
	can_use = function(self, card)
		return true
	end,
	--calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
	--	if G.GAME.used_vouchers.v_observatory and context.joker_main then
	--		local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
	--		if context.scoring_name == neutronhand then
	--		return {
	--			message = localize({
	--				type = "variable",
	--				key = "a_xmult",
	--				vars = { 1.5 },
	--			}),
	--			Xmult_mod = 1.5,
	--		}
	--		end
	--	end
	--end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.mechanics_galaxyMode
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get amount of Neutron stars use this run or set to 0 if nil
		G.GAME.highestLevelHandName = G.GAME.highestLevelHandName or "High Card"

		--Add +1 to amount of neutron stars used this run
		--G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
		local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(neutronhand, "poker_hands"),
			chips = G.GAME.hands[neutronhand].chips,
			mult = G.GAME.hands[neutronhand].mult,
			level = G.GAME.hands[neutronhand].level,
		})
		--level up once for each neutron star used this run
		level_up_hand(used_consumable, neutronhand, nil, 2)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	--generate_ui = 0,
}

local randomHandPlanet = {
	object_type = "Consumable",
	set = "Planet",
	key = "randomHandPlanet",
	config = { },
	pos = { x = 1, y = 3 },
	order = 103,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.mechanics_galaxyMode
	end,
	init = function(self)
		function get_random_hand(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			ignore = ignore or {}
			seed = seed or "randomhand"
			if type(ignore) ~= "table" then
				ignore = { ignore }
			end
			while true do
				chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
				if G.GAME.hands[chosen_hand].visible or allowhidden then
					local safe = true
					for _, v in pairs(ignore) do
						if v == chosen_hand then
							safe = false
						end
					end
					if safe then
						break
					end
				end
			end
			return chosen_hand
		end
	end,
	can_use = function(self, card)
		return true
	end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get amount of Neutron stars use this run or set to 0 if nil
		G.GAME.highestLevelHandName = G.GAME.highestLevelHandName or "High Card"

		--Add +1 to amount of neutron stars used this run
		--G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
		for i = 1, 3 do
		local neutronhand = get_random_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(neutronhand, "poker_hands"),
			chips = G.GAME.hands[neutronhand].chips,
			mult = G.GAME.hands[neutronhand].mult,
			level = G.GAME.hands[neutronhand].level,
		})
		--level up once for each neutron star used this run
		level_up_hand(used_consumable, neutronhand, nil, 3)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
		end
	end,
	--generate_ui = 0,
}

local whiteHoleTwoPlanet = {
	object_type = "Consumable",
	set = "Planet",
	key = "whiteHoleTwoPlanet",
	config = { },
	pos = { x = 0, y = 3 },
	order = 105,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, card)
		if G.GAME and G.GAME.mostRecentHand then
		return {
			vars = {
				localize(G.GAME.mostRecentHand, "poker_hands"),
			},
		}
		else
		return {
			vars = {
				"nil",
			},
		}
		end
	end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get amount of Neutron stars use this run or set to 0 if nil
		--G.GAME.highestLevelHandName = G.GAME.highestLevelHandName or "High Card"

		--Add +1 to amount of neutron stars used this run
		--G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
		--for i = 1, 2 do
		local neutronhand = G.GAME.mostRecentHand --Random poker hand
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(neutronhand, "poker_hands"),
			chips = G.GAME.hands[neutronhand].chips,
			mult = G.GAME.hands[neutronhand].mult,
			level = G.GAME.hands[neutronhand].level,
		})
		--level up once for each neutron star used this run
		level_up_hand(used_consumable, neutronhand, nil, 2)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
		--end
	end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.mechanics_galaxyMode and G.GAME.mostRecentHand
	end,
	--generate_ui = 0,
}

local superBoosterPlanetGalaxy = {
	object_type = "Consumable",
	set = "Planet",
	key = "superBoosterPlanetGalaxy",
	config = { },
	pos = { x = 0, y = 4 },
	order = 106,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	can_use = function(self, card)
		return true
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	loc_vars = function(self, info_queue, card)
		if not G.GAME.galaxy_roundBoost_total_used_this_run then
			G.GAME.galaxy_roundBoost_total_used_this_run = 0
		end
		return {
			vars = {
				(3 - G.GAME.galaxy_roundBoost_total_used_this_run),
			},
		}
	end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	use = function(self, card, area, copier)
		if not G.GAME.galaxy_roundBoost then
			G.GAME.galaxy_roundBoost = 0
		end
		if not G.GAME.galaxy_roundBoost_total_used_this_run then
			G.GAME.galaxy_roundBoost_total_used_this_run = 0
		end
		--for iasd = 1, 3 - G.GAME.galaxy_roundBoost_total_used_this_run do
		--	local card2 = create_card("Planet", G.consumeables, nil, nil, true, nil)
		--	card2:add_to_deck()
		--	card2:set_edition("e_negative")
		--	card2:start_materialize()
		--	G.consumeables:emplace(card2)
		--end
		--G.GAME.galaxy_roundBoost = G.GAME.galaxy_roundBoost + G.GAME.galaxy_roundBoost_total_used_this_run
		G.GAME.galaxy_roundBoost_total_used_this_run = G.GAME.galaxy_roundBoost_total_used_this_run + 1
		if G.GAME.galaxy_roundBoost_total_used_this_run >= 3 then
			G.GAME.galaxy_roundBoost_total_used_this_run = 0
			--local neutronhand2 = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--local neutronhand2 = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--local _hand, _tally = nil, -1
			--for k, v in ipairs(G.handlist) do
			--	if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
			--		_hand = v
			--		_tally = G.GAME.hands[v].played
			--	end
			--end
			local levelsToRemember2 = get_lowest_hand_level()--incase this is lowest hand level or something
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = "All Hands",
				chips = "",
				mult = "",
				level = levelsToRemember2,
			})
			
			for k, eval in ipairs(G.handlist) do
				--if eval ~= _hand and eval ~= neutronhand2 then
					level_up_hand(card, eval, true, levelsToRemember2)
				--end
			end

			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = mult, chips = chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--)
		elseif G.GAME.galaxy_roundBoost_total_used_this_run >= 2 then
			local levelsToRemember2 = get_lowest_hand_level()--incase this is lowest hand level or something
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = "Lowest Lvl Hands",
				chips = "",
				mult = "",
				level = 1,
			})
			
			for k, eval in ipairs(G.handlist) do
				if G.GAME.hands[eval].level <= levelsToRemember2 then
					level_up_hand(card, eval, true, 1)
				end
			end

			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
			return {
					message = localize("k_galaxyCard_1Left"),
					card = card,
					colour = G.C.ATTENTION,
					--emult_mod = 3,
					--Xmult_mod = 3,
				
					--Xchip_mod = 3,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
		elseif G.GAME.galaxy_roundBoost_total_used_this_run >= 1 then
			local levelsToRemember2 = get_lowest_hand_level()--incase this is lowest hand level or something
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = "Lowest Lvl Hands",
				chips = "",
				mult = "",
				level = 1,
			})
			
			for k, eval in ipairs(G.handlist) do
				if G.GAME.hands[eval].level <= levelsToRemember2 then
					level_up_hand(card, eval, true, 1)
				end
			end

			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
			return {
					message = localize("k_galaxyCard_2Left"),
					card = card,
					colour = G.C.ATTENTION,
					--emult_mod = 3,
					--Xmult_mod = 3,
				
					--Xchip_mod = 3,
					--mult_mod = 3,
					--echip_mod = 3,
					--xchip_mod = 3,
					--Xchip_mod = 0,
					--chip_mod = -100,
					--if card.ability.extra.savedChipMod then
						--card.ability.extra.savedChipMod = false,
					--end
				}
		end
	end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.mechanics_galaxyMode
	end,
	--generate_ui = 0,
}

local theGeniusTarot = {
	object_type = "Consumable",
	set = "Tarot",
	key = "theGeniusTarot",
	config = { },
	pos = { x = 5, y = 3 },
	order = 1319,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	can_use = function(self, card)
		local bsvdjasdghds = 0
		for cahgsd = 0, #G.consumeables.cards do
			if G.consumeables.cards[cahgsd] and G.consumeables.cards[cahgsd] == card and (not G.consumeables.cards[cahgsd].edition or not G.consumeables.cards[cahgsd].edition.negative) then
				bsvdjasdghds = 1
			end
		end
		return #G.consumeables.cards < G.consumeables.config.card_limit or (#G.consumeables.cards <= G.consumeables.config.card_limit and bsvdjasdghds == 1)
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		if not G.GAME.galaxy_roundBoost then
			G.GAME.galaxy_roundBoost = 0
		end
		if not G.GAME.galaxy_roundBoost_total_used_this_run then
			G.GAME.galaxy_roundBoost_total_used_this_run = 0
		end
		--for iasd = 1, 3 - G.GAME.galaxy_roundBoost_total_used_this_run do
		--if then
			local card2 = create_card("Spectral", G.consumeables, nil, nil, true, nil)
			card2:add_to_deck()
			--card2:set_edition("e_negative")
			card2:start_materialize()
			G.consumeables:emplace(card2)
		--end
		--end
		--G.GAME.galaxy_roundBoost = G.GAME.galaxy_roundBoost + G.GAME.galaxy_roundBoost_total_used_this_run
	end,
	--weight = 1000,
	--freq = 1000,
	--galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_notReallyANormalTarot, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.blackGoo_chance_lowerNum < 0--only appears if black goo is extinct
	end,
	--generate_ui = 0,
}

local hyperPlanetGalaxy = {
	object_type = "Consumable",
	set = "Planet",
	key = "hyperPlanetGalaxy",
	config = { },
	pos = { x = 1, y = 4 },
	order = 107,
	atlas = "atlasnotjokers",
	aurinko = true,
	--set_card_type_badge = function(self, card, badges)
	--	badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	--end,
	can_use = function(self, card)
		return true
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and context.joker_main then
			--local neutronhand = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--if context.scoring_name == neutronhand then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1.25 },
				}),
				Xmult_mod = 1.25,
			}
			--end
		end
	end,
	use = function(self, card, area, copier)
		--G.GAME.galaxy_roundBoost = G.GAME.galaxy_roundBoost + G.GAME.galaxy_roundBoost_total_used_this_run
		--G.GAME.galaxy_roundBoost_total_used_this_run = G.GAME.galaxy_roundBoost_total_used_this_run + 1
		--if G.GAME.galaxy_roundBoost_total_used_this_run >= 3 then
			--G.GAME.galaxy_roundBoost_total_used_this_run = 0
			--local neutronhand2 = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--local neutronhand2 = get_highest_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			--local _hand, _tally = nil, -1
			--for k, v in ipairs(G.handlist) do
			--	if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
			--		_hand = v
			--		_tally = G.GAME.hands[v].played
			--	end
			--end
			--local levelsToRemember2 = get_lowest_hand_level()--incase this is lowest hand level or something
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = "All Played Hands",
				chips = "",
				mult = "",
				level = "+1",
			})
			
			for k, eval in ipairs(G.handlist) do
				if G.GAME.hands[eval].played > 0 and G.GAME.hands[eval].visible then
					level_up_hand(card, eval, true, 1)
				end
			end

			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = mult, chips = chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--)
	end,
	weight = 1000,
	freq = 1000,
	galaxyCard = true,
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(G.localization.misc.dictionary.pogoB_galaxyPlanetText, get_type_colour(self or card.config, card), nil, 1.2)
    end,
	in_pool = function(self, card)
		return G.GAME.mechanics_galaxyMode
	end,
	--generate_ui = 0,
}

local superAcension = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Holy Fuck",
	key = "superAcension",
	text = {
		--1st use of run
		"Make the entire deck acsended",
		"-1 joker slot (does not remove current jokers)",
		--2nd use of run (incredibly rare)
		"Make the entire deck godhood",
		"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 10,
	order = 102,
	pos = { x = 3, y = 4 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		if not timesUsed_superAcension_ThisRun then
			cardConvertType = "Ascended"
			jokerslotSink = 1
		end
		return true--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
		if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
			if not timesUsed_superAcension_ThisRun then
				cardConvertType = "Ascended"
				jokerslotSink = 1
			end
			return true--always allow use, but not always allow pool
		else
			return false
		end
	end,
	config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	loc_vars = function(self, info_queue, card)
		if not timesUsed_superAcension_ThisRun then
			cardConvertType = "Ascended"
			jokerslotSink = 1
		end
		if timesUsed_superAcension_ThisRun == 1 then
			info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_GodHoodCard
		else
			info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
		end
		return {
			vars = {
				cardConvertType,
				jokerslotSink,
			},
		}
	end,
	use = function(self, card, area, copier)
		if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 0 then
			G.jokers.config.card_limit = G.jokers.config.card_limit - 1
			for k, w in pairs(G.playing_cards) do
				if not (w.config.center_key == "m_pogoB_GodHoodCard") then
					w:set_ability("m_pogoB_ascendedCard")
				end
			end
			timesUsed_superAcension_ThisRun = 1
			cardConvertType = "Godhood"
			jokerslotSink = 2
		else
			G.jokers.config.card_limit = G.jokers.config.card_limit - 2
			for k, w in pairs(G.playing_cards) do
				w:set_ability("m_pogoB_GodHoodCard")
			end
			timesUsed_superAcension_ThisRun = 2
		end
	end,
}
local soulEquiv_mechanicCards = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Rules Card",
	key = "soulEquiv_mechanicCards",
	text = {
		--1st use of run
		"Next mechanic card lasts forever",
		--2nd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 10,
	order = 97,
	pos = { x = 11, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	hidden = true, --default soul_rate of 0.3% in spectral packs is used
	soul_set = "Mechanic",
	can_use = function(self, card)	
		--if not mechanic_rulesCard_used then
		--	cardConvertType = "Ascended"
		--	jokerslotSink = 1
		--end
		return true--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
		return true--not mechanic_rulesCard_used
	end,
	config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		mechanic_rulesCard_used = true
		G.GAME.mechanics_forced_rulesCard = false
		G.GAME.mechanics_soul_ruleCard = true
		use_consumable_animation(card, nil, function()
      --if #G.jokers.cards < G.jokers.config.card_limit then
        G.SETTINGS.paused = true

        local selectable_jokers = {}

		for _, v in ipairs(G.P_CENTER_POOLS.Mechanic) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
          if v.discovered and not next(SMODS.find_card(v.key))
              and not v.hidden then
            selectable_jokers[#selectable_jokers + 1] = v
          end
        end

        -- If the list of jokers is empty, we want at least one option so the user can leave the menu
        if #selectable_jokers <= 0 then
          selectable_jokers[#selectable_jokers + 1] = G.P_CENTERS.j_joker
        end

        G.FUNCS.overlay_menu {
          config = { no_esc = true },
          definition = apostle_of_wands_collection_UIBox(
            selectable_jokers,
            { 4, 4 },
            {
              no_materialize = true,
              modify_card = function(other_card, center)
                other_card.sticker = get_joker_win_sticker(center)
                create_select_card_ui(other_card, G.consumables)
              end,
              h_mod = 1.05,
            }
          ),
        }
      --end
    end)
	end,
}
local basicAcension = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Devils Deal",
	key = "basicAcension",
	text = {
		"Apply godhood to 1 random card in deck",
		"+1 ante",
	},
	--pos = { x = 0, y = 4 },
	cost = 7,
	order = 32,
	pos = { x = 6, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--weight = 100,--rare as shit
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	config = { mod_conv = "m_pogoB_GodHoodCard", max_highlighted = 1 },--rare 3 card enhancement--update even rarer 4 card enhancement (because ascended got nerfed)
	atlas = "atlasnotjokers",
	can_use = function(self, card)
		local jokerCount = 0
		if G.hand and G.hand.highlighted then
			for i = 1, #G.hand.highlighted do
				if value ~= card and G.hand.highlighted[i] and G.hand.highlighted[i].config.center_key == "m_pogoB_ascendedCard" then
					jokerCount = jokerCount + 1
				end
			end
		end
		return jokerCount == 1
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_GodHoodCard
	end,
	in_pool = function(self, card)	
		if (not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1) and G.GAME.round_resets.ante > 8 then
			--if not timesUsed_superAcension_ThisRun then
			--	cardConvertType = "Ascended"
			--	jokerslotSink = 1
			--end
			local jokerCount = 0
			--must have at least 3 noneternal jokers--highlighted
			if G.hand and G.hand.cards then
				for i = 1, #G.hand.cards do
					if G.hand.cards[i] and G.hand.cards[i].config.center_key == "m_pogoB_ascendedCard" then
						jokerCount = jokerCount + 1
					end
				end
			end
			return jokerCount > 0
			--return G.GAME.round_resets.ante > 8--only appear if beyond ante 8
		else
			return false
		end
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		--ascendedDeckApply3()
		--G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
		--G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
		--timesUsed_BASICAcension_ThisRun = 1
	end,
}
local devilDeal = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Deal with the Devil",
	key = "devilDeal",
	text = {
		"Apply ritual to entire deck",--not including already enhanced cards
		"Destroy 1 selected joker",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 30,
	pos = { x = 5, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
	end,

	in_pool = function(self, card)	
		if not timesUsed_superAcension_ThisRun and not timesUsed_BASICAcension_ThisRun then
			--if not timesUsed_superAcension_ThisRun then
			--	cardConvertType = "Ascended"
			--	jokerslotSink = 1
			--end
			return #G.jokers.cards > 0--always allow use, but not always allow pool
		else
			return false
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.eternal then
				table.insert(combinedTable, value)
			end
		end
		return (#combinedTable == 1)
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		--G.jokers.highlighted[1]:start_dissolve()
		G.jokers.highlighted[1]:flip()
		delay(0.5)
		G.jokers.highlighted[1]:set_eternal(true)
		G.jokers.highlighted[1]:juice_up(0.3, 0.3)
		delay(0.5)
		G.jokers.highlighted[1]:flip()
		delay(0.2)
		for i = 1, #G.hand.cards do
			local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("card1", percent)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		ascendedDeckApply4()
		for i = 1, #G.hand.cards do
			local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("tarot2", percent, 0.6)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		delay(0.5)
		--G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
		--G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
		timesUsed_BASICAcension_ThisRun = 1
	end,
}
local BackwardsJudgement = {
	object_type = "Consumable",
	set = "Spectral",
	name = "JudgementInReverse",
	key = "BackwardsJudgement",
	text = {
		"Destroy 1 selected joker",--cannot be eternal
		"Create a joker of a lower rarity, of your choice",
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 30,
	pos = { x = 0, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	--loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
	--end,

	in_pool = function(self, card)	
		return #G.jokers.cards > 0
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.eternal then
				table.insert(combinedTable, value)
			end
		end
		return (#combinedTable == 1) and G.jokers.highlighted[1] and G.jokers.highlighted[1].config and G.jokers.highlighted[1].config.center and G.jokers.highlighted[1].config.center.rarity and (G.jokers.highlighted[1].config.center.rarity == "pogoB_hah_mythic" or G.jokers.highlighted[1].config.center.rarity > 1)
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		local saved_rarity = G.jokers.highlighted[1].config.center.rarity
		local saved_edition = G.jokers.highlighted[1].edition
		local saved_rental = G.jokers.highlighted[1].rental
		local saved_perishable = G.jokers.highlighted[1].perishable
		local saved_temp = G.jokers.highlighted[1].perishimient
		local saved_rental = G.jokers.highlighted[1].rental
		local saved_rental = G.jokers.highlighted[1].rental
		local saved_rental = G.jokers.highlighted[1].rental
		local saved_rental = G.jokers.highlighted[1].rental

		if saved_rarity == 4 then
			saved_rarity = 5
		end
		if saved_rarity == "pogoB_hah_mythic" then
			saved_rarity = 4
		end
		--saved_rarity = 10

		G.jokers.highlighted[1]:start_dissolve()
		delay(0.5)
		use_consumable_animation(card, nil, function()
      if #G.jokers.cards < G.jokers.config.card_limit then
        G.SETTINGS.paused = true

        local selectable_jokers = {}

        for _, v in ipairs(G.P_CENTER_POOLS.Joker) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
          if v.discovered and not next(SMODS.find_card(v.key))
		      and (v.rarity == 1 or (v.rarity == 2 and saved_rarity > 2) or (v.rarity == 3 and saved_rarity > 3) or (v.rarity == "pogoB_hah_mythic" and saved_rarity > 4)) then
            selectable_jokers[#selectable_jokers + 1] = v
          end
        end

        -- If the list of jokers is empty, we want at least one option so the user can leave the menu
        if #selectable_jokers <= 0 then
          selectable_jokers[#selectable_jokers + 1] = G.P_CENTERS.j_joker
        end

        G.FUNCS.overlay_menu {
          config = { no_esc = true },
          definition = apostle_of_wands_collection_UIBox(
            selectable_jokers,
            { 5, 5, 5 },
            {
              no_materialize = true,
              modify_card = function(other_card, center)
                other_card.sticker = get_joker_win_sticker(center)
                create_select_card_ui(other_card, G.jokers)
              end,
              h_mod = 1.05,
            }
          ),
        }
      end
    end)
		--delay(0.5)
		--G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
		--G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
	end,
}

local firstVoucher = { -- DTag T1; Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "firstVoucher",
	atlas = "atlasvoucher",
	order = 201,
	pos = { x = 0, y = 1 },
	redeem = function(self, card)
		--ease_dollars(50)
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		--add_tag(Tag("tag_voucher"))
	end,
}
local firstVoucherUpgrade = { -- DTag T1; Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "firstVoucherUpgrade",
	atlas = "atlasvoucher",
	order = 202,
	requires = { "v_pogoB_firstVoucher" },
	pos = { x = 1, y = 1 },
	redeem = function(self, card)
		--ease_dollars(50)
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
	end,
}

local mechanicCardVoucher = { -- DTag T1; Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "mechanicCardVoucher",
	atlas = "atlasvoucher",
	order = 211,
	pos = { x = 0, y = 2 },
	redeem = function(self, card)
		if not G.mechanicCardDuration then 
			G.mechanicCardDuration = 4
		end
		G.mechanicCardDuration = G.mechanicCardDuration + 2
		--G.GAME.mechanics_forced_rulesCard = true--testing purposes
	end,
}
local mechanicCardVoucherUpgrade = { -- DTag T1; Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "mechanicCardVoucherUpgrade",
	atlas = "atlasvoucher",
	order = 212,
	requires = { "v_pogoB_mechanicCardVoucher" },
	pos = { x = 1, y = 2 },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_pogoB_soulEquiv_mechanicCards
	end,
	redeem = function(self, card)
		G.GAME.mechanics_forced_rulesCard = true
	end,
}
local theUltimateUpgrade_voucher_spoonOfSilver = { -- DTag T1; Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "theUltimateUpgrade_voucher_spoonOfSilver",
	atlas = "atlasvoucher",
	order = 213,
	requires = { 
		"v_pogoB_mechanicCardVoucherUpgrade", 
		"v_pogoB_firstVoucherUpgrade", 
		"v_illusion", 
		"v_antimatter", 
		"v_overstock_plus", 
		"v_liquidation", 
		"v_glow_up", 
		"v_reroll_glut", 
		"v_omen_globe", 
		"v_observatory", 
		"v_nacho_tong", 
		"v_recyclomancy", 
		"v_tarot_tycoon", 
		"v_planet_tycoon", 
		"v_money_tree", 
		"v_petroglyph", 
		"v_retcon", 
		"v_palette", 
	},
	pos = { x = 2, y = 0 },
	loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS.c_pogoB_soulEquiv_mechanicCards
	end,
	redeem = function(self, card)
		pogoB_config.silver_spoon = true
	end,
}



--------------------------------------------------------------------------------------------------
--STAMPS Code
--------------------------------------------------------------------------------------------------

-- Create collection entry for stamps
--if config.stamps_enabled then
  SMODS.current_mod.custom_collection_tabs = function()
    return {
      UIBox_button({
        button = 'your_collection_pogoB_stamps',
        id = 'your_collection_pogoB_stamps',
        label = { localize('pogoB_ui_stamps') },
        minw = 5,
        minh = 1
      })
    }
  end

  local function stamps_ui()
    local stamps = {}

    for k, v in pairs(SMODS.Stickers) do
      if is_stamp(k) then
        stamps[k] = v
      end
    end

    return SMODS.card_collection_UIBox(stamps, { 5, 5 }, {
      snap_back = true,
      hide_single_page = true,
      collapse_single_page = true,
      center = 'c_base',
      h_mod = 1.18,
      back_func = 'your_collection_other_gameobjects',
      modify_card = function(card, center)
        card.ignore_pinned = true
        center:apply(card, true)
      end,
    })
  end

  G.FUNCS.your_collection_pogoB_stamps = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
      definition = stamps_ui()
    }
  end

  local function wrap_without_stamps(func)
    -- Remove our stamps from SMODS.Stickers just for this function call
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
      if is_stamp(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
      end
    end

    local ret = func()

    -- Add them back once the UI was created
    for k, v in pairs(removed) do
      SMODS.Stickers[k] = v
    end

    return ret
  end

  -- Override the creation of the 'Stickers' tab in the collection
  local stickers_ui_ref = create_UIBox_your_collection_stickers
  create_UIBox_your_collection_stickers = function()
    return wrap_without_stamps(stickers_ui_ref)
  end

  -- Override the creation of the 'Stickers' tab in our 'Additions' tab
  local other_objects_ref = create_UIBox_Other_GameObjects
  create_UIBox_Other_GameObjects = function()
    return wrap_without_stamps(other_objects_ref)
  end
--end

---Checks if a string is a valid stamp key
---@param str string
---@return boolean
function is_stamp(str)
  for _, v in ipairs(ENABLED_stampS) do
    if 'pogoB_' .. v == str then
      return true
    end
  end
  return false
end

Stamp = SMODS.Sticker:extend {
    prefix_config = { key = true },
    should_apply = false,
    config = {},
    rate = 0,
    sets = {
      Default = true
    },

    draw = function(self, card)
      local x_offset = (card.T.w / 71) * -4 * card.T.scale
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, x_offset)
    end,

    apply = function(self, card, val)
      card.ability[self.key] = val and copy_table(self.config) or nil
    end
  }

---Checks if a card has a stamp. If found, the first value returned is the key.
---The second value returned is the config table of the supplied stamp.
---Returns nil if no stamp is on the card.
---@param card table
---@return string | nil
---@return table | nil
function has_stamp(card)
  for k, v in pairs(card and card.ability or {}) do
    if is_stamp(k) then
      return k, v
    end
  end
end

--- Counts all the stamps in the specified area and returns the count
--- @param args { area: table, allow_debuff: boolean?, exclude_highlighted: boolean? }
--- @return integer
function count_stamps(args)
  local clips = 0

  for _, v in ipairs(args.area and args.area.cards or {}) do
    local debuff_check = args.allow_debuff or not v.debuff
    local highlighted_check = not args.exclude_highlighted or not v.highlighted

    if has_stamp(v) and debuff_check and highlighted_check then
      clips = clips + 1
    end
  end

  return clips
end

--- Removes all stamp keys from this card
---@param card table
function remove_stamp(card)
  for k, _ in pairs(card and card.ability or {}) do
    if is_stamp(k) then
	  card.ability.immunity_stamp = nil
	  card.ability.aggressive_stamp = nil
	  card.ability.golden_stamp = nil
	  card.ability.nebula_stamp = nil
	  card.ability.powered_stamp = nil
	  card.ability.nebula_boost_levels = 0
	  card.ability.goldStampMoneyBonus = 0
	  card.ability.poweredBonusMult = 0
      card.ability[k] = nil
    end
  end
end

---Applies a stamp with provided type to the provided card.
---A playing card can only have a single stamp.
---@param card table
---@param type stamp
function set_stamp(card, type)
  local key = 'pogoB_' .. type

  if card and is_stamp(key) then
    remove_stamp(card)
    SMODS.Stickers[key]:apply(card, true)
  end
end

--- @param type Paperclip
--- @return table | nil
function stamp_tooltip(key)
  --local key = 'paperback_' .. type .. '_clip'
  local stamp = SMODS.Stickers[key]
  local vars = {}

  -- This may be the case if the stamp was disabled by the user
  if not stamp then return end

  if stamp.loc_vars then
    local dummy_card = { ability = {} }
    stamp:apply(dummy_card, true)
    vars = stamp:loc_vars({}, dummy_card).vars
  end

  return {
    set = 'Other',
    key = key,
    vars = vars
  }
end

--- @alias Paperclip "blue" | "black" | "white" | "red" | "orange" | "pink"
ENABLED_stampS = {
  "immunity_stamp",
  "golden_stamp",
  "powered_stamp",
  "nebula_stamp",
  --"red_clip",
  --"orange_clip",
  --"pink_clip",
  --"black_clip",
  --"white_clip",
  "aggressive_stamp",
}


-----------------------------------------------------------------------------------------------
--Actual stamps
-----------------------------------------------------------------------------------------------

Stamp {
  key = 'immunity_stamp',
  atlas = 'stamps_atlas',
  pos = { x = 0, y = 1 },
  badge_colour = G.C.GREEN,

  calculate = function(self, card, context)
	card.ability.immunity_stamp = true
	card.debuff = false
	card.ability.wheel_flipped = nil
	if card.facing == "back" then
		card:flip()
	end
  end
}

Stamp {
  key = 'golden_stamp',
  atlas = 'stamps_atlas',
  pos = { x = 2, y = 0 },
  badge_colour = G.C.MONEY,

  calculate = function(self, card, context)
	card.ability.golden_stamp = true
	if context.cardarea == "unscored" and context.main_scoring then
		if G.jokers and G.jokers.cards then
			for pasdhab, card2 in ipairs(G.jokers.cards) do
				if card2.ability and card2.ability.golden_stamp then
					if not card2.ability.goldStampMoneyBonus then
						card2.ability.goldStampMoneyBonus = 0
					end
					card2.ability.goldStampMoneyBonus = card2.ability.goldStampMoneyBonus + 5
					card2:juice_up()
				end
			end
		end
	end
  end,

  loc_vars = function(self, info_queue, card)
	if not card.ability.goldStampMoneyBonus then
		card.ability.goldStampMoneyBonus = 0
	end
	return {
		vars = {
			card.ability.goldStampMoneyBonus,
		},
	}
  end,
}

Stamp {
  key = 'powered_stamp',
  atlas = 'stamps_atlas',
  pos = { x = 3, y = 0 },
  badge_colour = G.C.ORANGE,

  calculate = function(self, card, context)
	card.ability.powered_stamp = true
  end,

  loc_vars = function(self, info_queue, card)
	if not card.ability.poweredBonusMult then
		card.ability.poweredBonusMult = 0
	end
	return {
		vars = {
			card.ability.poweredBonusMult,
		},
	}
  end,
}

Stamp {
  key = 'nebula_stamp',
  atlas = 'stamps_atlas',
  pos = { x = 2, y = 1 },
  badge_colour = G.C.BLUE,

  calculate = function(self, card, context)
	card.ability.nebula_stamp = true
  end,

  loc_vars = function(self, info_queue, card)
	if not card.ability.nebula_boost_levels then
		card.ability.nebula_boost_levels = 0
	end
	return {
		vars = {
			card.ability.nebula_boost_levels,
		},
	}
  end,
}

--flight risk stamp
Stamp {
  key = 'aggressive_stamp',
  atlas = 'stamps_atlas',
  pos = { x = 3, y = 1 },
  badge_colour = G.C.RED,

  calculate = function(self, card, context)
	card.ability.aggressive_stamp = true
  end,
}

-------------------------------------------------------------------
--Stamp spectrals
-------------------------------------------------------------------

local spectral_immunity_stamp = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Vaccine",
	key = "spectral_immunity_stamp",
	text = {
		"Select upto 5 cards or 1 joker",--not including already enhanced cards
		"Apply immunity_stamp to selection",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 23,
	pos = { x = 0, y = 2 },
	--order = 5,
	stamp_converter = true,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = stamp_tooltip("pogoB_immunity_stamp")
		if G.hand and G.hand.config and G.hand.config.highlighted_limit then
			return {
				vars = {
					G.hand.config.highlighted_limit,
				},
			}
		else
			return {
				vars = {
					5,
				},
			}
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				table.insert(combinedTable, value)
			end
		end
		local combinedTable2 = {}
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				table.insert(combinedTable2, value)
			end
		end
		--if you have the selection collectible, this is the secret synergy/its only real purpose
		--and not (#combinedTable >= 1 and #combinedTable2 >= 1)
		return (#combinedTable == 1 or (#combinedTable2 <= 6 and #combinedTable2 >= 1)) 
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
				delay(0.5)
				set_stamp(value, "immunity_stamp")
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				set_stamp(value, "immunity_stamp")
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.5)
	end,
}

local spectral_golden_stamp = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Greed",
	key = "spectral_golden_stamp",
	text = {
		"Select upto 5 cards or 1 joker",--not including already enhanced cards
		"Apply golden_stamp to selection",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 24,
	pos = { x = 1, y = 2 },
	--order = 5,
	stamp_converter = true,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = stamp_tooltip("pogoB_golden_stamp")
		if G.hand and G.hand.config and G.hand.config.highlighted_limit then
			return {
				vars = {
					G.hand.config.highlighted_limit,
				},
			}
		else
			return {
				vars = {
					5,
				},
			}
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				table.insert(combinedTable, value)
			end
		end
		local combinedTable2 = {}
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				table.insert(combinedTable2, value)
			end
		end
		--if you have the selection collectible, this is the secret synergy/its only real purpose
		--and not (#combinedTable >= 1 and #combinedTable2 >= 1)
		return (#combinedTable == 1 or (#combinedTable2 <= 6 and #combinedTable2 >= 1)) 
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
				delay(0.5)
				set_stamp(value, "golden_stamp")
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				set_stamp(value, "golden_stamp")
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.5)
	end,
}

local spectral_powered_stamp = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Greed",
	key = "spectral_powered_stamp",
	text = {
		"Select upto 5 cards or 1 joker",--not including already enhanced cards
		"Apply powered_stamp to selection",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 25,
	pos = { x = 2, y = 2 },
	--order = 5,
	stamp_converter = true,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = stamp_tooltip("pogoB_powered_stamp")
		if G.hand and G.hand.config and G.hand.config.highlighted_limit then
			return {
				vars = {
					G.hand.config.highlighted_limit,
				},
			}
		else
			return {
				vars = {
					5,
				},
			}
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				table.insert(combinedTable, value)
			end
		end
		local combinedTable2 = {}
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				table.insert(combinedTable2, value)
			end
		end
		--if you have the selection collectible, this is the secret synergy/its only real purpose
		--and not (#combinedTable >= 1 and #combinedTable2 >= 1)
		return (#combinedTable == 1 or (#combinedTable2 <= 6 and #combinedTable2 >= 1)) 
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
				delay(0.5)
				set_stamp(value, "powered_stamp")
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				set_stamp(value, "powered_stamp")
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.5)
	end,
}

local spectral_nebula_stamp = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Greed",
	key = "spectral_nebula_stamp",
	text = {
		"Select upto 5 cards or 1 joker",--not including already enhanced cards
		"Apply nebula_stamp to selection",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 26,
	pos = { x = 3, y = 2 },
	--order = 5,
	stamp_converter = true,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = stamp_tooltip("pogoB_nebula_stamp")
		if G.hand and G.hand.config and G.hand.config.highlighted_limit then
			return {
				vars = {
					G.hand.config.highlighted_limit,
				},
			}
		else
			return {
				vars = {
					5,
				},
			}
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				table.insert(combinedTable, value)
			end
		end
		local combinedTable2 = {}
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				table.insert(combinedTable2, value)
			end
		end
		--if you have the selection collectible, this is the secret synergy/its only real purpose
		--and not (#combinedTable >= 1 and #combinedTable2 >= 1)
		return (#combinedTable == 1 or (#combinedTable2 <= 6 and #combinedTable2 >= 1)) 
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
				delay(0.5)
				set_stamp(value, "nebula_stamp")
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				set_stamp(value, "nebula_stamp")
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.5)
	end,
}

local spectral_aggressive_stamp = {
	object_type = "Consumable",
	set = "Spectral",
	name = "Greed",
	key = "spectral_aggressive_stamp",
	text = {
		"Select upto 5 cards or 1 joker",--not including already enhanced cards
		"Apply aggressive_stamp to selection",--cannot be eternal
	},
	--pos = { x = 0, y = 4 },
	cost = 4,
	order = 27,
	pos = { x = 4, y = 2 },
	--order = 5,
	stamp_converter = true,
	atlas = "atlasnotjokers",
	--weight = 100,--normal weight
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = stamp_tooltip("pogoB_aggressive_stamp")
		if G.hand and G.hand.config and G.hand.config.highlighted_limit then
			return {
				vars = {
					G.hand.config.highlighted_limit,
				},
			}
		else
			return {
				vars = {
					5,
				},
			}
		end
	end,
	can_use = function(self, card)
		local combinedTable = {}
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient and value.config and value.config.center and value.config.center.blueprint_compat then--cannot be used on temporary jokers
				table.insert(combinedTable, value)
			end
		end
		local combinedTable2 = {}
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				table.insert(combinedTable2, value)
			end
		end
		--if you have the selection collectible, this is the secret synergy/its only real purpose
		--and not (#combinedTable >= 1 and #combinedTable2 >= 1)
		return (#combinedTable == 1 or (#combinedTable2 <= 6 and #combinedTable2 >= 1)) 
	end,
	--config = { cardConvertType = "Ascended", jokerslotSink = 1 },
	use = function(self, card, area, copier)
		for _, value in ipairs(G.jokers.highlighted) do
			if value ~= card and not value.ability.perishimient then--cannot be used on temporary jokers
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
				delay(0.5)
				set_stamp(value, "aggressive_stamp")
				value:flip()
				play_sound("card1", 1)
				value:juice_up(0.3, 0.3)
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		for _, value in ipairs(G.hand.highlighted) do
			if value ~= card then
				set_stamp(value, "aggressive_stamp")
			end
		end
		if G.hand.highlighted and #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.5)
	end,
}

local spectrals = {
	white_hole,
	--cheesypack,--joke pack
	mythic_tag,
	antimatter_joker_tag,
	common_tag_butUseful,
	--garden,
	blankCardEnhance,
	--perfectionhance,--extremely unbalanced (i wanted to have fun)
	instability,
	royaltyPlante,
	recentHandPlanet,
	randomHandPlanet,
	worm_hole,
	wraithMythicVersion,
	gasterAHand,--currently does not work, hides the hand but planets still spawn--update: it works--update: sort of works--update: it works enough
	celestialCard,
	celesteTarot,
	ascendedCard,
	hatchlingCard,
	ritualTarot,
	firstVoucher,
	superAcension,
	firstVoucherUpgrade,
	mechanicCardVoucher,
	mechanicCardVoucherUpgrade,
	--BlackJack,
	GodHoodCard,
	basicAcension,
	devilDeal,
	whiteHoleTwoPlanet,
	superBoosterPlanetGalaxy,
	hyperPlanetGalaxy,
	ceilingSpectralPlanet,
	spectral_immunity_stamp,
	spectral_golden_stamp,
	spectral_powered_stamp,
	spectral_nebula_stamp,
	spectral_aggressive_stamp,
	--mosaic_shader,
	--mosaic,
	soul_but_weaker,
	ectoplasm_butdifferent,
	soulEquiv_mechanicCards,
	black_goo,
	blackJackPlanet,--
	ascendedSpectral,
	death_but_for_jokers_spectral,
	--theGeniusTarot,
	BackwardsJudgement,
	--crazy_seal,
	--typhoon,
	--theUltimateUpgrade_voucher_spoonOfSilver,
}

function apostle_of_wands_collection_UIBox(_pool, rows, args)
  args = args or {}
  args.w_mod = args.w_mod or 1
  args.h_mod = args.h_mod or 1
  args.card_scale = args.card_scale or 1
  local deck_tables = {}
  local pool = SMODS.collection_pool(_pool)

  G.your_collection = {}
  local cards_per_page = 0
  local row_totals = {}
  for j = 1, #rows do
    if cards_per_page >= #pool and args.collapse_single_page then
      rows[j] = nil
    else
      row_totals[j] = cards_per_page
      cards_per_page = cards_per_page + rows[j]
      G.your_collection[j] = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        (args.w_mod * rows[j] + 0.25) * G.CARD_W,
        args.h_mod * G.CARD_H,
        { card_limit = rows[j], type = args.area_type or 'title', highlight_limit = 0, collection = true }
      )
      table.insert(deck_tables,
        {
          n = G.UIT.R,
          config = { align = "cm", padding = 0.07, no_fill = true },
          nodes = {
            { n = G.UIT.O, config = { object = G.your_collection[j] } }
          }
        })
    end
  end

  local options = {}
  for i = 1, math.ceil(#pool / cards_per_page) do
    table.insert(
      options,
      localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#pool / cards_per_page))
    )
  end

  G.FUNCS.paperback_card_collection_page = function(e)
    if not e or not e.cycle_config then return end
    for j = 1, #G.your_collection do
      for i = #G.your_collection[j].cards, 1, -1 do
        local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
        c:remove()
        c = nil
      end
    end
    for j = 1, #rows do
      for i = 1, rows[j] do
        local center = pool[i + row_totals[j] + (cards_per_page * (e.cycle_config.current_option - 1))]
        if not center then break end
        local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
          G.CARD_W * args.card_scale, G.CARD_H * args.card_scale, G.P_CARDS.empty,
          (args.center and G.P_CENTERS[args.center]) or center)
        if args.modify_card then args.modify_card(card, center, i, j) end
        if not args.no_materialize then card:start_materialize(nil, i > 1 or j > 1) end
        G.your_collection[j]:emplace(card)
      end
    end
    INIT_COLLECTION_CARD_ALERTS()
  end

  G.FUNCS.paperback_card_collection_page { cycle_config = { current_option = 1 } }

  local t = create_UIBox_generic_options({
    back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or 'your_collection',
    snap_back = args.snap_back,
    infotip = args.infotip,
    no_back = true,
    contents = {
      { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
      (not args.hide_single_page or cards_per_page < #pool) and {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          create_option_cycle({
            options = options,
            w = 4.5,
            cycle_shoulders = true,
            opt_callback = 'paperback_card_collection_page',
            current_option = 1,
            colour = G.C.RED,
            no_pips = true,
            focus_args = { snap_to = true, nav = 'wide' }
          })
        }
      } or nil,
    }
  })
  return t
end

G.FUNCS.paperback_select_joker = function(e)
  local c1 = e.config.ref_table

  if c1 and c1.is and type(c1.is) == "function" and c1:is(Card) then
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        G.SETTINGS.paused = false
        if G.OVERLAY_MENU ~= nil then
          G.OVERLAY_MENU:remove()
          G.OVERLAY_MENU = nil
        end

        SMODS.add_card {
          key = c1.config.center_key,
          area = e.config.data[1]
        }

        return true
      end
    }))
  end
end

function create_select_card_ui(card, area)
  local t2 = {
    n = G.UIT.ROOT,
    config = {
      ref_table = card,
      minw = 0.6,
      padding = 0.1,
      align = 'bm',
      colour = G.C.GREEN,
      shadow = true,
      r = 0.08,
      minh = 0.3,
      one_press = true,
      button = 'paperback_select_joker',
      data = { area },
      hover = true
    },
    nodes = {
      {
        n = G.UIT.T,
        config = {
          text = localize('paperback_ui_select'),
          colour = G.C.WHITE,
          scale = 0.42
        }
      }
    }
  }

  card.children.select_button = UIBox {
    definition = t2,
    config = {
      align = "bm",
      offset = { x = -0, y = -0.15 },
      major = card,
      bond = 'Weak',
      parent = card
    }
  }
end

---@param card table?
---@param cards_to_flip table?
---@param action function?
---@param sound string?
function use_consumable_animation(card, cards_to_flip, action, sound)
  -- If it's not a list, make it one
  if cards_to_flip and not cards_to_flip[1] then
    cards_to_flip = { cards_to_flip }
  end

  if card then
    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound(sound or 'tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    })
  end

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 1.15 - (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      })
    end

    delay(0.2)
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.1,
    func = function()
      if action and type(action) == "function" then
        action()
      end
      return true
    end
  })

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 0.85 + (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)

          -- Update the sprites of cards
          if c.config and c.config.center then
            c:set_sprites(c.config.center)
          end
          if c.ability then
            c.front_hidden = c:should_hide_front()
          end

          return true
        end
      })
    end
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.2,
    func = function()
      G.hand:unhighlight_all()
      return true
    end
  })

  if cards_to_flip then
    delay(0.5)
  end
end

return {
	name = "Spectrals",
	items = spectrals,
}
