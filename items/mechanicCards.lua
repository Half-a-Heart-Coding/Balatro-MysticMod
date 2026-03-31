local mechanic = {
	object_type = "ConsumableType",
	key = "Mechanic",
	primary_colour = HEX("0cb39c"),
	secondary_colour = HEX("9ed927"),
	collection_rows = { 4, 4 }, -- 4 pages for all code cards
	shop_rate = 0.0,
	loc_txt = {},
	default = "c_pogoB_galaxyMode",
	can_stack = true,
	can_divide = true,
}

--local code_digital_hallucinations_compat = {
--	colour = HEX("14b341"),
--	loc_key = "onionGrater",
--	create = function()
--		local ccard = create_card("Mechanic", G.consumeables, nil, nil, nil, nil, nil, "diha")
--		ccard:set_edition({ negative = true }, true)
--		ccard:add_to_deck()
--		G.consumeables:emplace(ccard)
--	end,
--}
-- Mechanic Pack, 1/2
local mech_pack1 = {
	--dependencies = {
	--	items = {
	--		"set_cry_code",
	--	},
	--},
	object_type = "Booster",
	key = "mechanic_normal_1",
	kind = "Mechanic",
	atlas = "pack",
	pos = { x = 1, y = 2 },
	config = { extra = 2, choose = 1 },
	cost = 5,
	order = 805,
	weight = 1.4,
	create_card = function(self, card)
		--if G.GAME.mechanics_forced_rulesCard then
		--	G.GAME.mechanics_forced_rulesCard = false
		--	return create_card("Mechanic", G.pack_cards, nil, nil, true, true, "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards")
		--else
			return create_card("Mechanic", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		--end
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Mechanic)
		ease_background_colour({ new_colour = G.C.SET.Mechanic, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	in_pool = function()
		return true
	end,
	group_key = "k_pogoB_mechanic_pack",
	--cry_digital_hallucinations = code_digital_hallucinations_compat,
}

-- Mechanic Pack, 1/3
local mech_pack2 = {
	--dependencies = {
	--	items = {
	--		"set_cry_code",
	--	},
	--},
	object_type = "Booster",
	key = "mechanic_jumbo_1",
	kind = "Mechanic",
	atlas = "pack",
	pos = { x = 2, y = 2 },
	config = { extra = 3, choose = 1 },
	cost = 7,
	order = 806,
	weight = 0.6,
	create_card = function(self, card)
		if G.GAME.mechanics_forced_rulesCard then
			G.GAME.mechanics_forced_rulesCard = false
			return create_card("Mechanic", G.pack_cards, nil, nil, true, true, "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards")
		else
			return create_card("Mechanic", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		end
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Mechanic)
		ease_background_colour({ new_colour = G.C.SET.Mechanic, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	in_pool = function()
		return true
	end,
	group_key = "k_pogoB_mechanic_pack",
	--cry_digital_hallucinations = code_digital_hallucinations_compat,
}

local crazy_pack1 = {
	--dependencies = {
	--	items = {
	--		"set_cry_code",
	--	},
	--},
	object_type = "Booster",
	key = "crazy_normal_1",
	kind = "Crazy",
	atlas = "pack",
	pos = { x = 3, y = 2 },
	config = { extra = 7, choose = 2 },
	cost = 0,
	order = 806,
	draw_hand = true,
	weight = 0,
	create_card = function(self, card)
		--if G.GAME.mechanics_forced_rulesCard then
		--	G.GAME.mechanics_forced_rulesCard = false
		--	return create_card("Mechanic", G.pack_cards, nil, nil, true, true, "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards", "c_pogoB_soulEquiv_mechanicCards")
		--else
		G.GAME.mechanics_crazy_pack_open = true
		local proasjdas = math.random()
		--G.FUNCS.draw_from_deck_to_hand()
		--local cardCreated = create_card("Booster", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		--	cardCreated.price:remove()
		--	cardCreated.price = nil
		--	cardCreated.cost = 0
		--return cardCreated
		--return create_card("Play", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		if proasjdas > 0.997 then
			return create_card("Joker", G.jokers, nil, "pogoB_hah_mythic2", nil, nil, nil, "j_pogoB_anitmater")
		elseif proasjdas >= 0.8 then
			return create_card("Spectral", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		elseif proasjdas >= 0.6 then
			return create_card("Tarot", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		elseif proasjdas >= 0.4 then
			local _edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, true)
        	local _seal = SMODS.poll_seal({mod = 10})
        	return {set = (pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base", edition = _edition, seal = _seal, area = G.pack_cards, skip_materialize = true, soulable = false, key_append = "cry_program_1"}
		elseif proasjdas >= 0.2 then
			return create_card("Joker", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		else
			return create_card("Planet", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
		end
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.DARK_EDITION)
		ease_background_colour({ new_colour = G.ARGS.LOC_COLOURS['pink'], special_colour = G.ARGS.LOC_COLOURS['mythic'], contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	in_pool = function()
		return false
	end,
	group_key = "k_pogoB_mechanic_pack",
	--cry_digital_hallucinations = code_digital_hallucinations_compat,
}

local theMerge = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Holy Fuck 2",
	key = "theMerge",
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
	cost = 9,
	order = 100,
	pos = { x = 7, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return true--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
			return false
	--	end
	end,
	use = function(self, card, area, copier)
		SMODS.change_voucher_limit(1)
	end,
}

local theMergeTrue = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Here we go",
	key = "theMergeTrue",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 1,
	pos = { x = 7, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_theMerge--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_theMerge
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_theMerge = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_merge_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_merge_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local tagsOnBlind = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Here we go 2",
	key = "tagsOnBlind",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 2,
	pos = { x = 8, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_tagsOnBlind--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_tagsOnBlind
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_tagsOnBlind = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_blindtags_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_blindtags_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local threadTheNeedle = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Here we go 3",
	key = "threadTheNeedle",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 3,
	pos = { x = 9, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_threadTheNeedle
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_threadTheNeedle
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_threadTheNeedle = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_needle_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_needle_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}


local galaxyMode = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Here we go 4 door sedan",
	key = "galaxyMode",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 4,
	pos = { x = 10, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_galaxyMode
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_galaxyMode
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_galaxyMode = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_galaxy_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_galaxy_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local discardBanishment = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Corbinlosh",
	key = "discardBanishment",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 5,
	pos = { x = 7, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_discardBanishment
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_discardBanishment
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_discardBanishment = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_banish_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_banish_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local mirrorDeckButNowMechanic = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Habenstrwathsfusn",
	key = "mirrorDeckButNowMechanic",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 6,
	pos = { x = 8, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_mirrorDeckButNowMechanic
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_mirrorDeckButNowMechanic
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_mirrorDeckButNowMechanic = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_mirror_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_mirror_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local boosterPacksInShop_likeInSpotsWhereJokersShouldBe = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "kHHGhudsgfjbdhfgasydgjasbdhasgdygfhjasvfgfhbg",
	key = "boosterPacksInShop_likeInSpotsWhereJokersShouldBe",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 7,
	pos = { x = 9, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_booster_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_booster_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local rareSacrifice_mythicGain = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "asdfashkfadhfdsigfewqyhashjqywqyuiyqw",
	key = "rareSacrifice_mythicGain",
	text = {
		--1st use of run
		"Merge hands and discards",
		"You can discard unlimited cards per discard",
		--2nd use of run (incredibly rare)
		--"Make the entire deck godhood",
		--"-2 joker slots (does not remove current jokers)",
		--3rd use is not possible
	},
	--pos = { x = 0, y = 4 },
	cost = 5,
	order = 8,
	pos = { x = 10, y = 1 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return not G.GAME.mechanics_rareSacrifice_mythicGain
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
	--		return false
	--	end
		return not G.GAME.mechanics_rareSacrifice_mythicGain
	end,
	config = { type = "mechanic_trigger", rounds_to_last = G.mechanicCardDuration or 4 },
	loc_vars = function(self, info_queue, card)
		if G.GAME.mechanics_soul_ruleCard then
			return {
				vars = {
					"infinite",
				},
			}
		elseif  G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
			return {
				vars = {
					6,
				},
			}
		else
			return {
				vars = {
					4,
				},
			}
		end
	end,
	use = function(self, card, area, copier)
		G.GAME.mechanics_rareSacrifice_mythicGain = true
		if not G.GAME.mechanics_soul_ruleCard then
			if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
				add_tag(Tag("tag_pogoB_mythic_mech_tag2"))
			else
				add_tag(Tag("tag_pogoB_mythic_mech_tag"))
			end
		else
			G.GAME.mechanics_soul_ruleCard = false
		end
		card:start_dissolve()
	end,
}

local jokerCalcs = Card.calculate_joker
function Card:calculate_joker(context)
	if (context.repetition) and context.cardarea == G.play then
		hypoAggro = 0
		hypoAggroooo = 0
		for pasdhab, card2 in ipairs(context.scoring_hand) do
			hypoAggroooo = hypoAggroooo + 1
			if card2.ability and card2.ability.aggressive_stamp then
				hypoAggro = hypoAggro + 1
			end
		end
		if hypoAggro >= hypoAggroooo then
			for pasdhab, card2 in ipairs(context.scoring_hand) do
				if card2.ability and card2.ability.aggressive_stamp then
					--if G.jokers and G.jokers.cards then
						--card2.ability.hyperAgrro = 0
						--for pasdhab, card3 in ipairs(G.jokers.cards) do
							if self.ability and self.ability.aggressive_stamp then
								return {
									message = localize("k_again_ex"),
									repetitions = 1,
									card = card,
								}
							end
						--end
						--if context.repetition then
							--if context.cardarea == G.play then
							
							--end
						--end
					--end
				
				end
			end
		end
	end
	if G.GAME.modifiers.permanent_psychic then
		--if not G.boss_throw_hand then
			if context.full_hand and #context.full_hand < 5 and G.play ~= nil and G.play.cards ~= nil and #G.play.cards > 0 then
				if context.joker_main then
					card_eval_status_text(
						self,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_nope_ex"), colour = G.C.FILTER }
					)
					--return false
				end
				if context.before or context.after or context.scoring_hand or context.full_hand then
					return false
				end
			end
		--end
	end
	if self.ability and self.ability.aggressive_stamp and 1==2 then
		local celesteCards = 0
		for i = 0, #G.play.cards do
			if G.play.cards[i] and G.play.cards[i].ability and G.play.cards[i].ability.aggressive_stamp then
				celesteCards = celesteCards + 1
			end
		end
		if context.scoring_hand and celesteCards >= #context.scoring_hand then
			local active_side = self
			local ret, trig = jokerCalcs(active_side, context)
			return ret, trig
		else
			if context.joker_main then
				card_eval_status_text(
					self,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_nope_ex"), colour = G.C.FILTER }
				)
				--return false
			end
			if context.before or context.after or context.scoring_hand or context.full_hand then
				return false
			end
		end
	end
	local active_side = self
	local ret, trig = jokerCalcs(active_side, context)
	return ret, trig
	--return jokerCalcs
end

function calculate_joker_again_for_advancedBlueprintStuff(card, context)
	local ret, trig = jokerCalcs(card, context)
	return ret, trig
	--return jokerCalcs
end

--------------------------------------------------------------
--this is where the actual code to make mechanic cards work is
--------------------------------------------------------------
local smcc = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
	local ret = smcc(context, return_table)

	if G.GAME.GodHoodDeck then
		if #SMODS.find_card("j_credit_card") <= 0 then
			if G.GAME.dollars < G.GAME.interest_cap then
				G.GAME.bankrupt_at = G.GAME.interest_cap
			else
				G.GAME.bankrupt_at = 0--allow purchases but only 1 when at/above interest_cap but only barely
			end
		else
			G.GAME.bankrupt_at = -10
		end
		if #SMODS.find_card("v_clearance_sale") <= 0 then
			G.GAME.discount_percent = -99
		elseif #SMODS.find_card("v_liquidation") <= 0 then
			G.GAME.discount_percent = -40
		else
			G.GAME.discount_percent = 10
		end
	end
	--if G.GAME.hands then
	--	for ass = 0, #G.GAME.hands do
	--		if G.GAME.hands[ass] and G.GAME.hands[ass].sentToTheVoid then 
	--			G.GAME.hands[ass].visible = false
	--			G.GAME.hands[ass].played = 0
	--			G.GAME.hands[ass].chips = 0
	--			G.GAME.hands[ass].mult = 0
	--			G.GAME.hands[ass].s_chips = 0
	--			G.GAME.hands[ass].s_mult = 0
	--			G.GAME.hands[ass].l_chips = 0
	--			G.GAME.hands[ass].l_mult = 0
	--		end
	--	end
	--end
	if G.GAME.mechanics_theMerge then--merge hands + discards, discard any number of cards at a time
		--G.GAME.cry_highlight_limit = 9999
		--G.hand.config.highlighted_limit = 9999
		--G.play.card_limit = 9999
		--G.config.highlight_limit = 9999
		--G.GAME.config.highlight_limit = 9999
		--config.highlight_limit = 9999
		--G.GAME.modifiers.cry_highlight_limit = 9999
		if context.setting_blind and G.GAME.round_resets and G.GAME.round_resets.hands and G.GAME.round_resets.discards then
			local savedHandsTemp = G.GAME.round_resets.hands
			local savedDiscardsTemp = G.GAME.round_resets.discards
			ease_discard(savedHandsTemp)
			if not G.GAME.mechanics_threadTheNeedle then
				ease_hands_played(savedDiscardsTemp)
			end
			G.hand:change_size(1)
			if not G.GAME.handSizeChangeMerge then
				G.GAME.handSizeChangeMerge = 0
			end
			G.GAME.handSizeChangeMerge = G.GAME.handSizeChangeMerge - 1
			--G.GAME.round_resets.discards = G.GAME.round_resets.discards + savedHandsTemp 
			--G.GAME.round_resets.hands = G.GAME.round_resets.hands + savedDiscardsTemp 
		end
		if context.before and context.full_hand then
			--G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
			ease_discard(-1)
			if not G.GAME.handSizeChangeMerge then
				G.GAME.handSizeChangeMerge = 0
			end
			if G.GAME.handSizeChangeMerge < 0 then
				G.hand:change_size(-1)
				G.GAME.handSizeChangeMerge = G.GAME.handSizeChangeMerge + 1
			end
			--local eval = evaluate_poker_hand(context.full_hand)
			--G.GAME.hands[eval].played = G.GAME.hands[eval].played + 1
			--ease_hands_played(savedDiscardsTemp)
			--G.GAME.round_resets.hands = G.GAME.round_resets.hands + savedDiscardsTemp 
		end
		if context.discard and context.other_card == context.full_hand[#context.full_hand] then
			--ease_discard(savedHandsTemp)
			if not G.GAME.mechanics_threadTheNeedle then
				ease_hands_played(-1)
			end
			--if not G.GAME.round_bonus.next_hands then
			--	G.GAME.round_bonus.next_hands = 0
			--end
			--G.GAME.round_bonus.next_hands = G.GAME.round_bonus.next_hands + 1
			--G.hand:change_size(1)
			--if not G.GAME.handSizeChangeMerge then
			--	G.GAME.handSizeChangeMerge = 0
			--end
			--G.GAME.handSizeChangeMerge = G.GAME.handSizeChangeMerge - 1
			--G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
			--G.GAME.round_resets.hands = G.GAME.round_resets.hands + savedDiscardsTemp 
		end
		if
			--context.skip_blind
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.handSizeChangeMerge
		--	and G.GAME.blind.boss
		then
			--just in case
			G.hand:change_size(G.GAME.handSizeChangeMerge)
			G.GAME.handSizeChangeMerge = 0
		end
	end

	if G.GAME.hands and G.GAME.hands["pogoB_BlackJack"] and G.GAME.hands["pogoB_BlackJack"].visible and G.GAME.hands["pogoB_BlackJack"].level == 21 then
		--this is a very random feature that no one will see nor benefit from
		--G.GAME.hands["pogoB_BlackJack"].l_mult = G.GAME.hands["pogoB_BlackJack"].level
		--G.GAME.hands["pogoB_BlackJack"].l_chips = 0
		if context.poker_hands ~= nil and next(context.poker_hands["pogoB_BlackJack"]) and context.before then 
			ease_dollars(21)
		end
	end

	if G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe and context.starting_shop then
      --card.ability.triggered = false
      -- Adds a free booster to the shop
      G.E_MANAGER:add_event(Event {
        func = function()
          local booster = SMODS.add_booster_to_shop('p_pogoB_crazy_normal_1')
          booster.ability.couponed = true
          booster:set_cost()
          return true
        end
      })
    end


	if G.GAME.mechanics_tagsOnBlind and 1 == 2 then--gain skip tag of blind when beaten, gain $5 when a blind is skipped--old function, now it is not this
		--G.GAME.cry_highlight_limit = 9999
		--G.hand.config.highlighted_limit = 9999
		--G.play.card_limit = 9999
		--G.config.highlight_limit = 9999
		--G.GAME.config.highlight_limit = 9999
		--config.highlight_limit = 9999
		--G.GAME.modifiers.cry_highlight_limit = 9999
		if
			--context.skip_blind
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			--and not G.GAME.blind.boss
		then
			G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1")
				local tag = nil
				local type = G.GAME.blind:get_type()
				if type == "Boss" or G.GAME.round_resets.blind_tags[type] == "tag_boss" then
					tag = Tag(get_next_tag_key())
				else
					tag = Tag(G.GAME.round_resets.blind_tags[type])
				end
				if tag == Tag("tag_boss") then
					while tag == Tag("tag_boss") do
						tag = Tag(_tag.config.ref_table.key, false, _tag.config.ref_table.ability.blind_type)
					end
				end
				if type == "Boss" and tag == Tag("tag_orbital") then
					while tag == Tag("tag_orbital") or tag == Tag("tag_boss") do
						tag = Tag(_tag.config.ref_table.key, false, _tag.config.ref_table.ability.blind_type)
					end
				end
				add_tag(tag)
				--used_consumable:juice_up(0.8, 0.5)
				return true
			end,
		}))
		end

		if
			context.skip_blind
			--context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			--and not G.GAME.blind.boss
		then
			--ease_dollars(5)
		end
	end

	if G.GAME.mechanics_threadTheNeedle then--only 1 hand, double poker level
		if context.setting_blind and G.GAME.round_resets and G.GAME.round_resets.hands then
			local hands_toRemove = G.GAME.round_resets.hands - 1
			ease_hands_played(-hands_toRemove)
			ease_discard(hands_toRemove)
			add_tag(Tag("tag_pogoB_mythic"))
		end
		if G.play and G.play.cards and context.before then--context.main_scoring and--and G.GAME.current_round.hands_left == 0
			local eval = context.scoring_name
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = localize(eval, "poker_hands"),
				chips = G.GAME.hands[eval].chips,
				mult = G.GAME.hands[eval].mult,
				level = G.GAME.hands[eval].level,
			})
			G.GAME.levels_to_memberRe_needleThread = G.GAME.hands[eval].level
			ease_dollars(G.GAME.levels_to_memberRe_needleThread * 2)
			level_up_hand(self, eval, true, G.GAME.hands[eval].level)
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = G.GAME.hands[eval].mult, chips = G.GAME.hands[eval].chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			)
		end
		if G.play and G.play.cards and context.after and G.GAME.levels_to_memberRe_needleThread then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1--and G.GAME.current_round.hands_left == 0
			local eval = context.scoring_name
			--update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			--	handname = localize(eval, "poker_hands"),
			--	chips = G.GAME.hands[eval].chips,
			--	mult = G.GAME.hands[eval].mult,
			--	level = G.GAME.hands[eval].level,
			--})
			
			level_up_hand(self, eval, true, (G.GAME.levels_to_memberRe_needleThread) * -1)--reset poker hand level
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = 0, chips = 0, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--)
		end
	end

	if G.deck and G.deck.cards then
		for pasdhab, card2 in ipairs(G.deck.cards) do
			if card2.ability and card2.ability.immunity_stamp then
				card2.debuff = false
				--card2.ability.wheel_flipped = nil
				--if card2.facing == "back" then
				--	card2:flip()
				--end
			end
		end
	end

	if G.hand and G.hand.cards then
		for pasdhab, card2 in ipairs(G.hand.cards) do
			if card2.ability and card2.ability.immunity_stamp then
				card2.debuff = false
				--card2.ability.wheel_flipped = nil
				--if card2.facing == "back" then
				--	card2:flip()
				--end
			end
		end
	end

	if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
		G.mechanicCardDuration = 6
	else
		G.mechanicCardDuration = 4
	end

	if context.scoring_hand and #context.scoring_hand > 0 then
		for pasdhab, card2 in ipairs(context.scoring_hand) do
			if card2.ability and card2.ability.powered_stamp then
				if not card2.ability.poweredBonusMult then
					card2.ability.poweredBonusMult = 0
				end
				if context.before and G.jokers and G.jokers.cards then
					for pasdhab, card3 in ipairs(G.jokers.cards) do
						if card3.ability and card3.ability.powered_stamp then
							card2.ability.poweredBonusMult = card2.ability.poweredBonusMult + 1
						end
					end
				end
				if mult then
					mult = mult + card2.ability.poweredBonusMult
				end
			end
		end
	end

	if (context.repetition) and context.cardarea == G.play then
		for pasdhab, card2 in ipairs(context.scoring_hand) do
			if card2.ability and card2.ability.aggressive_stamp then
				if G.jokers and G.jokers.cards then
					card2.ability.hyperAgrro = 0
					for pasdhab, card3 in ipairs(G.jokers.cards) do
						if card3.ability and card3.ability.aggressive_stamp then
							return {
								message = localize("k_again_ex"),
								repetitions = 1,
								card = card,
							}
						end
					end
					--if context.repetition then
						--if context.cardarea == G.play then
							
						--end
					--end
				end
				
			end
		end
	end

	if G.jokers and G.jokers.cards then
		for pasdhab, card2 in ipairs(G.jokers.cards) do
			--for pasdhab, card3 in ipairs(G.jokers.cards) do
			
			--end
			if card2.ability and card2.ability.champion_sticker_stake then
				local shouldDebuffSHhsasjfaskufhiyasb = false
				for ashdbashd, card3 in ipairs(G.jokers.cards) do
					if card3 ~= card2 and card3.ability and card3.ability.champion_sticker_stake then
						card2.debuff = true
						shouldDebuffSHhsasjfaskufhiyasb = true
						--card3.debuff = true
					end
				end
				card2.debuff = shouldDebuffSHhsasjfaskufhiyasb
				--card2.ability.wheel_flipped = nil
				--if card2.facing == "back" then
				--	card2:flip()
				--end
			end
			if card2.ability and card2.ability.immunity_stamp then
				card2.debuff = false
				--card2.ability.wheel_flipped = nil
				--if card2.facing == "back" then
				--	card2:flip()
				--end
			end
			if card2.ability and card2.ability.perishimient2 then
				if not G.play or not context.scoring_hand then
					card2:start_dissolve()
				end
			end
			--if card2.name == "Campfire" or card2.name == "j_campfire" or card2.id == "j_campfire" then
			--	if card2.ability.Xmult and card2.ability.Xmult > 1 then
			--		if not card2.ability.saved_Xmult or card2.ability.saved_Xmult < (card2.ability.Xmult - 1) * 0.4 then
			--			card2.ability.saved_Xmult = (card2.ability.Xmult - 1) * 0.4
			--		end
			--		if card2.ability.saved_Xmult and card2.ability.saved_Xmult > card2.ability.Xmult then
			--			card2.ability.Xmult = card2.ability.saved_Xmult
			--		end
			--	end
			--	if card2.ability.extra and card2.ability.extra.Xmult and card2.ability.extra.Xmult > 1 then
			--		if not card2.ability.saved_Xmult or card2.ability.saved_Xmult < (card2.ability.extra.Xmult - 1) * 0.4 then
			--			card2.ability.saved_Xmult = (card2.ability.extra.Xmult - 1) * 0.4
			--		end
			--		if card2.ability.saved_Xmult and card2.ability.saved_Xmult > card2.ability.extra.Xmult then
			--			card2.ability.extra.Xmult = card2.ability.extra.saved_Xmult
			--		end
			--	end
			--end
			if 1==2 and card2.ability and card2.ability.aggressive_stamp and not card2.ability.perishimient2 then
				if card2.config and card2.config.center and card2.config.center.blueprint_compat then
					if context.before then--context.main_scoring and
						--ease_dollars(1)
						local _card =
						copy_card(card2, nil, nil, nil, true)--other_joker2.edition and other_joker2.edition.negative
						_card:add_to_deck()
						--_card:set_banana(true)
						_card.eternal = true
						_card.ability.perishimient = true
						_card:set_eternal(true)
						_card.ability.eternal = true
						_card:set_edition("e_negative")
						_card.ability.perishimient2 = true
						G.jokers:emplace(_card)
					end
				end
			end
			if card2.ability and card2.ability.nebula_stamp then
				local celesteCards = 0
				for i = 0, #G.play.cards do
					if G.play.cards[i] and G.play.cards[i].ability and G.play.cards[i].ability.nebula_stamp then
						celesteCards = celesteCards + 1
					end
				end
				if context.scoring_hand and celesteCards >= 5 and context.before then
					if not card2.ability.nebula_boost_levels then
						card2.ability.nebula_boost_levels = 0
					end
					card2.ability.nebula_boost_levels = card2.ability.nebula_boost_levels + 1
				end
				if context.before and card2.ability and card2.ability.nebula_boost_levels and card2.ability.nebula_boost_levels > 0 then
					if not G.GAME.galaxy_roundBoost then
						G.GAME.galaxy_roundBoost = 0
					end
					G.GAME.galaxy_roundBoost = G.GAME.galaxy_roundBoost + card2.ability.nebula_boost_levels
				end
			end
			--if card2.ability and card2.ability.powered_stamp then--this is here for reasons (that dont exist)
			--	if not card2.ability.poweredBonusMult then
			--		card2.ability.poweredBonusMult = 0
			--	end
			--	if context.before then
			--		card2.ability.poweredBonusMult = card2.ability.poweredBonusMult + 1
			--	end
			--	if mult then
			--		mult = mult + card2.ability.poweredBonusMult
			--	end
			--end
			if card2.ability and card2.ability.golden_stamp and card2.ability.goldStampMoneyBonus and card2.ability.goldStampMoneyBonus > 0 then
				if context.end_of_round
				and not context.blueprint
				and not context.repetition
				and not context.individual
				then
					ease_dollars(card2.ability.goldStampMoneyBonus)
					card2.ability.goldStampMoneyBonus = 0
					card2:juice_up()
				end
			end
		end
	end

	if G.play and G.play.cards and context.after then--just check the recent hand, used for a galaxy card
		local eval = context.scoring_name
		G.GAME.mostRecentHand = eval
	end

	if G.GAME.galaxy_roundBoost and G.GAME.galaxy_roundBoost > 0 and G.play and G.play.cards and context.before then
		local eval = context.scoring_name
		level_up_hand(self, eval, true, G.GAME.galaxy_roundBoost)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = G.GAME.hands[eval].mult, chips = G.GAME.hands[eval].chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
		)
	end
	if G.GAME.galaxy_roundBoost and G.GAME.galaxy_roundBoost > 0 and G.play and G.play.cards and context.after then
		local eval = context.scoring_name
		level_up_hand(self, eval, true, -G.GAME.galaxy_roundBoost)
		--update_hand_text(
		--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		--	{ mult = G.GAME.hands[eval].mult, chips = G.GAME.hands[eval].chips, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
		--)
		G.GAME.galaxy_roundBoost = 0
	end

	if G.GAME.mechanics_discardBanishment then
		if context.discard and context.other_card == context.full_hand[#context.full_hand] then
			if not G.GAME.bannedCardsToDraw_mechanic then
				G.GAME.bannedCardsToDraw_mechanic = { }
			end
			for i = 1, #context.full_hand do
				G.GAME.bannedCardsToDraw_mechanic[#G.GAME.bannedCardsToDraw_mechanic + 1] = context.full_hand[i]
			end
		end
		if context.setting_blind and G.GAME.round_resets and G.GAME.round_resets.discards then
			--ease_discard(-1)
			--if G.GAME.mechanics_theMerge and not G.GAME.mechanics_threadTheNeedle then
			--	ease_hands_played(-1)
			--end
			if G.GAME.bannedCardsToDraw_mechanic and G.GAME.bannedCardsToDraw_mechanic[1] then
				G.FUNCS.draw_from_hand_to_deck()
				for bannedCardNum = 1, #G.GAME.bannedCardsToDraw_mechanic do
					local bannedCardId = G.GAME.bannedCardsToDraw_mechanic[bannedCardNum]
					--local shouldRemoveFromDeck = true
					--for ksaosbfjr = 1, #G.hand.cards do
					--	if G.hand.cards[ksaosbfjr] == bannedCardNum or G.hand.cards[ksaosbfjr] == bannedCardId then
					--		shouldRemoveFromDeck = false
					--	end
					--end
					--G.deck.cards[bannedCardId].debuff = true
					--if shouldRemoveFromDeck then
						
						draw_card(G.deck, G.discard, nil, nil, false, bannedCardId)
					--else
						--draw_card(G.hand, G.discard, nil, nil, false, bannedCardId)
					--end
				end
				--G.FUNCS.draw_from_hand_to_deck()
			end
			G.GAME.bannedCardsToDraw_mechanic = {}
			G.GAME.bannedCardsToDraw_mechanic[1] = nil
			G.GAME.bannedCardsToDraw_mechanic = nil
		end
	end

	if G.GAME.mechanics_galaxyMode and 1==2 then--this was only here for testing purrpossess--and 1==2
		--G.GAME.hands[neutronhand].visible = false
		for i, neutronhand in ipairs(G.handlist) do
			local handnameDeleted = localize(neutronhand, "poker_hands")
			local ConsumableThatGetsBanned = c_pluto--this variable only exists for quick copy
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
		end
	end

	if G.GAME.modifiers.permanent_psychic then
		--if context.final_scoring_step then
			--if #G.play.cards < 5 then
				--G.GAME.current_round.current_hand.chips = 0
				--G.GAME.current_round.current_hand.mult = 0
				if not G.boss_throw_hand then
					G.boss_throw_hand = context.full_hand and #context.full_hand < 5
					
					--G.GAME:update_game_over(1)
				end
				if context.full_hand and #context.full_hand < 5 and G.play ~= nil and G.play.cards ~= nil and #G.play.cards > 0 then
					--G.STATE = G.STATES.GAME_OVER
					for i = 0, #G.play.cards - 1 do
						G.play.cards[#G.play.cards - i]:set_debuff(true)
						--draw_card(G.play, G.discard, nil, nil, false, G.play.cards[#G.play.cards - i])
					end
				end
				G.boss_colour = HEX('efc03c')
				G.GAME.boss_colour = HEX('efc03c')
				--boss_colour = HEX('efc03c')
				--G.GAME.dollars = 0
			--end
		--end
	end

	if G.GAME.mechanics_mirrorDeckButNowMechanic then
		if
			--context.skip_blind
			context.end_of_round
			--and not context.individual
			--and not context.repetition
			--and not context.blueprint
			--and G.GAME.handSizeChangeMerge
		--	and G.GAME.blind.boss
		then
			G.GAME.mechanics_mirrorDeckButNowMechanic_saved_hands = 0
		end
		if context.final_scoring_step and G.play ~= nil and G.play.cards ~= nil and #G.play.cards > 0 then--context.final_scoring_step
			G.GAME.isFinalPre = true
			lastHandCardCount = #G.play.cards
		elseif G.GAME.isFinalPre and (G.play == nil or G.play.cards == nil or #G.play.cards <= 0) and lastHandCardCount ~= nil and lastHandCardCount ~= 0 and G.discard ~= nil and G.discard.cards ~= nil and #G.discard.cards > 0 then--isFinalPre and not context.destroying_card and
			G.GAME.isFinalPre = false
			--cardsMemory = {}
			--cardToRemember = 1
			--G.FUNCS.draw_from_hand_to_discard()
			--G.FUNCS.draw_from_discard_to_deck()
			--G.FUNCS.draw_from_hand_to_deck()
			--for k, v in pairs(G.playing_cards) do
			--	v.ability.wheel_flipped = nil
			--	--cardsMemory[cardToRemember] = v
			--	--cardToRemember = cardToRemember + 1
			--	v:add_to_deck()
			--end
			--G.hand:change_size(-1)
			--G.FUNCS.draw_from_hand_to_deck()
			G.E_MANAGER:add_event(Event({
				--trigger = "after",
				--delay = 5,
				func = function()
					if lastHandCardCount > 1 then
						for i = 1, lastHandCardCount - 1 do
							draw_card(G.discard, G.deck, nil, nil, false, G.discard.cards[#G.discard.cards - i])
						end
						lastHandCardCount = 0
						--for k, v in pairs(G.hand.cards) do
						--	v.ability.wheel_flipped = nil
						--	if v.facing == "back" then
						--		v:flip()
						--	end
						--end
						--draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards - 1])
						--draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards - 2])
						--draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards - 3])
						--draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards - 4])
						--G.STATE = G.STATES.DRAW_TO_HAND
						--destroying_card, context.cardarea == "play" and context.main_scoring
						G.deck:shuffle("cry_reboot" .. G.GAME.round_resets.ante)
						G.deck:hard_set_T()
						--G.STATE_COMPLETE = false
					end
					--draw_card(G.hand, G.deck, nil, nil, false, G.hand.cards[#G.hand.cards])
					--this is a long if statement
					--and G.GAME.current_round and G.GAME.current_round.current_hand and G.GAME.current_round.current_hand.chip_total
					if G.GAME.blind and G.GAME.blind.chips and G.GAME.chips and G.GAME.blind.chips > G.GAME.chips and G.GAME.current_round.hands_left > 0 and not context.end_of_round then
						draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards])
						G.deck:hard_set_T()
					end
					-----------
					--A fix to the hand size in the "lovely" code
					-----------
					--G.hand:change_size(1)
					--draw_card(G.deck, G.hand, nil, nil, false, G.deck.cards[#G.deck.cards])
					return true
				end,
			}))
		end
	end

	G.GAME.modifiers.hah_acension2 = G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe

	if G.GAME.mechanics_rareSacrifice_mythicGain then
		G.GAME.rare_mod = 0
	else
		G.GAME.rare_mod = 1
	end

	--remove tags after all effects go through
	for i = 1, #G.GAME.tags do
		if (context.skip_blind or context.end_of_round)
			and not context.individual
			and not context.repetition
			--and not context.blueprint 
			then
			G.GAME.tags[i]:apply_to_run({type = "mechanic_trigger"})
			--return card
		end
		if G.GAME.tags[i].mechanic_tag_soStackInsteadOfDuplicate and #G.GAME.tags > i then
			for j = i + 1, #G.GAME.tags - i do
				if G.GAME.tags[j] and G.GAME.tags[j].mechanic_tag_soStackInsteadOfDuplicate and G.GAME.tags[j].id == G.GAME.tags[i].id then
					G.GAME.tags[i].ability.rounds_to_last = G.mechanicCardDuration--duplicates reset its duration--G.GAME.tags[i].ability.rounds_to_last + 1
					G.GAME.tags[j]:yep("+", G.C.GREEN, function()--RARITY.pogoB_hah_mythic2
						--G.GAME.mechanics_theMerge = false
						return true
					end)
					G.GAME.tags[j].triggered = true
				end
			end
		end
    end

	return ret
end

local skip_blind = G.FUNCS.skip_blind
G.FUNCS.skip_blind = function(e)
    if G.GAME.mechanics_tagsOnBlind and 1==2 then
        local _tag = e.UIBox:get_UIE_by_ID('tag_container')
        if _tag then
            local tag = Tag(_tag.config.ref_table.key, false, _tag.config.ref_table.ability.blind_type)
			if tag == Tag("tag_boss") then
				while tag == Tag("tag_boss") do
					tag = Tag(_tag.config.ref_table.key, false, _tag.config.ref_table.ability.blind_type)
				end
			end
            tag:set_ability()
            add_tag(tag)
        end
    end
    skip_blind(e)
end

local theMerge2 = {
	object_type = "Consumable",
	set = "Mechanic",
	name = "Holy Fuck 3",
	key = "theMerge2",
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
	cost = 9,
	order = 200,
	pos = { x = 3, y = 0 },
	--order = 5,
	atlas = "atlasnotjokers",
	--atlas = "pogo_chips",
	--hidden = true, --default soul_rate of 0.3% in spectral packs is used
	--soul_set = "Tarot",--tarot cards get some love...or not
	can_use = function(self, card)	
		return true--always allow use, but not always allow pool
	end,
	in_pool = function(self, card)	
	--	if not timesUsed_superAcension_ThisRun or timesUsed_superAcension_ThisRun == 1 then
	--		if not timesUsed_superAcension_ThisRun then
	--			cardConvertType = "Ascended"
	--			jokerslotSink = 1
	--		end
	--		return true--always allow use, but not always allow pool
	--	else
			return false
	--	end
	end,
	use = function(self, card, area, copier)
		G.GAME.common_mod = 0
	end,
}

local merge_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 3, y = 1 },
	name = "Merge Tag",
	order = 10,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "merge_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_merge_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_merge_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_theMerge = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_merge_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_merge_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_theMerge = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_theMerge = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local blindtags_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 4, y = 1 },
	name = "BLIIIIIII Tag",
	order = 11,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "blindtags_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
				
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_blindtags_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_blindtags_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_tagsOnBlind = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_blindtags_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_blindtags_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_tagsOnBlind = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_tagsOnBlind = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local needle_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 5, y = 1 },
	name = "jahsdhbneeeedle Tag",
	order = 12,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "needle_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_needle_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_needle_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_threadTheNeedle = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_needle_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_needle_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_threadTheNeedle = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_threadTheNeedle = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local galaxy_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 6, y = 1 },
	name = "sadhasdas Tag",
	order = 13,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "galaxy_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_galaxy_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_galaxy_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_galaxyMode = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_galaxy_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_galaxy_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_galaxyMode = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_galaxyMode = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local banish_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 3, y = 2 },
	name = "afsdghndssr Tag",
	order = 14,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "banish_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_banish_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_banish_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_discardBanishment = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_banish_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_banish_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_discardBanishment = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_discardBanishment = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local mirror_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 4, y = 2 },
	name = "sadhashkfbhsa Tag",
	order = 15,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	mechanic_tag_soStackInsteadOfDuplicate = true,
	key = "mirror_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mirror_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mirror_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_mirrorDeckButNowMechanic = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mirror_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mirror_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_mirrorDeckButNowMechanic = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_mirrorDeckButNowMechanic = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local booster_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 5, y = 2 },
	name = "ayhasyfnbifufff Tag",
	order = 16,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "booster_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_booster_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_booster_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_booster_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_booster_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local mythic_mech_tag = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 6, y = 2 },
	name = "asdhftueiqpzksngsha Tag",
	order = 17,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 4 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 4
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 4
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "mythic_mech_tag",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mythic_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mythic_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_rareSacrifice_mythicGain = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mythic_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mythic_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 4
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_rareSacrifice_mythicGain = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_rareSacrifice_mythicGain = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

--------------------------------------------------------------------------
--programmer versions (yes there is a better way to do this, but fuck you)
--------------------------------------------------------------------------

local merge_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 3, y = 1 },
	name = "Merge Tag",
	order = 10,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "merge_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_merge_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_merge_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_theMerge = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_merge_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_merge_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_theMerge = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_theMerge = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local blindtags_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 4, y = 1 },
	name = "BLIIIIIII Tag",
	order = 11,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "blindtags_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_blindtags_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_blindtags_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_tagsOnBlind = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_blindtags_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_blindtags_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_tagsOnBlind = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_tagsOnBlind = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local needle_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 5, y = 1 },
	name = "jahsdhbneeeedle Tag",
	order = 12,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "needle_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_needle_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_needle_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_threadTheNeedle = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_needle_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_needle_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_threadTheNeedle = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_threadTheNeedle = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local galaxy_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 6, y = 1 },
	name = "sadhasdas Tag",
	order = 13,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "galaxy_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_galaxy_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_galaxy_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_galaxyMode = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_galaxy_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_galaxy_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_galaxyMode = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_galaxyMode = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local banish_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 3, y = 2 },
	name = "afsdghndssr Tag",
	order = 16,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "banish_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_banish_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_banish_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_discardBanishment = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_banish_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_banish_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_discardBanishment = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_discardBanishment = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local mirror_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 4, y = 2 },
	name = "sadhashkfbhsa Tag",
	order = 15,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	mechanic_tag_soStackInsteadOfDuplicate = true,
	key = "mirror_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mirror_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mirror_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_mirrorDeckButNowMechanic = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mirror_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mirror_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_mirrorDeckButNowMechanic = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_mirrorDeckButNowMechanic = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local booster_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 5, y = 2 },
	name = "ayhasyfnbifufff Tag",
	order = 16,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "booster_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_booster_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_booster_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_booster_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_booster_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_boosterPacksInShop_likeInSpotsWhereJokersShouldBe = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}

local mythic_mech_tag2 = {
	object_type = "Tag",
	atlas = "pogo_tags",
	pos = { x = 6, y = 2 },
	name = "asdhftueiqpzksngsha Tag",
	order = 17,
	--odds = 1000,--impossibly rare
	min_ante = 999,--never spawn naturally
	--requires = "j_cry_googol_play",
	mechanic_tag_soStackInsteadOfDuplicate = true,
	config = { type = "mechanic_trigger", rounds_to_last = 6 },
	loc_vars = function(self, info_queue, tag)
		if tag and G.mechanicCardDuration and (tag.ability.rounds_to_last and tag.ability.rounds_to_last >= G.mechanicCardDuration) then
			tag.ability.rounds_to_last = 6
		end
		if tag and G.mechanicCardDuration and (self.config.rounds_to_last and self.config.rounds_to_last >= G.mechanicCardDuration) then
			self.config.rounds_to_last = 6
		end
		return {
			vars = {
				tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last,
			},
		}
	end,
	key = "mythic_mech_tag2",
	apply = function(self, tag, context)
		if context.type == "mechanic_trigger"
			then
			if tag and G.mechanicCardDuration and tag.ability.rounds_to_last or self.config.rounds_to_last then
				if tag.ability.rounds_to_last then
					if tag.ability.rounds_to_last > 1 then
						tag.ability.rounds_to_last = tag.ability.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mythic_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mythic_mech_tag
								then
								G.GAME.tags[i].ability.rounds_to_last = tag.ability.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						tag.ability.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_rareSacrifice_mythicGain = false
							return true
						end)
						tag.triggered = true
					end
				else
					if self.config.rounds_to_last > 1 then
						self.config.rounds_to_last = self.config.rounds_to_last - 1
						tag:yep("-", G.C.PURPLE, function()--RARITY.pogoB_hah_mythic2
							return true
						end)
						add_tag(Tag("tag_pogoB_mythic_mech_tag"))
						for i = 1, #G.GAME.tags do
							if 
								G.GAME.tags[i].id == tag_pogoB_mythic_mech_tag
								then
								G.GAME.tags[i].config.rounds_to_last = self.config.rounds_to_last
								--return card
							end
						end
						tag.triggered = true
					else
						self.config.rounds_to_last = 6
						tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
							G.GAME.mechanics_rareSacrifice_mythicGain = false
							return true
						end)
						tag.triggered = true
					end
				end
			else
				tag:yep("x", G.C.RED, function()--RARITY.pogoB_hah_mythic2
					G.GAME.mechanics_rareSacrifice_mythicGain = false
					return true
				end)
				tag.triggered = true
			end
			--return card
		end
	end,
}


local mechanics = {
	mechanic,
	theMergeTrue,
	--theMerge2,
	--theMerge,
	mech_pack1,
	mech_pack2,
	tagsOnBlind,
	threadTheNeedle,
	galaxyMode,
	discardBanishment,
	mirrorDeckButNowMechanic,
	boosterPacksInShop_likeInSpotsWhereJokersShouldBe,
	rareSacrifice_mythicGain,
	--tags that disable them
	merge_mech_tag,
	blindtags_mech_tag,
	mythic_mech_tag,
	booster_mech_tag,
	mirror_mech_tag,
	banish_mech_tag,
	galaxy_mech_tag,
	needle_mech_tag,
	--extended versions
	merge_mech_tag2,
	blindtags_mech_tag2,
	mythic_mech_tag2,
	booster_mech_tag2,
	mirror_mech_tag2,
	banish_mech_tag2,
	galaxy_mech_tag2,
	needle_mech_tag2,
	crazy_pack1,
}

return {
	name = "Mechanics",
	items = mechanics,
}