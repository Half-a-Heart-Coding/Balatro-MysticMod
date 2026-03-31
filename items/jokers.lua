--[[
gameset_config = {
        modest = {extra = {chips = 1}, center = {rarity = 1, blueprint_compat = false, immutable = true, no_dbl = false}},
		mainline = {center = {rarity = 2, blueprint_compat = true, immutable = true, no_dbl = true}},
        madness = {extra = {chips = 100}, center = {rarity = 3}},
		cryptid_in_2025 = {extra = {chips = 1e308}, center = {rarity = "cry_exotic"}},
 },
-- Card.get_gameset(card) ~= "modest"

--TODO Modest descriptions for
Supercell
Old Membership card
Canvas
Nostalgic Googol Play Card
One For all
--]]


SMODS.Atlas({
	key = "atlasepic",
	path = "atlasepic.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "lumpyjoke",
	path = "lumpyjoke.png",
	px = 69,
	py = 93,
})

SMODS.Atlas({
	key = "GodhoodCard_OLD",
	path = "GodhoodCard_OLD.png",
	px = 129,
	py = 170,
})

SMODS.Rarity({
	key = "hah_mythic",
	name = "Mythic",
	loc_txt = {name = "Mythic",
				text = {
					"A confusing rarity",
				},},
	badge_colour = HEX("e38109"),
	default_weight = 0.01,--change this with weight
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		if G.GAME and G.GAME.mechanics_rareSacrifice_mythicGain then
			if G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count >= 10 then
				return 0.1 --10 collectibles
			elseif G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
				return (G.GAME.modifiers.collectible_count * 0.001) + 0.055 --more common the more you have
			else
				return 0.06--actually stronger than it claims to be (12X)
			end
		else
			if G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count >= 10 then
				return 0.01 --10 collectibles
			elseif G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
				return (G.GAME.modifiers.collectible_count * 0.0001) + 0.005 --more common the more you have
			else
				return 0.005--0.003 is cry epic, 0.05 is rare, 0.25 is uncommon
			end
		end
	end,
})

SMODS.Rarity({
	key = "hah_jimbo",
	name = "Jimbo",
	loc_txt = {name = "Jimbo",
				text = {
					"Its him",
				},},
	badge_colour = HEX("00e621"),
	default_weight = 0,--change this with weight
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		--if #SMODS.find_card("j_pogoB_hah_jimbo") ~= 0 then
		--	return 100--fuck you
		--else
		--if G.GAME and G.GAME.mechanics_rareSacrifice_mythicGain then
		--	return 0.001--sometimes, very rarely can spawn
		--else
			return 0
		--end
		--end
	end,
})

--Antimatter Joker--DO NOT PUT ANYTHING ELSE IN THIS RARITY
--this is probably rarer than legendaries
SMODS.Rarity({
	key = "hah_mythic2",
	name = "Fake Mythic",
	loc_txt = {name = "?????",--"Mythic?",
				text = {
					"A confusing rarity",
				},},
	badge_colour = G.C.DARK_EDITION,--HEX("e38109"),
	default_weight = 0,--change this with weight
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		if #SMODS.find_card("j_pogoB_blank_joke") > 0 then
			--if G.GAME and G.GAME.mechanics_rareSacrifice_mythicGain then
			--	return 0.0002--sometimes, very rarely can spawn, but 2x as often
			--else
				--return 0.0001--sometimes, very rarely can spawn
				return 0.003
			--end
		else
			--if G.GAME and G.GAME.mechanics_rareSacrifice_mythicGain then
			--	return 0.0001--sometimes, very rarely can spawn
			--else
				return 0
			--end
		end
	end,
})

--worse than common jokers...?
SMODS.Rarity({
	key = "hah_trash_jokers",
	name = "Collectible",
	loc_txt = {name = "Collectible",
				text = {
					"A shitty rarity",
				},},
	badge_colour = HEX("704125"),--shit colored
	default_weight = 0.02,--change this with weight
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		if not G.GAME.starting_params.allow_collectionables_aka_shitjokers then
			return 0--stake only joker type
		elseif G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count >= 10 then
			return 0 --max of 10 (not a true max)
		elseif G.GAME and G.GAME.modifiers and G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			return ((G.GAME.modifiers.collectible_count * 0.05) + 0.175) * G.GAME.common_mod --more common the more you have
		else
			return 0.15 * G.GAME.common_mod--0.003 is cry epic, 0.05 is rare, 0.25 is uncommon
		end
	end,
})

local regularJokerButShit = {
	object_type = "Joker",
	name = "Fuck You",
	key = "trashy_joker_1",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 50,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		return {
			message = localize("supercell_msg"),
			--chip_mod = card.ability.extra.stat1,
			--Xmult_mod = card.ability.extra.stat3,
			mult_mod = 1,
		}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local theWorstChipAdditionCard = {
	object_type = "Joker",
	name = "Fuck You Too",
	key = "trashy_joker_2",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 51,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		return {
			message = localize("supercell_msg"),
			chip_mod = 10,
			--Xmult_mod = card.ability.extra.stat3,
			--mult_mod = 1,
		}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local parasite = {
	object_type = "Joker",
	name = "Fuck You Tree",
	key = "trashy_joker_3",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 52,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		return {
			message = localize("supercell_msg"),
			--chip_mod = 10,
			Xmult_mod = 1.05,
			--mult_mod = 1,
		}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local rareXChipsMoment_waitItSucks = {
	object_type = "Joker",
	name = "4some, wait what",
	key = "trashy_joker_4",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 53,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		return {
			message = localize("supercell_msg"),
			--chip_mod = 10,
			Xchip_mod = 1.02,
			--mult_mod = 1,
		}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local badJoker = {
	object_type = "Joker",
	name = "This one sucks",
	key = "trashy_joker_5",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 54,
	blueprint_compat = false,--secret ultimate synergy
	atlas = "atlasepic",
	calculate = function(self, card, context)
	--G.hand.config.highlighted_limit = 6
	--	G.play.card_limit = 6
	if context.joker_main then
		card.edition.polychrome = false
			card.edition.foil = false
			card.edition.holographic = false
			card.edition.holo = false
		card:set_edition("e_negative")
		
		return {
			message = localize("supercell_msg"),
			--chip_mod = 10,
			--Xchip_mod = 1.01,
			--mult_mod = 1,
		}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local handSelectionIncrease_Butnofunction = {
	object_type = "Joker",
	name = "Fucking useless",
	key = "trashy_joker_6",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 55,
	blueprint_compat = false,--secret ultimate synergy
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		G.hand.config.highlighted_limit = 6
		G.play.card_limit = 6
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand.config.highlighted_limit = 5
		G.play.card_limit = 5
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local royalFlushMoney = {
	object_type = "Joker",
	name = "Down the drain",
	key = "trashy_joker_7",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 56,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.destroying_card then
			local option = pseudorandom_element({ 1, 2, 1 }, pseudoseed("bonusjoker"))
			local eval = evaluate_poker_hand(context.full_hand)
			if next(eval["pogoB_RoyalFlush"]) then--and option == 1
				ease_dollars(1)
			else
				return false
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local loanSharkTank = {
	object_type = "Joker",
	name = "Shittiest Loans of All Time",
	key = "trashy_joker_8",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			stat1 = 0,
			isShittyJoker = 1,
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 57,
	blueprint_compat = true,
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		ease_dollars(5)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if not card.ability.perishimient then--makes riffle raffle not shit in upper antes
			ease_dollars(-10)
		end
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

local ScalingChipJoker_collectible = {
	object_type = "Joker",
	name = "Hiker but shit",
	key = "trashy_joker_9",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			stat1 = 0,
			isShittyJoker = 1,
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 58,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		--ease_dollars(1)
		--stat4 = string.sub(card.edition)
			return {
				--message = localize("supercell_msg"),
				chip_mod = card.ability.extra.stat1,
			}
			end
	end,
	calc_dollar_bonus = function(self, card)
		card.ability.extra.stat1 = card.ability.extra.stat1 + 1
		if G.GAME.modifiers.collectible_count >= 10 then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.isShittyJoker then
					G.jokers.cards[i]:start_dissolve()
				end
			end

			G.GAME.modifiers.collectible_count = 100
			--local card = create_card("Consumeable", G.consumeables, nil, nil, true, nil, "c_soul", "c_soul")--this is op if you already have perkeo
			--		card:add_to_deck()
			--		card:set_edition("e_negative")
			--		card:start_materialize()
			--		G.consumeables:emplace(card)

			--SMODS.Edition:take_ownership("negative", {
			--get_weight = function(self)
			--	return self.weight * 10--3% chance
			--end,
			--}, true)
			local card_show2 = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "j_pogoB_jimbo", "j_pogoB_jimbo")--"pogoB_hah_mythic"
					card_show2:add_to_deck()
					card_show2:start_materialize()
					G.jokers:emplace(card_show2)
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		--ease_dollars(10)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		--ease_dollars(-11)
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.stat1), number_format(G.GAME.modifiers.collectible_count) } }
	end,
}

local theWorstTradeOfAllTime = {
	object_type = "Joker",
	name = "Never Take This One",
	key = "trashy_joker_10",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
			isShittyJoker = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_trash_jokers",--3,
	cost = 1,
	order = 59,
	blueprint_compat = true,
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		--ease_dollars(10)
		card.eternal = false
		card.ability.eternal = false
		card.ability.perishable = false
		card.ability.perish_tally = 9999999
		card.ability.rental = false
		card.pinned = false
		card.ability.procrast = false
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
		--G.GAME.round_resets.temp_handsize = G.GAME.round_resets.temp_handsize - 1
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count + 1
		else 
			G.GAME.modifiers.collectible_count = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		--ease_dollars(-11)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
		--G.GAME.round_resets.temp_handsize = G.GAME.round_resets.temp_handsize + 1
		if G.GAME.modifiers.collectible_count and G.GAME.modifiers.collectible_count > 0 then
			G.GAME.modifiers.collectible_count = G.GAME.modifiers.collectible_count - 1
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.stat1) } }
	end,
}

-- Supercell
-- +15 Chips, +15 Mult, X2 Chips, X2 Mult, earn $3 at end of round

--hah function: +15 chips, +15 mult, +$1 
local supercell = {
	object_type = "Joker",
	name = "Cheese Stick",
	key = "supercell",
	config = {
		extra = {
			stat1 = 50,
			stat2 = 10,
			stat3 = 1.5,
			stat4 = "n/a",
			absorbed_foil = 0,
			absorbed_holo = 0,
			absorbed_poly = 0,
			absorbed_neg = 0,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 1, y = 0 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 7,
	order = 10,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.joker_main then
		--ease_dollars(1)
		--stat4 = string.sub(card.edition)
		if card.edition and card.edition.foil then
			card.ability.extra.absorbed_foil = card.ability.extra.absorbed_foil + 1
		end
		if card.edition and (card.edition.holographic or card.edition.holo) then
			card.ability.extra.absorbed_holo = card.ability.extra.absorbed_holo + 1
		end
		if card.edition and card.edition.polychrome then
			card.ability.extra.absorbed_poly = card.ability.extra.absorbed_poly + 1
		end
		if card.edition and card.edition.negative then
			card.ability.extra.absorbed_neg = card.ability.extra.absorbed_neg + 1
			--G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		end
		card.ability.extra.stat1 = 50 + (card.ability.extra.absorbed_foil * 50)
		card.ability.extra.stat2 = 10 + (card.ability.extra.absorbed_holo * 10)
		card.ability.extra.stat3 = 1.5 + (card.ability.extra.absorbed_poly * 0.75)--go with it
		if card.edition then
			card.edition.polychrome = false
			card.edition.foil = false
			card.edition.holographic = false
			card.edition.holo = false
			card.edition.negative = false
		end
		card.edition = nil
		card:juice_up()
			return {
				--message = localize("supercell_msg"),
				chip_mod = card.ability.extra.stat1,
				Xmult_mod = card.ability.extra.stat3,
				mult_mod = card.ability.extra.stat2,
			}
			end
	end,
	add_to_deck = function(self, card, from_debuff)
		--if not from_debuff then
		--	play_sound("cry_studiofromhelsinki")
		--end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if card.ability.extra.absorbed_neg and card.ability.extra.absorbed_neg > 0 then
			G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.absorbed_neg
		end
		--G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.stat1), number_format(center.ability.extra.stat3), number_format(center.ability.extra.stat2), number_format(center.ability.extra.absorbed_neg) } }
	end,
}

-- Googol Play Card
-- 1 in 8 chance for X1e100 Mult

--hah function: 0.5x mult, 2.5x chips, scales chips by 0.1 per cashout
local googol_play = {
	object_type = "Joker",
	name = "Casino Card",
	key = "googol_play",
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			Xchips_num = 0.5,
			Xmult_num = 2,
		},
	},
	pos = { x = 1, y = 4 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 5,
	order = 8,
	blueprint_compat = true,
	immutable = true,
	eternal_compat = false,
	--demicoloncompat = true,
	atlas = "atlasepic",
	--soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.Xchips_num), number_format(center.ability.extra.Xmult_num) } }
	end,
	calc_dollar_bonus = function(self, card)
		card:juice_up()
		card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.2
		card.ability.extra.Xmult_num = card.ability.extra.Xmult_num - 0.1
		if card.ability.extra.Xmult_num < 0.1 then--destroy if still here
			card:start_dissolve()
		end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			--ease_dollars(1)
			
			return {
				message = localize("2x mult"),
				Xmult_mod = card.ability.extra.Xmult_num,
				Xchip_mod = card.ability.extra.Xchips_num,
				--mult_mod = 4,
				--chip_mod = 30,
			}
		end
	end,
	--calc_dollar_bonus = function(self, card)
	--	card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.1
	--end,
}

--some legendaries
--this one gains 1X mult on cashout
local flatXMultScale = {
	object_type = "Joker",
	name = "Potato",
	key = "flatXMultScale",
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			Xchips_num = 1,
			rate = 1,
			odds = 2,
		},
	},
	pos = { x = 4, y = 3 },
	rarity = 4,
	cost = 20,
	order = 31,
	blueprint_compat = true,
	immutable = true,
	--demicoloncompat = true,
	atlas = "atlasepic",
	--soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.Xchips_num), number_format(center.ability.extra.rate) } }
	end,
	calc_dollar_bonus = function(self, card)
		if not card.ability.extra.Xchips_num then
			card.ability.extra.Xchips_num = 1
		end
		if not card.ability.extra.rate then
			card.ability.extra.rate = 1
		end
		card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + card.ability.extra.rate
		card:juice_up()
		--return {
		--	message = localize("2x mult"),
		--}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			--ease_dollars(1)
			
			return {
				message = localize("2x mult"),
				Xmult_mod = card.ability.extra.Xchips_num,
				--mult_mod = 4,
				--chip_mod = 30,
			}
		end
		if
			context.skip_blind
		--	context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
		--	and G.GAME.blind.boss
		then
			if not card.ability.extra.rate then
				card.ability.extra.rate = 1
			end
			card.ability.extra.rate = card.ability.extra.rate + 0.1
		end
	end,
	--calc_dollar_bonus = function(self, card)
	--	card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.1
	--end,
}

local consectHand = {
	object_type = "Joker",
	name = "Potato 2",
	key = "consectHand",
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			Xchips_num = 1,
			rate = 1,
			odds = 2,
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "pogoB_hah_mythic",
	cost = 8,
	order = 24,
	blueprint_compat = true,
	immutable = true,
	--demicoloncompat = true,
	atlas = "atlasepic",
	--soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.Xchips_num), number_format(center.ability.extra.rate) } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			--ease_dollars(1)
			card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.5
			return {
				message = localize("2x mult"),
				Xmult_mod = card.ability.extra.Xchips_num - 0.5,
				--mult_mod = 4,
				--chip_mod = 30,
			}
		end
		if
			context.discard
		then
			card.ability.extra.Xchips_num = 1
		end
	end,
	--calc_dollar_bonus = function(self, card)
	--	card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.1
	--end,
}

--this one crates a negative tag on cashout
local negativePrinter = {
	object_type = "Joker",
	name = "acesion But Negative",
	key = "negativePrinter",
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			Xchips_num = 1,
			rate = 1,
			odds = 2,
		},
	},
	pos = { x = 5, y = 3 },
	rarity = 4,
	cost = 20,
	order = 32,
	blueprint_compat = false,
	immutable = true,
	--demicoloncompat = true,
	atlas = "atlasepic",
	--soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	--loc_vars = function(self, info_queue, center)
	--	return { vars = { number_format(center.ability.extra.Xchips_num), number_format(center.ability.extra.rate) } }
	--end,
	calc_dollar_bonus = function(self, card)
		add_tag(Tag("tag_negative"))
		--add_tag(Tag("tag_voucher"))
		--add_tag(Tag("tag_orbital"))
		play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
		play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
	end,
	add_to_deck = function(self, card, from_debuff)
		SMODS.Edition:take_ownership("negative", {
		get_weight = function(self)
			return self.weight * 2
		end,
		}, true)
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.Edition:take_ownership("negative", {
		get_weight = function(self)
			return self.weight * 0.5
		end,
		}, true)
		local eligiblejokers = {}
		for k, v in pairs(G.jokers.cards) do
			if v.ability.set == "Joker" and not v.edition and v ~= card then
				table.insert(eligiblejokers, v)
			end
		end
		if #eligiblejokers > 0 then
			local eligible_card =
				pseudorandom_element(eligiblejokers, pseudoseed("nevergonnagiveyouupnevergonnaletyoudown"))
			local edition = { negative = true }
			eligible_card:set_edition(edition, true)
			check_for_unlock({ type = "have_edition" })
		end
	end,
	--calc_dollar_bonus = function(self, card)
	--	card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.1
	--end,
}

local acesion = {
	object_type = "Joker",
	name = "Ascension",
	key = "acesion",
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	config = {
		extra = {
			rare_rarityWeightMult = 3,
			uncommon_rarityWeightMult = 2,
			mythic_rarityWeightMult = 4,
			odds = 2,
		},
	},
	pos = { x = 0, y = 0 },
	rarity = "pogoB_hah_mythic",
	cost = 9,
	order = 17,
	blueprint_compat = false,
	immutable = true,
	--demicoloncompat = true,
	atlas = "atlasepic",
	--soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_pogoB_ascendedSpectral
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
	end,
	calc_dollar_bonus = function(self, card)
		add_tag(Tag("tag_polychrome"))
		--add_tag(Tag("tag_voucher"))
		--add_tag(Tag("tag_orbital"))
		play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
		play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
	end,
	calculate = function(self, card, context)
		if G.GAME.blind.boss and context.setting_blind and #G.consumeables.cards < G.consumeables.config.card_limit then
			local card = create_card("Consumeable", G.consumeables, nil, nil, true, nil, "c_pogoB_ascendedSpectral", "c_pogoB_ascendedSpectral")
			card:add_to_deck()
			--card:set_edition("e_negative")
			card:start_materialize()
			G.consumeables:emplace(card)
		end
		if G.GAME.blind.boss and context.setting_blind then
			add_tag(Tag("tag_polychrome"))
		end
	end,
	--add_to_deck = function(self, card, from_debuff)
		--G.GAME.modifiers.hah_acension = true
		--if card.edition.negative == false then
			--card:set_edition("e_polychrome")
		--end
		--if not from_debuff then
		--	play_sound("cry_studiofromhelsinki")
		--end
	--end,
	remove_from_deck = function(self, card, from_debuff)
		--G.GAME.modifiers.hah_acension = false
	--	add_tag(Tag("tag_polychrome"))
	--	add_tag(Tag("tag_rare"))
	--	--add_tag(Tag("tag_voucher"))
	--	--add_tag(Tag("tag_orbital"))
	--	play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
	--	play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
		v = pseudorandom_element(G.playing_cards, pseudoseed("cgegevasjdas"))
		v:set_edition("e_polychrome")
	end,
}

-- get_currrent_pool hook for Deck of Equilibrium and Copies
local gcp = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if
		G.GAME.modifiers.hah_acension2 == true
		and (_append == "sho" or _type == "Booster")--or _type == "Voucher"
	then
		if
			_type == "Joker" and math.random() > 0.8
		then
			-- we're regenerating the pool every time because of banned keys but it's fine tbh
			P_CRY_ITEMS = {}
			local valid_pools = { "Booster" }--"Consumeables", "Voucher",--"Joker",
			for _, id in ipairs(valid_pools) do
				for k, v in pairs(G.P_CENTER_POOLS[id]) do
					if
						v.unlocked == true
						and not (G.GAME.banned_keys[v.key])
					then
						P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
					end
				end
			end
			if #P_CRY_ITEMS <= 0 then
				P_CRY_ITEMS[#P_CRY_ITEMS + 1] = "v_blank"
			end
			return P_CRY_ITEMS, "hah_acension2" .. G.GAME.round_resets.ante
		end
	end
	return gcp(_type, _rarity, _legendary, _append)
end


local arsonMyFavorite = {
	object_type = "Joker",
	name = "Destruction",
	key = "arsonMyFavorite",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 1 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 7,
	order = 11,
	blueprint_compat = false,
	config = {
		extra = {
			odds_low = 2,
			odds = 3,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.odds_low,
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.destroying_card then
			local option = pseudorandom_element({ 1, 2, 1 }, pseudoseed("bonusjoker"))
			local eval = evaluate_poker_hand(context.full_hand)
			if next(eval["High Card"]) and not next(eval["Pair"]) and not next(eval["Flush"]) and not next(eval["Straight"]) then--and option == 1
				card:juice_up()
				card.message = localize("k_truck_ex")
				message = localize("k_truck_ex")
				context.destroying_card.message = localize("k_truck_ex")
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_truck_ex"), colour = G.C.ATTENTION})
				return not context.destroying_card.ability.eternal
			else
				return false
			end
		end
	end,
}

local stamper = {
	object_type = "Joker",
	name = "Stamper",
	key = "stamper",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 4 },
	rarity = 1,--"pogoB_hah_mythic",
	cost = 4,
	order = 2,
	blueprint_compat = false,
	config = {
		extra = {
			odds_low = 2,
			odds = 3,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.odds_low,
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.discard and context.other_card == context.full_hand[#context.full_hand] and G.GAME.current_round.discards_left <= 1 then--secret synergy with the hook, idk how to fix, and idc
			--G.GAME.current_round.discards_used >= G.GAME.round_resets.discards
			for i = 1, #context.full_hand do
				local randChosen = math.random()
				if randChosen > 0.8 then
					set_stamp(context.full_hand[i], "nebula_stamp")
				elseif randChosen > 0.6 then
					set_stamp(context.full_hand[i], "aggressive_stamp")
				elseif randChosen > 0.4 then
					set_stamp(context.full_hand[i], "immunity_stamp")
				elseif randChosen > 0.2 then
					set_stamp(context.full_hand[i], "powered_stamp")
				else
					set_stamp(context.full_hand[i], "golden_stamp")
				end
			end
		end
	end,
}

local spacedJokes = {
	object_type = "Joker",
	name = "Space Joker But Diff",
	key = "spacedJokes",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 4 },
	rarity = 1,--"pogoB_hah_mythic",
	cost = 4,
	order = 4,
	blueprint_compat = true,
	config = {
		extra = {
			odds_low = 2,
			odds = 3,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.odds_low,
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if G.play and G.play.cards and context.before and G.GAME.current_round.hands_left == 0 then
			card:juice_up()
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
	end,
}

local blindBuster = {
	object_type = "Joker",
	name = "Destroy all blinds",
	key = "blindBuster",
	config = {
		extra = {
			stat1 = 0,
			stat2 = 2,
			money = 1,
			type = "High Card",
			type2 = "Pair",
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 4 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 6,
	order = 14,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.stat1,
				localize(card.ability.extra.type, "poker_hands"),
				localize(card.ability.extra.type2, "poker_hands"),
				card.ability.extra.stat2,
			},
		}
	end,
	--calc_dollar_bonus = function(self, card)
	--	card.ability.extra.stat2 = 2
	--	card.ability.stat1 = card.ability.stat1 + (G.GAME.current_round.hands_left / 25)
	--	--add_tag(Tag("tag_voucher"))
	--	--add_tag(Tag("tag_orbital"))
	--	card:juice_up()
	--	play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
	--end,
	set_ability = function(self, card, initial, delay_sprites)--back up system
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
		card.ability.extra.type2 = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
		while card.ability.extra.type2 == card.ability.extra.type do
			card.ability.extra.type2 = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
		card.ability.extra.type2 = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
		while card.ability.extra.type2 == card.ability.extra.type do
			card.ability.extra.type2 = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
		end
	end,
	calculate = function(self, card, context)
		if not card.ability.extra.type then
			local _poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible then
					_poker_hands[#_poker_hands + 1] = k
				end
			end
			card.ability.extra.type = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
			card.ability.extra.type2 = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
			while card.ability.extra.type2 == card.ability.extra.type do
				card.ability.extra.type2 = pseudorandom_element(
					_poker_hands,
					pseudoseed(
						"oldblueprint"
					)
				)
			end
			if not card.ability.extra.type then
				card.ability.extra.type = "High Card"
			end
		end
		if not card.ability.extra.stat2 then
			card.ability.extra.stat2 = 2
		end
		if context.joker_main and (context.scoring_name == card.ability.extra.type or context.scoring_name == card.ability.extra.type2) then
			--card.ability.extra.revealed = true
			--card.ability.revealed = true
			--loc_vars(self, info_queue, center)
			local _poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible then
					_poker_hands[#_poker_hands + 1] = k
				end
			end
			card.ability.extra.type = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
			card.ability.extra.type2 = pseudorandom_element(
				_poker_hands,
				pseudoseed(
					"oldblueprint"
				)
			)
			while card.ability.extra.type2 == card.ability.extra.type do
				card.ability.extra.type2 = pseudorandom_element(
					_poker_hands,
					pseudoseed(
						"oldblueprint"
					)
				)
			end
			--center.ability.extra.revealed = true
			if not context.retrigger then
				ease_hands_played(1)
			end
			card.ability.extra.stat2 = card.ability.extra.stat2 + 1
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 2 },
				}),
				Xmult_mod = 2,
				colour = G.C.MULT,
			}
		end
	end,

}

local blindBuster2 = {
	object_type = "Joker",
	name = "Destroy all blinds",
	key = "blindBuster2",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 1 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 4,
	order = 33,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		--Xmult_mod
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
				func = function()
					ease_hands_played(-1)
					ease_discard(-1)
					card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
						message = localize({
							type = "variable",
							key = "a_hands",
							vars = {
								-1,
							},
						}),
					})
					G.hand:change_size(G.GAME.round_resets.hands + G.GAME.round_resets.discards)
					return true
				end,
			}))
		end
		--very long if statement
		--if context.joker_main and G.GAME.blind and G.GAME.blind.chips and G.GAME.current_round and G.GAME.current_round.current_hand and G.GAME.current_round.current_hand.chips and G.GAME.current_round.current_hand.mult and (G.GAME.blind.chips * 0.6) > (G.GAME.current_round.current_hand.chips * G.GAME.current_round.current_hand.mult) then
		--	return {
		----		message = localize({
		--			type = "variable",
		--			key = "a_xmult",
		--			vars = { 2 },
		--		}),
		--		Xmult_mod = 2,
		--		colour = G.C.MULT,
		--	}
		--end
	end,
}

local CROWBAR = {
	object_type = "Joker",
	name = "RoR CB",
	key = "CROWBAR",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 2 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 6,
	order = 15,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		--Xmult_mod
		if
			context.repetition
			and context.cardarea == G.play
			and G.GAME.current_round.hands_played == 0
			--and pseudorandom("cry_boredom_card")
			--	< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
		if context.joker_main and G.GAME.current_round.hands_played == 0 then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 3 },
				}),
				Xmult_mod = 3,
				colour = G.C.MULT,
			}
		end
	end,
}

local UnneccisaryStrenght = {
	object_type = "Joker",
	name = "Undessicary",
	key = "UnneccisaryStrenght",
	config = {
		extra = {
			Xchips_num = 1,
			requirement = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 1 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 4,
	order = 9,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.Xchips_num), number_format(center.ability.extra.requirement) } }
	end,
	calculate = function(self, card, context)
		--Xmult_mod
		if
			--context.skip_blind
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and card.ability.extra
			and card.ability.extra.requirement
			and card.ability.extra.Xchips_num
			and G.GAME.blind and G.GAME.blind.chips and G.GAME.chips and G.GAME.blind.chips * card.ability.extra.requirement <= G.GAME.chips 
		--	and G.GAME.blind.boss
		then
			card.ability.extra.Xchips_num = card.ability.extra.Xchips_num + 0.5
			card.ability.extra.requirement = card.ability.extra.requirement + 0.25
			card:juice_up()
		end
		if context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { card.ability.extra.Xchips_num },
				}),
				Xmult_mod = card.ability.extra.Xchips_num,
				colour = G.C.MULT,
			}
		end
	end,
}

-- Sync Catalyst
-- Balances Chips and Mult
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = {
			cost = 20,
			center = { rarity = 4 },
		},
	},
	pos = { x = 5, y = 2 },
	rarity = "cry_epic",
	cost = 12,
	order = 54,
	blueprint_compat = true,
	demicoloncompat = true,
	immutable = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if ((context.joker_main and not context.debuffed_hand) or context.forcetrigger) and hand_chips and mult then
			local tot = hand_chips + mult
			if not tot.array or #tot.array < 2 or tot.array[2] < 2 then --below eXeY notation
				hand_chips = mod_chips(math.floor(tot / 2))
				mult = mod_mult(math.floor(tot / 2))
			else
				if hand_chips > mult then
					tot = hand_chips
				else
					tot = mult
				end
				hand_chips = mod_chips(tot)
				mult = mod_chips(tot)
			end
			update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
			return {
				message = localize("k_balanced"),
				colour = { 0.8, 0.45, 0.85, 1 },
				func = function()
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							play_sound("gong", 0.94, 0.3)
							play_sound("gong", 0.94 * 1.5, 0.2)
							play_sound("tarot1", 1.5)
							return true
						end,
					}))
				end,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Project666",
		},
		art = {
			"Ein13",
		},
		code = {
			"Math",
		},
	},
	unlocked = true,
}

-- Negative Joker
-- +4 Joker slots

--hah function: sell this joker to gain 1 joker slot
local negative = {
	object_type = "Joker",
	name = "Antimatter Cola",
	key = "negative_joke",
	--pos = { x = 1, y = 3 },
	config = {
		extra = {
			slots = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 1 },
	rarity = "pogoB_hah_mythic",
	cost = 16,
	order = 4,
	blueprint_compat = false,
	--atlas = "atlasepic",
	--loc_vars = function(self, info_queue, center)
	--	return { vars = { number_format(center.ability.extra.slots) } }
	--end,
	--add_to_deck = function(self, card, from_debuff)
	--	if card.ability.extra.slots > card.ability.immutable.max_slots then
	--		card.ability.extra.slots = card.ability.immutable.max_slots
	--	end
	--	G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(card.ability.extra.slots))
	--end,
	calculate = function(self, card, context)
		if context.retrigger_joker_check then
			return {
				repetitions = 1
			}
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		G.GAME.interest_cap = G.GAME.interest_cap - 5
	end,
}

--lumpytouch joker 
local crazyHand = {
	object_type = "Joker",
	name = "ChaosTheory",
	key = "lumpyjoke",
	--pos = { x = 9, y = 9 },
	config = {
		extra = {
			slots = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 0 },
	rarity = "pogoB_hah_mythic",
	cost = 16,
	order = 20,
	blueprint_compat = false,
	immutable = true,
	atlas = "lumpyjoke",
	calculate = function(self, card, context)
	--if context.joker_main then
		--ease_dollars(1)
		if
			(context.cardarea == G.play)
			--context.joker_main
			and context.full_hand
			and #context.full_hand == 5 -- 3 cards in played hand
			--and G.play
			--and G.play.cards
			--and #G.play.cards > 0
			and not context.blueprint
			and not context.retrigger_joker
		then
			local picky = { "S_", "H_", "C_", "D_" }--{ "m_bonus", "m_mult", "m_wild", "m_glass", "m_steel", "m_stone", "m_gold", "m_lucky" }
			local picked = picky[math.random(#picky)]
			local pickyRank = { "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A" }
			local rank_suffix = pickyRank[math.random(#pickyRank)]
				for _, card2 in ipairs(G.hand.cards) do
					--if pseudorandom(pseudoseed('mark')) < G.GAME.probabilities.normal/self.config.extra.odds then
						-- pick a random one asdfg
						--self.triggered = true
						--card2:set_ability(picky[math.random(#picky)], nil, true)
						--local rank_suffix = string.sub(card2.base.rank, 1, 1) .. "_"
								
						--card2.base.suit = picked
						G.E_MANAGER:add_event(Event({
							func = function()
								if card2.facing ~= "back" then
									card2:flip()
								end
								card2.ability.wheel_flipped = true
								--card2:juice_up()
								--G.hand:add_to_highlighted(card2, true)
								--any_selected = true
								--play_sound('card1', 1)
								--if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
								--G.FUNCS.draw_from_discard_to_deck()
								return true
						end}))
						--delay(0.3)
						--card2:set_base(G.P_CARDS[picked .. rank_suffix])
					--end
				end
				--G.FUNCS.draw_from_discard_to_deck()
				--G.E_MANAGER:add_event(Event({
			--trigger = "immediate",
		end
		if
			--(context.cardarea == G.play)
			context.joker_main
			and #context.full_hand == 5 -- 3 cards in played hand
			and not context.blueprint
			and not context.retrigger_joker
		then
			local picky = { "S_", "H_", "C_", "D_" }--{ "m_bonus", "m_mult", "m_wild", "m_glass", "m_steel", "m_stone", "m_gold", "m_lucky" }
			local picked = picky[math.random(#picky)]
			local pickyRank = { "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A" }
			local rank_suffix = pickyRank[math.random(#pickyRank)]
				for _, card2 in ipairs(G.hand.cards) do
					--if pseudorandom(pseudoseed('mark')) < G.GAME.probabilities.normal/self.config.extra.odds then
						-- pick a random one asdfg
						self.triggered = true
						--card2:set_ability(picky[math.random(#picky)], nil, true)
						--local rank_suffix = string.sub(card2.base.rank, 1, 1) .. "_"
								
						--card2.base.suit = picked
						if card2.facing ~= "back" then
							card2:flip()
						end
						card2.ability.wheel_flipped = true
						card2:juice_up()
						delay(0.3)
						G.E_MANAGER:add_event(Event({
							func = function()
								card2:set_base(G.P_CARDS[picked .. rank_suffix])
								--G.hand:add_to_highlighted(card2, true)
								--any_selected = true
								--play_sound('card1', 1)
								--if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
								--G.FUNCS.draw_from_discard_to_deck()
								return true
						end}))
						--delay(7)
						--card2:set_base(G.P_CARDS[picked .. rank_suffix])
					--end
				end
				--G.FUNCS.draw_from_discard_to_deck()
				--G.E_MANAGER:add_event(Event({
			--trigger = "immediate",
			return {
				message = localize("k_chaos_ex"),
				--Xmult_mod = 5,
				--G.FUNCS.draw_from_hand_to_discard()
				
			}
		end
	end,
	--loc_vars = function(self, info_queue, center)
	--	return { vars = { number_format(center.ability.extra.slots) } }
	--end,
	--add_to_deck = function(self, card, from_debuff)
	--	if card.ability.extra.slots > card.ability.immutable.max_slots then
	--		card.ability.extra.slots = card.ability.immutable.max_slots
	--	end
	--	G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(card.ability.extra.slots))
	--end,
}

--blueprint but better?
local oldblueprint = {
	object_type = "Joker",
	name = "Battle Plan",
	key = "blueprint_mythic",
	--pos = { x = 1, y = 3 },
	config = {
		extra = {
			retriggers = 3,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 0 },
	rarity = "pogoB_hah_mythic",
	cost = 12,
	order = 19,
	atlas = "atlasepic",
	--update = function(self, card, front)
	--	if G.STAGE == G.STAGES.RUN then
	--		for i = 1, #G.jokers.cards do
	--			if G.jokers.cards[i] == card then
	--				other_joker = G.jokers.cards[i - 1]
	--			end
	--		end
	--		if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
	--			card.ability.blueprint_compat = "compatible"
	--		else
	--			card.ability.blueprint_compat = "incompatible"
	--		end
	--	end
	--end,
	--loc_vars = function(self, info_queue, card)
	--	card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
	--	card.ability.blueprint_compat_check = nil
	--	return {
	--		main_end = (card.area and card.area == G.jokers) and {
	--			{
	--				n = G.UIT.C,
	--				config = { align = "bm", minh = 0.4 },
	--				nodes = {
	--					{
	--						n = G.UIT.C,
	--						config = {
	--							ref_table = card,
	--							align = "m",
	--							colour = G.C.JOKER_GREY,
	--							r = 0.05,
	--							padding = 0.06,
	--							func = "blueprint_compat",
	--						},
	--						nodes = {
	--							{
	--								n = G.UIT.T,
	--								config = {
	--									ref_table = card.ability,
	--									ref_value = "blueprint_compat_ui",
	--									colour = G.C.UI.TEXT_LIGHT,
	--									scale = 0.32 * 0.8,
	--								},
	--							},
	--						},
	--					},
	--				},
	--			},
	--		} or nil,
	--	}
	--end,
	blueprint_compat = false,--infinite loop?
	eternal_compat = true,
	--atlas = "atlasthree",
	calculate = function(self, card, context)
		--if
		--	context.end_of_round2
		--	and not context.individual
		--	and not context.repetition
		--	and not context.blueprint
		--	and not context.retrigger_joker
		--then
		if	context.before
			and G.GAME.current_round.hands_left == 0 
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and not context.retrigger_joker
		then
			--if
				--context.repetition
				
			--and pseudorandom("cry_boredom_card")
			--	< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
			--then
			--local _card = context.joker_main
		--calculate the joker effects
			--local other_joker = nil
		--local other_joker2 = nil
			for i = 1, #G.jokers.cards do
				other_joker = G.jokers.cards[i]

				--allow 2 of these to exist
				if other_joker and other_joker ~= card and other_joker.config.center.key ~= "j_pogoB_blueprint_mythic" then--and other_joker.config.center.blueprint_compat
					--if context.before then--context.main_scoring and
						--ease_dollars(1)
					local _card =
					copy_card(other_joker, nil, nil, nil, true)--other_joker2.edition and other_joker2.edition.negative
					_card:add_to_deck()
					--_card:set_banana(true)
					_card.eternal = true
					_card.ability.perishimient = true
					_card:set_eternal(true)
					_card.ability.eternal = true
					_card:set_edition("e_negative")
					_card.ability.perishimient2 = true
					G.jokers:emplace(_card)
					--end
				end
			end
		end
			--return {
			--	message = localize("k_again_ex"),
			--	repetitions = 1,
			--	card = card,
			--}
			--end
		--end
	end,
}

--this one is crazy
local brokenJimbo = {
	object_type = "Joker",
	name = "Selective Jokes",
	key = "selective_jokes",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 1 },
	rarity = "pogoB_hah_mythic",
	cost = 7,
	order = 16,
	blueprint_compat = false,
	atlas = "atlasepic",

	--loc_vars = function(self, info_queue, center)
	--	return { vars = { number_format(center.ability.extra.slots) } }
	--end,
	--add_to_deck = function(self, card, from_debuff)
	--	if card.ability.extra.slots > card.ability.immutable.max_slots then
	--		card.ability.extra.slots = card.ability.immutable.max_slots
	--	end
	--	G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(card.ability.extra.slots))
	--end,
	add_to_deck = function(self, card, from_debuff)
		--card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		local mod = 1
		--G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or mod)
		--G.consumeables.config.card_limit = G.consumeables.config.card_limit + mod
		--G.hand:change_size(mod)
		--G.GAME.discount_percent = G.GAME.discount_percent - 25
		SMODS.change_booster_limit(mod)
		--SMODS.change_voucher_limit(mod)
		--SMODS.change_shop_size(-mod)
	end,
	calculate = function(self,card,context)
		if context.open_booster then
			context.card.ability.extra = math.ceil(context.card.ability.extra * 1.5)
			--context.card.ability.choose = context.card.ability.choose + 1
			card.ability.extra.skip_value = context.card.cost
		end
		if context.skipping_booster then
			ease_dollars(card.ability.extra.skip_value)
			card.ability.extra.skip_value = 0
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		local mod = 1
		--G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or -mod)
		--G.consumeables.config.card_limit = G.consumeables.config.card_limit - mod
		--G.hand:change_size(-mod)
		--G.GAME.discount_percent = G.GAME.discount_percent + 25
		SMODS.change_booster_limit(-mod)
		--SMODS.change_voucher_limit(-mod)
		--SMODS.change_shop_size(mod)
	end,
}

local universalHandType = {
	object_type = "Joker",
	name = "Selective Jokes",
	key = "universalHandType",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 1 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 8,
	order = 16,
	blueprint_compat = false,
	atlas = "atlasepic",

	--loc_vars = function(self, info_queue, center)
	--	return { vars = { number_format(center.ability.extra.slots) } }
	--end,
	--add_to_deck = function(self, card, from_debuff)
	--	if card.ability.extra.slots > card.ability.immutable.max_slots then
	--		card.ability.extra.slots = card.ability.immutable.max_slots
	--	end
	--	G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(card.ability.extra.slots))
	--end,
	update = function(self, card, dt)
		if G.STAGE == G.STAGES.RUN then
			if G.GAME.current_round.hands_played > 0 then
				G.GAME.current_round.hands_played = 0
			end
			if G.GAME.current_round.discards_used > 0 then
				G.GAME.current_round.discards_used = 0
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.current_round.hands_played > 0 then
			G.GAME.current_round.hands_played = 0
		end
		if G.GAME.current_round.discards_used > 0 then
			G.GAME.current_round.discards_used = 0
		end
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
			if not G.GAME.cry_panop_juggle then
				G.GAME.cry_panop_juggle = G.GAME.current_round.hands_left
			end
			G.GAME.current_round.hands_left = 0
		end
		if context.after and not context.blueprint and not context.retrigger_joker then
			if G.GAME.cry_panop_juggle then
				G.GAME.current_round.hands_left = G.GAME.cry_panop_juggle
				G.GAME.cry_panop_juggle = nil
			end
		end
	end,
}

local theKingdom = {
	object_type = "Joker",
	name = "Selective Jokes",
	key = "theKingdom",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 2 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 8,
	order = 12,
	blueprint_compat = true,
	atlas = "atlasepic",
	in_pool = function(self)
		--play at least 3 royal flushes this run
		return G.GAME.hands["pogoB_RoyalFlush"].played > 2
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["pogoB_RoyalFlush"]) then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { number_format(7) },
					}),
					colour = G.C.RED,
					Xmult_mod = 7,
				}
			end
		end
	end,
}

local theSolo = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Selective Jokes",
	key = "theSolo",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 2 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 6,
	order = 18,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main then
			if G.play and (#context.scoring_hand == 1) then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { number_format(2) },
					}),
					colour = G.C.RED,
					Xmult_mod = 2,
				}
			end
		end
	end,
}

local doubleUpper = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Selective Jokes",
	key = "doubleUpper",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 2 },
	rarity = "pogoB_hah_mythic",
	cost = 14,
	order = 21,
	blueprint_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss
			and 1==2
		then
			if G.GAME.modifiers.hah_doubleUp then
				G.GAME.modifiers.hah_doubleUp = G.GAME.modifiers.hah_doubleUp - 1
			else
				G.GAME.modifiers.hah_doubleUp = 0
			end
			local _hand = "High Card"
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = "All Hands",
				chips = 0,
				mult = 0,
				level = 1,
			})
			--local removed_levels = 0
			for k, v in ipairs(G.handlist) do
				level_up_hand(card, v, true, 1)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
			if G.GAME.modifiers.hah_doubleUp then
				G.GAME.modifiers.hah_doubleUp = G.GAME.modifiers.hah_doubleUp + 1
			else
				G.GAME.modifiers.hah_doubleUp = 1
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.hah_doubleUp then
			G.GAME.modifiers.hah_doubleUp = G.GAME.modifiers.hah_doubleUp + 1
		else
			G.GAME.modifiers.hah_doubleUp = 1
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.hah_doubleUp then
			G.GAME.modifiers.hah_doubleUp = G.GAME.modifiers.hah_doubleUp - 1
		else
			G.GAME.modifiers.hah_doubleUp = 0
		end
	end,
}

local timeMachine = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Thats right, were going back in time, to the first thanksgiving, to get turkeys off the menu",
	key = "timeMachine",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 3 },
	rarity = "pogoB_hah_mythic",
	cost = 9,
	order = 25,
	blueprint_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if not card.ability or not card.ability.immunity_stamp then
			set_stamp(card, "immunity_stamp")
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.ante = G.GAME.round_resets.ante - 1
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
	end,
}

local blackJackSuperScale = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Allow BS",
	key = "blackJackSuperScale",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 4 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 6,
	order = 5,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main and context.scoring_name == "pogoB_BlackJack" then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 2 },
				}),
				Xmult_mod = 2,
				colour = G.C.MULT,
			}
		elseif context.joker_main and context.full_hand then
			--local eval = evaluate_poker_hand(context.full_hand)
			if not next(context.poker_hands["pogoB_BlackJack"]) then--and option == 1
				return {
					--message = localize({
					--	type = "variable",
					--	key = "a_xmult",
					--	vars = { 0.5 },
					--}),
					x_mult_mod = 0.5,
					colour = G.C.MULT,
				}
			end
		end
		pogoB_config.allow_blackJack = true
	end,
	add_to_deck = function(self, card, from_debuff)
		pogoB_config.allow_blackJack = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		pogoB_config.allow_blackJack = false
	end,
}

local leveledHand = level_up_hand
function level_up_hand(card_used, hand_type, should_hide, levels_to_up)
	--Force suit to be suit X if specified in enhancement, only if not vampired
	if G.GAME.modifiers.hah_doubleUp and G.GAME.modifiers.hah_doubleUp > 0 then
		if levels_to_up == nil then 
			levels_to_up = 1 + G.GAME.modifiers.hah_doubleUp
		elseif levels_to_up < 1 then
			levels_to_up = levels_to_up--no change if its not up
		else
			levels_to_up = levels_to_up + G.GAME.modifiers.hah_doubleUp
		end
	end
	local vars = leveledHand(card_used, hand_type, should_hide, levels_to_up)
	return vars
end

local gamblersJoker = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Lets go gambling",
	key = "gamblersJoker",
	--pos = { x = 1, y = 3 },
	--config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 1, y = 3 },
	rarity = 3,--"pogoB_hah_mythic",
	cost = 7,
	order = 13,
	blueprint_compat = true,
	atlas = "atlasepic",
	config = {
		extra = {
			x_chips = 1,
			Xchipmod = 1,
			type = "High Card",
			revealed = false,
		},
	},
	loc_vars = function(self, info_queue, center)
		if center.ability.extra.revealed then
			--ease_dollars(1)
			return {
				vars = {
					number_format(center.ability.extra.x_chips),
					number_format(center.ability.extra.Xchipmod),
					localize(center.ability.extra.type, "poker_hands"),
				},
			}
		else
			--ease_dollars(1)
			return {
				vars = {
					number_format(center.ability.extra.x_chips),
					number_format(center.ability.extra.Xchipmod),
					"?????",
				},
			}
		end
	end,
	set_ability = function(self, card, initial, delay_sprites)--back up system
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
	end,
	add_to_deck = function(self, card, from_debuff)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
	end,
	calculate = function(self, card, context)
		if context.joker_main and context.scoring_name == card.ability.extra.type then
			card.ability.extra.revealed = true
			card.ability.revealed = true
			--loc_vars(self, info_queue, center)
			--center.ability.extra.revealed = true
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 10 },
				}),
				Xmult_mod = 10,
				colour = G.C.MULT,
			}
		end
	end,
}

local monolith = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Selective Jokes",
	key = "monolith",
	--pos = { x = 1, y = 3 },
	--config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 3 },
	rarity = "pogoB_hah_mythic",
	cost = 16,
	order = 22,
	blueprint_compat = true,
	atlas = "atlasepic",
	config = {
		extra = {
			x_chips = 1,
			Xchipmod = 1,
			type = "High Card",
		},
	},
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.x_chips),
				number_format(center.ability.extra.Xchipmod),
				localize(center.ability.extra.type, "poker_hands"),
			},
		}
	end,
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_name == card.ability.extra.type then
				card.ability.extra.x_chips =
					card.ability.extra.x_chips + card.ability.extra.Xchipmod
				return {
					message = localize("k_upgrade_ex"),
					card = card,
					colour = G.C.MULT,
				}
			end
		end
		if context.end_of_round then
			G.E_MANAGER:add_event(Event({
				func = function()
					local _type = {}
					for k, v in pairs(G.GAME.hands) do
						if v.visible and k ~= card.ability.extra.type then
							_type[#_type + 1] = k
						end
					end
					card.ability.extra.type = pseudorandom_element(_type, pseudoseed("oldblueprint"))
					return true
				end,
			}))
		end
		if context.joker_main and card.ability.extra.x_chips > 1 then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.x_chips) },
				}),
				Xmult_mod = card.ability.extra.x_chips,
				colour = G.C.CHIPS,
			}
		end
	end,
}

local boosterReverseCardSharp = {
	--1.5x mult if only 1 card is played
	object_type = "Joker",
	name = "Anti Card Sharp",
	key = "boosterReverseCardSharp",
	--pos = { x = 1, y = 3 },
	--config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 2 },
	rarity = 1,--"pogoB_hah_mythic",
	cost = 4,
	order = 3,
	blueprint_compat = true,
	atlas = "atlasepic",
	config = {
		extra = {
			x_chips = 1,
			Xchipmod = 1,
			type = "High Card",
		},
	},
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.x_chips),
				number_format(center.ability.extra.Xchipmod),
				localize(center.ability.extra.type, "poker_hands"),
			},
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.type = G.GAME.mostRecentHand
	end,
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.type = pseudorandom_element(
			_poker_hands,
			pseudoseed(
				"oldblueprint"
			)
		)
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_name ~= card.ability.extra.type then	
				if not G.GAME.galaxy_roundBoost then
					G.GAME.galaxy_roundBoost = 0
				end
				card:juice_up()
				G.GAME.galaxy_roundBoost = G.GAME.galaxy_roundBoost + 3
				return {
					message = localize("k_boost_ex"),
					card = card,
					colour = G.C.PURPLE,
				}
			end
		end
		if context.after then
			G.E_MANAGER:add_event(Event({
				func = function()
					card.ability.extra.type = G.GAME.mostRecentHand
					return true
				end,
			}))
		end
	end,
}


local factoryNewBlueprint = {
	object_type = "Joker",
	name = "Selective Jokes",
	key = "factoryNewBlueprint",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 3 },
	rarity = "pogoB_hah_mythic",
	cost = 12,
	order = 19,
	blueprint_compat = true,
	atlas = "atlasepic",
	--blueprint_compat = false,
	--eternal_compat = true,
	--atlas = "atlasthree",
	calculate = function(self, card, context)
		local other_joker = nil
		local other_joker2 = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i + 1]
			end
		end
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker2 = G.jokers.cards[i - 1]
			end
		end
		if other_joker and other_joker ~= card and other_joker2 and other_joker2 ~= card then
			if context.end_of_round then
				local _card =
				copy_card(other_joker, nil, nil, nil, true)--other_joker2.edition and other_joker2.edition.negative
				_card:add_to_deck()
				--_card:set_banana(true)
				_card.eternal = true
				_card.ability.perishimient = true
				_card:set_eternal(true)
				_card.ability.eternal = true
				_card:set_edition("e_negative")
				--_card.ability.perishimient2 = true
				G.jokers:emplace(_card)

				_card =
				copy_card(other_joker2, nil, nil, nil, true)--other_joker2.edition and other_joker2.edition.negative
				_card:add_to_deck()
				--_card:set_banana(true)
				_card.eternal = true
				_card.ability.perishimient = true
				_card:set_eternal(true)
				_card.ability.eternal = true
				_card:set_edition("e_negative")
				--_card.ability.perishimient2 = true
				G.jokers:emplace(_card)
			end
		end
	end,
}

local factoryNewBlueprint2 = {
	object_type = "Joker",
	name = "Selective Jokes",
	key = "factoryNewBlueprint2",
	--pos = { x = 1, y = 3 },
	config = { extra = { options = 1, skip_value = 0 } },
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 1 },
	rarity = "pogoB_hah_mythic",
	cost = 12,
	order = 19,
	blueprint_compat = false,--this would be an infinite loop
	atlas = "atlasepic",
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i + 1]
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker2 = G.jokers.cards[i - 1]
				end
			end
			if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat and other_joker2 and other_joker2 ~= card and other_joker2.config.center.blueprint_compat then
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
	--blueprint_compat = false,
	--eternal_compat = true,
	--atlas = "atlasthree",
	calculate = function(self, card, context)
		local other_joker = nil
		local other_joker2 = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i + 1]
			end
		end
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker2 = G.jokers.cards[i - 1]
			end
		end
		if other_joker and other_joker ~= card and other_joker2 and other_joker2 ~= card then
			if context.end_of_round then
				local _card =
				copy_card(other_joker, nil, nil, nil, true)--other_joker2.edition and other_joker2.edition.negative
				_card:add_to_deck()
				--_card:set_banana(true)
				_card.eternal = true
				_card.ability.perishimient = true
				_card:set_eternal(true)
				_card.ability.eternal = true
				_card:set_edition("e_negative")
				--_card.ability.perishimient2 = true
				G.jokers:emplace(_card)
			end
		end
	end,
}

--blueprint but better?
local legendANKH = {
	object_type = "Joker",
	name = "Factory",
	key = "legend_ankh",
	--pos = { x = 1, y = 3 },
	config = {
		extra = {
			left_joker_rare = 1,
			right_joker_rare = 5,
			--1 common, 2 uncommon, 3 rare, 4 mythic, 5 legendary
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 1, y = 1 },
	rarity = 4,--"pogoB_hah_mythic",--1 comon, 2 un, 3 rar, 4 leg
	cost = 20,
	order = 30,
	atlas = "atlasepic",
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker2 = G.jokers.cards[i + 1]
				end
				card.ability.extra.right_joker_rare = 5
				if other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.right_joker_rare = other_joker2.rarity
					if other_joker2.rarity == 4 then
						card.ability.extra.right_joker_rare = 5
					end
					if other_joker2.rarity == "pogoB_hah_mythic" then
						card.ability.extra.right_joker_rare = 4
					end
				end
				if card.ability.extra.right_joker_rare == nil then
					card.ability.extra.right_joker_rare = 5
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i - 1]
				end
				card.ability.extra.left_joker_rare = 1
				if other_joker and other_joker ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.left_joker_rare = other_joker.rarity
					if other_joker.rarity == 4 then
						card.ability.extra.left_joker_rare = 5
					end
					if other_joker.rarity == "pogoB_hah_mythic" then
						card.ability.extra.left_joker_rare = 4
					end
				end
				if card.ability.extra.left_joker_rare == nil then
					card.ability.extra.left_joker_rare = 1
				end
			end
			if other_joker and other_joker ~= card and not other_joker.ability.eternal and other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat --and (card.ability.extra.left_joker_rare >= card.ability.extra.right_joker_rare)
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
	calc_dollar_bonus = function(self, card)
	if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker2 = G.jokers.cards[i + 1]
				end
				card.ability.extra.right_joker_rare = 5
				if other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.right_joker_rare = other_joker2.rarity
					if other_joker2.rarity == 4 then
						card.ability.extra.right_joker_rare = 5
					end
					if other_joker2.rarity == "pogoB_hah_mythic" then
						card.ability.extra.right_joker_rare = 4
					end
				end
				if card.ability.extra.right_joker_rare == nil then
					card.ability.extra.right_joker_rare = 5
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i - 1]
				end
				card.ability.extra.left_joker_rare = 1
				if other_joker and other_joker ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.left_joker_rare = other_joker.rarity
					if other_joker.rarity == 4 then
						card.ability.extra.left_joker_rare = 5
					end
					if other_joker.rarity == "pogoB_hah_mythic" then
						card.ability.extra.left_joker_rare = 4
					end
				end
				if card.ability.extra.left_joker_rare == nil then
					card.ability.extra.left_joker_rare = 1
				end
			end
			if other_joker and other_joker ~= card and not other_joker.ability.eternal and other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat --and (card.ability.extra.left_joker_rare >= card.ability.extra.right_joker_rare)
				--card.ability.blueprint_compat = "compatible"
				card:juice_up()
				play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
				play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
				other_joker:start_dissolve()
				typeSpawn = other_joker2.ability.key
				--if typeSpawn == nil then
				--	typeSpawn = other_joker2.key
				--end
				local _card =
						copy_card(other_joker2, nil, nil, nil, other_joker2.edition and other_joker2.edition.negative)--other_joker2.edition and other_joker2.edition.negative replace with true to disable all editions, nil to allow
					_card:add_to_deck()
					--_card:set_banana(true)
					--_card.ability.perishable = true -- Done manually to bypass perish compat
					--_card.ability.perish_tally = G.GAME.perishable_rounds
					G.jokers:emplace(_card)
				--end
			else
				--card.ability.blueprint_compat = "incompatible"
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_nope_ex"), colour = G.C.FILTER }
				)
			end
		end
	end,
	blueprint_compat = false,--infinite loop?
	eternal_compat = true,
	--atlas = "atlasthree",
}

--Reality Warping Funnel
local theGrandFunnel = {
	object_type = "Joker",
	name = "FUNNEL CAKE",
	key = "theGrandFunnel",
	--pos = { x = 1, y = 3 },
	config = {
		extra = {
			left_joker_rare = 1,
			right_joker_rare = 5,
			--1 common, 2 uncommon, 3 rare, 4 mythic, 5 legendary
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 1, y = 2 },
	rarity = "pogoB_hah_mythic",--1 comon, 2 un, 3 rar, 4 leg
	cost = 14,
	order = 27,
	atlas = "atlasepic",
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker2 = G.jokers.cards[i + 1]
				end
				card.ability.extra.right_joker_rare = 5
				if other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.right_joker_rare = other_joker2.rarity
					if other_joker2.rarity == 4 then
						card.ability.extra.right_joker_rare = 5
					end
					if other_joker2.rarity == "pogoB_hah_mythic" then
						card.ability.extra.right_joker_rare = 4
					end
				end
				if card.ability.extra.right_joker_rare == nil then
					card.ability.extra.right_joker_rare = 5
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i - 1]
				end
				card.ability.extra.left_joker_rare = 1
				if other_joker and other_joker ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.left_joker_rare = other_joker.rarity
					if other_joker.rarity == 4 then
						card.ability.extra.left_joker_rare = 5
					end
					if other_joker.rarity == "pogoB_hah_mythic" then
						card.ability.extra.left_joker_rare = 4
					end
				end
				if card.ability.extra.left_joker_rare == nil then
					card.ability.extra.left_joker_rare = 1
				end
			end
			if G.GAME.mythic_Funnel_savedCard then--other_joker.ability.center.blueprint_compat --and (card.ability.extra.left_joker_rare >= card.ability.extra.right_joker_rare)
				card.ability.blueprint_compat2 = localize("k_active_ex")
				card.ability.blueprint_compat = "compatible"
			elseif other_joker and other_joker ~= card and not other_joker.ability.eternal and other_joker2 and other_joker2 ~= card and not other_joker2.ability.eternal then--other_joker.ability.center.blueprint_compat --and (card.ability.extra.left_joker_rare >= card.ability.extra.right_joker_rare)
				card.ability.blueprint_compat = "compatible"
				card.ability.blueprint_compat2 = nil
			else
				card.ability.blueprint_compat = "incompatible"
				card.ability.blueprint_compat2 = nil
			end
		end
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		if card.ability.blueprint_compat2 == localize("k_active_ex") then
			return {
				main_end = (card.area and card.area == G.jokers) and {
					{
						n = G.UIT.C,
						config = { align = "bm", minh = 0.4 },
						nodes = {
							{
								n = G.UIT.C,
								config = {
									ref_table = card,
									align = "m",
									colour = G.C.ORANGE,
									r = 0.05,
									padding = 0.06,
									--func = "blueprint_compat2",
									--colour = G.C.YELLOW,
									colour = G.C.ORANGE,
								},
								nodes = {
									{
										n = G.UIT.T,
										config = {
											ref_table = card.ability,
											ref_value = "blueprint_compat2",
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.32 * 0.8,
										},
									},
								},
							},
						},
					},
				} or nil,
			}
		else
			return {
				main_end = (card.area and card.area == G.jokers) and {
					{
						n = G.UIT.C,
						config = { align = "bm", minh = 0.4 },
						nodes = {
							{
								n = G.UIT.C,
								config = {
									ref_table = card,
									align = "m",
									colour = G.C.JOKER_GREY,
									r = 0.05,
									padding = 0.06,
									func = "blueprint_compat",
								},
								nodes = {
									{
										n = G.UIT.T,
										config = {
											ref_table = card.ability,
											ref_value = "blueprint_compat_ui",
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.32 * 0.8,
										},
									},
								},
							},
						},
					},
				} or nil,
			}
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			--local card_show2 = create_card("Joker", G.jokers, nil, here is rarity, nil, nil, nil, "j_joker")--"pogoB_hah_mythic"
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker2 = G.jokers.cards[i + 1]
				end
				card.ability.extra.right_joker_rare = 5
				if other_joker2 and other_joker2 ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.right_joker_rare = other_joker2.rarity
					if other_joker2.rarity == 4 then
						card.ability.extra.right_joker_rare = 5
					end
					if other_joker2.rarity == "pogoB_hah_mythic" then
						card.ability.extra.right_joker_rare = 4
					end
				end
				if card.ability.extra.right_joker_rare == nil then
					card.ability.extra.right_joker_rare = 5
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i - 1]
				end
				card.ability.extra.left_joker_rare = 1
				if other_joker and other_joker ~= card then--other_joker.ability.center.blueprint_compat
					card.ability.extra.left_joker_rare = other_joker.rarity
					if other_joker.rarity == 4 then
						card.ability.extra.left_joker_rare = 5
					end
					if other_joker.rarity == "pogoB_hah_mythic" then
						card.ability.extra.left_joker_rare = 4
					end
				end
				if card.ability.extra.left_joker_rare == nil then
					card.ability.extra.left_joker_rare = 1
				end
			end
			if other_joker and other_joker ~= card and not other_joker.ability.eternal and other_joker2 and other_joker2 ~= card and not other_joker2.ability.eternal then--other_joker.ability.center.blueprint_compat --and (card.ability.extra.left_joker_rare >= card.ability.extra.right_joker_rare)
				--card.ability.blueprint_compat = "compatible"
				local shouldActuallyNope = false
				local chosen_joker = other_joker
				if math.random() > 0.5 then
					chosen_joker = other_joker2
				end
				if other_joker.edition and other_joker.edition.negative then
					chosen_joker = other_joker2
				end
				if other_joker2.edition and other_joker2.edition.negative then
					chosen_joker = other_joker
				end
				if other_joker.edition and other_joker2.edition and other_joker.edition.negative and other_joker2.edition.negative then
					shouldActuallyNope = true
				end
				if shouldActuallyNope then
					card_eval_status_text(
						card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_nope_ex"), colour = G.C.FILTER }
					)
				else
					card:juice_up()
					play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
					--play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
					
					typeSpawn = other_joker2.ability.key
					--if typeSpawn == nil then
					--	typeSpawn = other_joker2.key
					--end
				
					G.GAME.mythic_Funnel_savedCard = chosen_joker--copy_card(chosen_joker, nil, nil, nil, true)
					other_joker:start_dissolve()
					other_joker2:start_dissolve()
					--G.GAME.mythic_Funnel_savedCard:start_dissolve()
							--other_joker2.edition and other_joker2.edition.negative
						--_card:add_to_deck()
						--G.jokers:emplace(_card)
				end
			else
				--card.ability.blueprint_compat = "incompatible"
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_nope_ex"), colour = G.C.FILTER }
				)
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if G.GAME.mythic_Funnel_savedCard then
			card:juice_up()
			play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
			G.GAME.mythic_Funnel_savedCard = copy_card(G.GAME.mythic_Funnel_savedCard, nil, nil, nil, true)
			G.GAME.mythic_Funnel_savedCard:add_to_deck()
			G.GAME.mythic_Funnel_savedCard:set_edition("e_negative")
			G.jokers:emplace(G.GAME.mythic_Funnel_savedCard)
			G.GAME.mythic_Funnel_savedCard = nil
		end
	end,
	blueprint_compat = false,--infinite loop?
	eternal_compat = true,
	--atlas = "atlasthree",
}

local blanker = {
	object_type = "Joker",
	name = "Blank Joker",
	key = "blank_joke",
	config = {
		extra = {
			cashouts_left = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 4,
	order = 1,
	in_pool = function(self)
		return not G.GAME.blank_joker_banned
	end,
	blueprint_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["pogoB_BlankHand"]) then
				card:juice_up()
				if not card.ability.extra.cashouts_left then
					card.ability.extra.cashouts_left = 1
				end
				card.ability.extra.cashouts_left = card.ability.extra.cashouts_left + 2
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		--if card.ability.extra.cashouts_left ~= nil then
		card:juice_up()
		if not card.ability.extra.cashouts_left then
			card.ability.extra.cashouts_left = 1
		end
		if math.random() < card.ability.extra.cashouts_left * 0.01 then--1% chance
			--add_tag(Tag("tag_negative"))
			--add_tag(Tag("tag_pogoB_anitmaterJoke"))
			play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
			play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
			card:start_dissolve()
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					card.T.r = -0.2
					card:juice_up(0.3, 0.4)
					card.states.drag.is = true
					card.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.3,
						blockable = false,
						func = function()
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true
						end,
					}))
					return true
				end,
			}))
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_extinct_ex"), colour = G.C.FILTER }
			)
			local card_show2 = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic2", nil, nil, nil, "j_pogoB_theFabledAntimatterJoker", "j_pogoB_theFabledAntimatterJoker")--"pogoB_hah_mythic"
				card_show2:add_to_deck()
				card_show2:start_materialize()
				--card_show2.eternal = true
				--card_show2.ability.perishimient = true
				--card_show2:set_eternal(true)
				--card_show2.ability.eternal = true
				card_show2:set_edition("e_negative")
				G.jokers:emplace(card_show2)
			G.GAME.blank_joker_banned = true
		end
		card.ability.extra.cashouts_left = card.ability.extra.cashouts_left + 1
		--add_tag(Tag("tag_negative"))
		--add_tag(Tag("tag_voucher"))
		--add_tag(Tag("tag_orbital"))
		--play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
		--play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.cashouts_left) } }
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.cashouts_left = 1--just in case
	end,
	remove_from_deck = function(self, card, from_debuff)
		if card.ability.extra.cashouts_left > 1 then--can loop if sold at the right time, but not reccomended
			add_tag(Tag("tag_pogoB_common_stamp"))
		end
	end,
}

local anitmater = {
	object_type = "Joker",
	name = "Antimatter Joker",
	key = "theFabledAntimatterJoker",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 0 },
	rarity = "pogoB_hah_mythic2",
	cost = 1,
	order = 999,--29
	blueprint_compat = false,
	perishable_compat = false,
	atlas = "atlasepic",
	--calc_dollar_bonus = function(self, card)
		--add_tag(Tag("tag_negative"))
		--add_tag(Tag("tag_voucher"))
		--add_tag(Tag("tag_orbital"))
		--play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
		--play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
	--end,
	calculate = function(self, card, context)
		if not card.edition or not card.edition.negative then
			card:set_edition("e_negative")
		end
		if not card.ability or not card.ability.immunity_stamp then
			set_stamp(card, "immunity_stamp")
		end
		if card.ability and card.ability.rental then
			card.ability.rental = false
		end
		if card.ability and card.ability.eternal then
			card.ability.eternal = false
		end
		if card.ability and card.ability.perishable then
			card.ability.perishable = false
		end
		if card.ability and card.ability.champion_sticker_stake then
			card.ability.champion_sticker_stake = false
		end
		--if not card.ability or not card.ability.eternal then
		--	card:set_eternal()
		--end
		if not G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives then
			G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives = 0
		else--dont want it on same frame, it breaks things
			local negative_joker_count = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] and G.jokers.cards[i].edition and G.jokers.cards[i].edition.negative and G.jokers.cards[i] ~= card then
					negative_joker_count = negative_joker_count + 1
				end
			end
			if negative_joker_count > G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives then
				G.jokers.config.card_limit = G.jokers.config.card_limit + (negative_joker_count - G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives)
				G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives = negative_joker_count
			end
			if negative_joker_count < G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives then
				G.jokers.config.card_limit = G.jokers.config.card_limit - (G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives - negative_joker_count)
				G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives = negative_joker_count
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.blank_joker_banned = true
		--G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		--if not card.edition or not card.edition.negative then
		--	card:set_edition("e_negative")
		--end
		--if not card.ability or not card.ability.immunity_stamp then
		--	set_stamp(card, "immunity_stamp")
		--end
		--if not card.ability or not card.ability.eternal then
		--	card:set_eternal()
		--end
	end,
	remove_from_deck = function(self, card, from_debuff)
		--why would you do this?
		G.jokers.config.card_limit = G.jokers.config.card_limit - G.GAME.anitmater_joker_extra_jokerslots_from_other_negatives
		G:save_settings()
		G:save_progress()
		love.window.showMessageBox(
			"lovely-injector",
			"lovely-injector has crashed:\nThe Player Is An Idiot",
			"error"
		)

		function love.errorhandler() end
		print(crash.crash.crash)--it fucking crashes the game
	end,
}

local jimbo = {
	object_type = "Joker",
	name = "JIMBO Joker JIMBO",
	key = "jimbo",
	config = {
		extra = {
			mult = 4,
			x_mult = 1,
			e_mult = 1,
			z_mult = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 5, y = 2 },
	rarity = "pogoB_hah_jimbo",
	cost = 2,
	order = 100,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize({
				type = "variable",
				key = "a_TETRATED",
				--vars = { 4 },
			}),
			x_mult_mod = 1 + ((mult * 0.0001) ^ (mult * 0.0001)),
			colour = HEX("00e621"),--G.C.DARK_EDITION,
			}
		end
	end,
}

local holyFuckCasualTetration = {
	object_type = "Joker",
	name = "Tetration Joker",
	key = "holyFuckCasualTetration",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 0 },
	rarity = "pogoB_hah_mythic",
	cost = 16,
	order = 40,
	blueprint_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize({
				type = "variable",
				key = "a_TETRATED",
				--vars = { 4 },
			}),
			x_mult_mod = 1 + ((mult * 0.00001) ^ (mult * 0.00001)),
			colour = HEX("00e621"),--G.C.DARK_EDITION,
			}
		end
	end,
}

local accelerant = {
	object_type = "Joker",
	name = "Accelerant Joker",
	key = "accelerant",
	config = {
		extra = {
			chance1 = 1,--in 2
			chance2 = 7,--in 20
			chance3 = 3,--in 20
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 4, y = 1 },
	rarity = "pogoB_hah_mythic",
	cost = 14,
	order = 23,
	blueprint_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.chance1) * G.GAME.probabilities.normal,
				number_format(center.ability.extra.chance2) * G.GAME.probabilities.normal,
				number_format(center.ability.extra.chance3) * G.GAME.probabilities.normal,-- * G.GAME.probabilities.normal, how does it know?
			},
		}
	end,
	calculate = function(self, card, context)
		if G.play and G.play.cards and context.joker_main then
			if G.play.cards[1] then
				if G.play.cards[1].edition and G.play.cards[1].edition.holo and math.random() <= (3 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[1]:set_edition("e_polychrome")
				end
				if G.play.cards[1].edition and G.play.cards[1].edition.foil and math.random() <= (7 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[1]:set_edition("e_holo")
				end
				if not G.play.cards[1].edition and math.random() <= (1 * G.GAME.probabilities.normal) / 2 then
					G.play.cards[1]:set_edition("e_foil")
				end
			end
			if G.play.cards[2] then
				if G.play.cards[2].edition and G.play.cards[2].edition.holo and math.random() <= (3 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[2]:set_edition("e_polychrome")
				end
				if G.play.cards[2].edition and G.play.cards[2].edition.foil and math.random() <= (7 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[2]:set_edition("e_holo")
				end
				if not G.play.cards[2].edition and math.random() <= (1 * G.GAME.probabilities.normal) / 2 then
					G.play.cards[2]:set_edition("e_foil")
				end
			end
			if G.play.cards[3] then
				if G.play.cards[3].edition and G.play.cards[3].edition.holo and math.random() <= (3 * G.GAME.probabilities.normal)  / 20 then
					G.play.cards[3]:set_edition("e_polychrome")
				end
				if G.play.cards[3].edition and G.play.cards[3].edition.foil and math.random() <= (7 * G.GAME.probabilities.normal)  / 20 then
					G.play.cards[3]:set_edition("e_holo")
				end
				if not G.play.cards[3].edition and math.random() <= (1 * G.GAME.probabilities.normal) / 2 then
					G.play.cards[3]:set_edition("e_foil")
				end
			end
			if G.play.cards[4] then
				if G.play.cards[4].edition and G.play.cards[4].edition.holo and math.random() <= (3 * G.GAME.probabilities.normal)  / 20 then
					G.play.cards[4]:set_edition("e_polychrome")
				end
				if G.play.cards[4].edition and G.play.cards[4].edition.foil and math.random() <= (7 * G.GAME.probabilities.normal)  / 20 then
					G.play.cards[4]:set_edition("e_holo")
				end
				if not G.play.cards[4].edition and math.random() <= (1 * G.GAME.probabilities.normal) / 2 then
					G.play.cards[4]:set_edition("e_foil")
				end
			end
			if G.play.cards[5] then
				if G.play.cards[5].edition and G.play.cards[5].edition.holo and math.random() <= (3 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[5]:set_edition("e_polychrome")
				end
				if G.play.cards[5].edition and G.play.cards[5].edition.foil and math.random() <= (7 * G.GAME.probabilities.normal) / 20 then
					G.play.cards[5]:set_edition("e_holo")
				end
				if not G.play.cards[5].edition and math.random() <= (1 * G.GAME.probabilities.normal) / 2 then
					G.play.cards[5]:set_edition("e_foil")
				end
			end
		end
	end,
}

local riffRaffButGood = {
	object_type = "Joker",
	name = "RIFFLE RAFFLE Joker",
	key = "riffRaffButGood",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 1, y = 2 },
	rarity = "pogoB_hah_mythic",
	cost = 10,
	order = 12,
	blueprint_compat = false,
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		if card.ability and card.ability.perishimient then --infinite loop technically possible (via showman)
			for i = 1, 5 do
				local card_show2 = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "j_joker")--"pogoB_hah_mythic"
					card_show2:add_to_deck()
					card_show2:start_materialize()
					card_show2.eternal = true
					card_show2.ability.perishimient = true
					card_show2:set_eternal(true)
					card_show2.ability.eternal = true
					card_show2.ability.procrast = false
					card_show2.debuff = false
					card_show2:set_edition("e_negative")
					G.jokers:emplace(card_show2)
			end
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
		--local card_show2 = create_card("Joker", G.jokers, nil, here is rarity, nil, nil, nil, "j_joker")--"pogoB_hah_mythic"
		for i = 1, 5 do
			if pseudorandom("riffleRaffleDuplication") > 0.99 and not card.ability.perishimient then --1% chance to make itself
			local card_show2 = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "j_pogoB_riffRaffButGood", "j_pogoB_riffRaffButGood")--"pogoB_hah_mythic"
				card_show2:add_to_deck()
				card_show2:start_materialize()
				card_show2.eternal = true
				card_show2.ability.perishimient = true
				card_show2:set_eternal(true)
				card_show2.ability.eternal = true
				card_show2:set_edition("e_negative")
				G.jokers:emplace(card_show2)
			else
			local card_show2 = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "j_joker")--"pogoB_hah_mythic"
				card_show2:add_to_deck()
				card_show2:start_materialize()
				card_show2.eternal = true
				card_show2.ability.perishimient = true
				card_show2:set_eternal(true)
				card_show2.ability.eternal = true
				card_show2:set_edition("e_negative")
				G.jokers:emplace(card_show2)
			end
		end
		end
	end,
}

-- Canvas
-- Retrigger all Jokers to the left once for every non-Common Joker to the right of this Joker
-- Still considering moving to Legendary - Jevonn
local canvas = {
	object_type = "Joker",
	name = "Printer",
	key = "duo_print",
	--pos = { x = 1, y = 3 },
	config = {
		extra = {
			triggers = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 2, y = 0 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 1,
	order = 7,
	blueprint_compat = false,
	atlas = "atlasepic",
	
	--loc_vars = function(self, info_queue, center)
	--	return { key = Cryptid.gameset_loc(self, { modest = "balanced" }) }
	--end,
	remove_from_deck = function(self, card, from_debuff)
		for i = 1, 3 do
			local card = create_card("Joker", G.jokers, nil, nil, true, nil, "j_brainstorm", "j_brainstorm")
				card:add_to_deck()
				card:start_materialize()
				card.ability.perishimient = true
				card:juice_up()
				card.ability.eternal = true
				card.eternal = true
				card:set_eternal(true)
				card:set_edition("e_negative")
				G.jokers:emplace(card)
		end
		--pools = { ["Joker"] = false },
			--return {
			--	message = localize("k_again_ex"),
			--	repetitions = 1,
			--	card = card,
			--}
	end,
}

-- ERROR
-- Displays a glitched message
-- While in shop, all cards are Glitched (fallback: Foil)
-- After a random number of rounds, duplicates all Jokers when sold
-- The glitched message can tell you what the next card rolled in the shop will be (similar to the Misprint easter egg)
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = { x = 4, y = 2 },
	config = {
		extra = {
			sell_rounds = 0,
			active = false,
		},
	},
	dependencies = {
		items = {
			-- Note: This currently does not have a dependency on Glitched because there's a fallback.
			-- However I think this should be changed later...
			"set_cry_epic",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 1,
	order = 72,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		local ok, ret = pcall(Cryptid.predict_card_for_shop)
		if Cryptid.safe_get(G.GAME, "pseudorandom") and G.STAGE == G.STAGES.RUN and ok then
			cry_error_msgs[#cry_error_msgs].string = "%%" .. ret
		else
			cry_error_msgs[#cry_error_msgs].string = "%%J6"
		end
		return {
			main_start = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_operators,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.30,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_numbers,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.33,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_msgs,
							colours = { G.C.UI.TEXT_DARK },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.4011,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
			},
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition_from_deck = G.GAME.modifiers.cry_force_edition
		elseif not G.GAME.modifiers.cry_force_edition_from_deck then
			if G.P_CENTERS.e_cry_glitched then
				G.GAME.modifiers.cry_force_edition = "cry_glitched"
			else
				G.GAME.modifiers.cry_force_edition = "foil"
			end
			G.GAME.modifiers.cry_force_edition_from_deck = "Nope!"
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition_from_deck ~= "Nope!" then
			G.GAME.modifiers.cry_force_edition = G.GAME.modifiers.cry_force_edition_from_deck
		else
			G.GAME.modifiers.cry_force_edition = nil
		end
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.repetition
			and not context.individual
			and not card.ability.extra.active
		then
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.sell_rounds = math.floor(pseudorandom(pseudoseed("cry_error")) * 10 + 1)
			end
			card.ability.extra.sell_rounds = card.ability.extra.sell_rounds - 1
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.active = true
				local eval = function(card)
					return not card.REMOVED
				end
				juice_card_until(card, eval, true)
			else
				return {
					message = "???",
					colour = G.C.BLACK,
				}
			end
		end
		if
			context.selling_self
			and card.ability.extra.active
			and not context.retrigger_joker
			and not context.blueprint
		then
			local eval = function(card)
				return (Cryptid.safe_get(card, "ability", "loyalty_remaining") == 0) and not G.RESET_JIGGLES
			end
			juice_card_until(card, eval, true)
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name ~= "cry-Error" then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			for i = 1, #jokers do
				local card = copy_card(jokers[i])
				card:add_to_deck()
				G.jokers:emplace(card)
			end
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Coronacht",
			"Fetch",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Math",
		},
	},
	init = function(self)
		cry_error_operators = { "+", "-", "X", "/", "^", "=", ">", "<", "m" }
		cry_error_numbers = {
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"10",
			"69",
			"404",
			"420",
			"-1",
			"0.5",
			"m",
			"nan",
			"inf",
			"nil",
			"pi",
			"1e9",
			"???",
			"114",
			"leet",
			"666",
			"eee6",
			"21",
			"365",
			"2024",
		}
		cry_error_msgs = {
			{ string = "rand()", colour = G.C.RARITY["cry_exotic"] },
			{ string = "m", colour = G.C.UI.TEXT_DARK },
			{ string = "Chips", colour = G.C.CHIPS },
			{ string = "Mult", colour = G.C.MULT },
			{ string = "Jokers", colour = G.C.FILTER },
			{ string = "dollars", colour = G.C.FILTER },
			{ string = "hands", colour = G.C.FILTER },
			{ string = "slots", colour = G.C.FILTER },
			{ string = "Antes", colour = G.C.FILTER },
			{ string = "ERROR", colour = G.C.UI.TEXT_INACTIVE },
			{ string = "Tarots", colour = G.C.SECONDARY_SET.Tarot },
			{ string = "Planets", colour = G.C.SECONDARY_SET.Planet },
			{ string = "Codes", colour = G.C.SECONDARY_SET.Code },
			{ string = "Specls", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "Jolly", colour = G.C.CRY_JOLLY },
			{ string = "Tags", colour = G.C.RED },
			{ string = "Cryptids", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "Glop", colour = G.C.CRY_ALTGREENGRADIENT },
			{ string = "%%ERROR", colour = G.C.CRY_ASCENDANT }, --temp string, this will be modified
		}

		function Cryptid.predict_pseudoseed(key)
			local M = G.GAME.pseudorandom[key] or pseudohash(key .. (G.GAME.pseudorandom.seed or ""))
			local m = math.abs(tonumber(string.format("%.13f", (2.134453429141 + M * 1.72431234) % 1)))
			return (m + (G.GAME.pseudorandom.hashed_seed or 0)) / 2
		end

		function Cryptid.predict_card_for_shop()
			local total_rate = G.GAME.joker_rate + G.GAME.playing_card_rate
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				total_rate = total_rate + (G.GAME[v:lower() .. "_rate"] or 0)
			end
			local polled_rate = pseudorandom(Cryptid.predict_pseudoseed("cdt" .. G.GAME.round_resets.ante)) * total_rate
			local check_rate = 0
			-- need to preserve order to leave RNG unchanged
			local rates =
				{
					{ type = "Joker", val = G.GAME.joker_rate },
					{ type = "Tarot", val = G.GAME.tarot_rate },
					{ type = "Planet", val = G.GAME.planet_rate },
					{
						type = (G.GAME.used_vouchers["v_illusion"] and pseudorandom(
							Cryptid.predict_pseudoseed("illusion")
						) > 0.6) and "Enhanced" or "Base",
						val = G.GAME.playing_card_rate,
					},
					{ type = "Spectral", val = G.GAME.spectral_rate },
				}
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				if not (v == "Tarot" or v == "Planet" or v == "Spectral") then
					table.insert(rates, { type = v, val = G.GAME[v:lower() .. "_rate"] })
				end
			end
			for _, v in ipairs(rates) do
				if polled_rate > check_rate and polled_rate <= check_rate + v.val then
					local c = create_card(v.type, "ERROR", nil, nil, nil, nil, nil, "sho")
					if not c.set then
						return v.type:sub(1, 1) .. c.suit:sub(1, 1) .. c.value:sub(1, 2)
					else
						for i = 1, #G.P_CENTER_POOLS[c.set] do
							if G.P_CENTER_POOLS[c.set][i].key == c.key then
								return c.set:sub(1, 1) .. i
							end
						end
					end
				end
				check_rate = check_rate + v.val
			end
		end
	end,
}

-- m
-- This Joker gains X13 Mult when Jolly Joker is sold
local m = {
	object_type = "Joker",
	discovered = true,
	name = "cry-m",
	key = "m",
	pos = { x = 3, y = 1 },
	config = {
		extra = {
			extra = 13,
			x_mult = 1,
		},
	},
	gameset_config = {
		modest = {
			extra = {
				extra = 1,
				x_mult = 1,
			},
		},
	},
	dependencies = {
		items = {
			"set_cry_epic",
			"set_cry_meme",
			-- Note: This isn't in the M Joker content set due to being added separately
		},
	},
	pools = { ["Meme"] = true, ["M"] = true },
	rarity = "cry_epic",
	order = 1,
	cost = 13,
	effect = "M Joker",
	perishable_compat = false,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_jolly
		return {
			vars = {
				number_format(center.ability.extra.extra),
				number_format(center.ability.extra.x_mult),
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main and (to_big(card.ability.extra.x_mult) > to_big(1)) then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.x_mult) },
				}),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if context.selling_card and context.card:is_jolly() and not context.blueprint then
			card.ability.extra.x_mult = lenient_bignum(to_big(card.ability.extra.x_mult) + card.ability.extra.extra)
			if not context.retrigger_joker then
				--This doesn't display the correct amount of mult if retriggered it display the amount from the first retrigger instead of the final one
				--But I would rather have this than constant card_eval_status_text spam
				--If anyone knows a solution feel free to do a pr xd
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { number_format(card.ability.extra.x_mult) },
					}),
				})
			end
			return nil, true
		end
		if context.forcetrigger then
			card.ability.extra.x_mult = lenient_bignum(to_big(card.ability.extra.x_mult) + card.ability.extra.extra)
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.x_mult) },
				}),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- M
-- Create a Negative Jolly Joker when Blind is selected
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = { x = 0, y = 0 },
	order = 250,
	dependencies = {
		items = {
			"set_cry_epic",
			--Note: This isn't in the M Joker content set due to being added separately
		},
	},
	rarity = "cry_epic",
	effect = "M Joker",
	cost = 13,
	immutable = true,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_jolly
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if (context.setting_blind and not (context.blueprint_card or self).getting_sliced) or context.forcetrigger then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
			card:set_edition({
				negative = true,
			})
			card:add_to_deck()
			G.jokers:emplace(card)
			return nil, true
		end
	end,
	pools = { ["M"] = true },
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- Boredom
-- 1 in 2 chance to retrigger each Joker or played card
local boredom = {
	object_type = "Joker",
	name = "Retriggering Jokes",
	key = "bordom",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 1 },
	rarity = "pogoB_hah_mythic",
	cost = 10,
	order = 18,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.repetition
			and context.cardarea == G.play
			--balancing purposes
			--and pseudorandom("cry_boredom_card")
			--	< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			if #G.jokers.cards <= G.jokers.config.card_limit then
				return {
					message = localize("k_again_ex"),
					repetitions = 3,
					card = card,
				}
			else
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			end
		end
		--if G.GAME.blind.boss and context.setting_blind then
		--	local card = create_card("Consumeable", G.consumeables, nil, nil, true, nil, "c_deja_vu", "c_deja_vu")--this is op if you already have perkeo
		--	card:add_to_deck()
		--	--card:set_edition("e_negative")
		--	card:start_materialize()
		--	G.consumeables:emplace(card)
		--end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
	end,
	--mythic jokers must be unlocked
	--unlocked = false,
	--bypass_all_unlocked = true,
	--check_for_unlock = function(self, args)
	--	if G and G.jokers and G.jokers.cards then
	--		for i = 1, #G.jokers.cards do
	--			if G.jokers.cards[i].config.center.key == "j_obelisk" and G.jokers.cards[i].ability.eternal then
	--				unlock_card(self)
	--			end
	--		end
	--	end
		--lock_card(self)
		--if args.type == "cry_lock_all" then
		--	lock_card(self)
		--end
		--if args.type == "cry_unlock_all" then
		--	unlock_card(self)
		--end
	--end,
}

local retriggeringAscend = {
	object_type = "Joker",
	name = "Retriggering Ascension",
	key = "retriggeringAscend",
	config = {
		extra = {
			stat1 = 15,
			stat2 = 2,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_pogoB_hah_mythic",
		},
	},
	pos = { x = 0, y = 0 },
	rarity = 2,--"pogoB_hah_mythic",
	cost = 5,
	order = 6,
	blueprint_compat = true,
	atlas = "GodhoodCard_OLD",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_hatchlingCard
		--info_queue[#info_queue + 1] = G.P_CENTERS.m_pogoB_ascendedCard
	end,
	calculate = function(self, card, context)
		if
			context.repetition
			and context.cardarea == G.play
			and context.other_card
			and (SMODS.has_enhancement(context.other_card, "m_pogoB_ascendedCard") or SMODS.has_enhancement(context.other_card, "m_pogoB_GodHoodCard"))
			--and pseudorandom("cry_boredom_card")
			--	< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
		if
			--context.cardarea == G.play
			context.before
			and G.play
			and G.play.cards
			and #context.scoring_hand < 5
			--and context.other_card
			--and context.other_card.ability.effect == "Base"
			--and pseudorandom("cry_boredom_card")
			--	< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			for i = 1, #G.play.cards do
				if G.play.cards[i].ability.effect == "Base" then
					G.play.cards[i]:set_ability("m_pogoB_hatchlingCard")--m_pogoB_hatchlingCard
				end
			end
		end
		--if G.GAME.blind.boss and context.setting_blind then
		--	local card = create_card("Consumeable", G.consumeables, nil, nil, true, nil, "c_deja_vu", "c_deja_vu")--this is op if you already have perkeo
		--	card:add_to_deck()
		--	--card:set_edition("e_negative")
		--	card:start_materialize()
		--	G.consumeables:emplace(card)
		--end
	end,
}

-- Number Blocks
-- Earn $1 at end of round; Increase payout by $1 for each [rank] held in hand (changes every round)
local number_blocks = {
	object_type = "Joker",
	name = "cry-Number Blocks",
	key = "number_blocks",
	config = {
		extra = {
			money_mod = 1,
			money = 1,
		},
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 2 },
	rarity = "cry_epic",
	cost = 14,
	order = 12,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.money),
				number_format(center.ability.extra.money_mod),
				localize(Cryptid.safe_get(G.GAME, "current_round", "cry_nb_card", "rank") or "Ace", "ranks"),
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.individual
			and not context.end_of_round
			and context.cardarea == G.hand
			and not context.blueprint
			and not context.before
			and not context.after
			and context.other_card:get_id() == G.GAME.current_round.cry_nb_card.id
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				card.ability.extra.money =
					lenient_bignum(to_big(card.ability.extra.money) + card.ability.extra.money_mod)
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
				return nil, true
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if to_big(card.ability.extra.money) > to_big(0) then
			return lenient_bignum(card.ability.extra.money)
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- Double Scale
-- Scaling jokers scale quadratically
-- Most of the code for this lies in Card:cry_double_scale_calc in lib/calculate.lua
local double_scale = {
	object_type = "Joker",
	name = "cry-Double Scale",
	key = "Double Scale",
	pos = { x = 0, y = 3 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = {
			cost = 20,
			center = { rarity = 4 },
		},
		exp_modest = { cost = 11 },
	},
	extra_gamesets = { "exp_modest" },
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { exp_modest = "modest" }) }
	end,
	order = 6,
	rarity = "cry_epic",
	cost = 18,
	immutable = true,
	atlas = "atlasepic",
	cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
		if Cryptid.gameset(self) == "exp_modest" then
			return lenient_bignum(to_big(true_base) * 2)
		end
		return lenient_bignum(orig_scale_scale + to_big(true_base))
	end,
	cry_credits = {
		idea = {
			"Mystic Misclick",
		},
		art = {
			"AlezZGreat",
		},
		code = {
			"Math",
			"Mathguy",
		},
	},
}

-- Nostalgic Candy
-- Sell this card to permanently gain +3 hand size
local oldcandy = {
	object_type = "Joker",
	name = "cry_oldcandy",
	key = "oldcandy",
	pos = { x = 4, y = 1 },
	order = 43,
	config = {
		extra = { hand_size = 3 },
		immutable = { max_hand_size_mod = 1000 },
	},
	gameset_config = {
		modest = { extra = { hand_size = 1 } },
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pools = { ["Food"] = true },
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(
					math.min(
						center.ability.immutable.max_hand_size_mod,
						math.max(1, math.floor(center.ability.extra.hand_size))
					)
				),
			},
		}
	end,
	rarity = "cry_epic",
	cost = 9,
	eternal_compat = false,
	demicoloncompat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if (context.selling_self and not context.blueprint) or context.forcetrigger then
			G.hand:change_size(
				lenient_bignum(
					math.min(
						card.ability.immutable.max_hand_size_mod,
						math.max(1, math.floor(card.ability.extra.hand_size))
					)
				)
			)
			return nil, true
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.hand_size > card.ability.immutable.max_hand_size_mod then
			card.ability.extra.hand_size = card.ability.immutable.max_hand_size_mod
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Circus
-- Rare/Epic/Legendary/Exotic Jokers give X2/3/4/20 Mult
local circus = {
	object_type = "Joker",
	name = "cry-circus",
	key = "circus",
	pos = { x = 4, y = 4 },
	config = {
		extra = {
			rare_mult_mod = 2,
			epic_mult_mod = 3,
			legend_mult_mod = 4,
			exotic_mult_mod = 20,
		},
		immutable = {
			rarity_map = {
				[3] = "rare_mult_mod",
				[4] = "legend_mult_mod",
				["cry_epic"] = "epic_mult_mod",
				["cry_exotic"] = "exotic_mult_mod",
			},
		},
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	atlas = "atlasepic",
	order = 33,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.rare_mult_mod),
				number_format(center.ability.extra.epic_mult_mod),
				number_format(center.ability.extra.legend_mult_mod),
				number_format(center.ability.extra.exotic_mult_mod),
			},
		}
	end,
	rarity = "cry_epic",
	cost = 16,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		local function calculate_xmult(mult_mod)
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end

			local xmult = lenient_bignum(math.max(1, to_big(card.ability.extra.Xmult)) * to_big(mult_mod))
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(xmult) },
				}),
				Xmult_mod = xmult,
			}
		end

		if context.other_joker and card ~= context.other_joker then
			local mod_key = card.ability.immutable.rarity_map[context.other_joker.config.center.rarity]
			if mod_key then
				return calculate_xmult(card.ability.extra[mod_key])
			end
		end
		if context.forcetrigger then
			return {
				Xmult_mod = (
					card.ability.extra.rare_mult_mod
					* card.ability.extra.epic_mult_mod
					* card.ability.extra.legend_mult_mod
					* card.ability.extra.exotic_mult_mod
				),
			}
		end
	end,
	cry_credits = {
		idea = {
			"Ein13",
		},
		art = {
			"Ein13",
		},
		code = {
			"Jevonn",
			"BobJoe400",
		},
	},
}

-- Caramel
-- Each played card gives X1.75 Mult when scored for the next 11 rounds
local caramel = {
	object_type = "Joker",
	name = "cry-caramel",
	key = "caramel",
	config = {
		extra = {
			x_mult = 1.75,
			rounds_remaining = 11,
		},
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 1 },
	rarity = "cry_epic",
	cost = 12,
	order = 106,
	gameset_config = {
		modest = {
			extra = {
				x_mult = 1.5,
				rounds_remaining = 6,
			},
		},
	},
	pools = { ["Food"] = true },
	blueprint_compat = true,
	eternal_compat = false,
	demicoloncompat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.x_mult),
				number_format(center.ability.extra.rounds_remaining),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play then
				return {
					x_mult = lenient_bignum(card.ability.extra.x_mult),
					colour = G.C.RED,
					card = card,
				}
			end
		end
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds_remaining = lenient_bignum(to_big(card.ability.extra.rounds_remaining) - 1)
			if to_big(card.ability.extra.rounds_remaining) > to_big(0) then
				return {
					message = { localize("cry_minus_round") },
					colour = G.C.FILTER,
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER,
				}
			end
		end
		if context.forcetrigger then
			card.ability.extra.rounds_remaining = lenient_bignum(to_big(card.ability.extra.rounds_remaining) - 1)
			card.ability.extra.rounds_remaining = math.max(card.ability.extra.rounds_remaining, 0)
			return {
				Xmult_mod = lenient_bignum(card.ability.extra.x_mult),
				colour = G.C.RED,
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Sob
-- you cannot run... you cannot hide... you cannot escape...
-- Creates a Negative Absolute Eternal Obelisk when added
-- Creates Obelisks (if room) when doing just about anything

-- Still planning on making one more change to this later - Jevonn
local curse_sob = {
	object_type = "Joker",
	name = "cry_curse_sob",
	key = "curse_sob",
	pos = { x = 1, y = 1 },
	pools = { ["Meme"] = true },
	dependencies = {
		items = {
			"set_cry_epic",
			"set_cry_meme",
		},
	},
	gameset_config = {
		modest = {
			cost = 20,
			center = { rarity = 4 },
		},
	},
	rarity = "cry_epic",
	cost = 9,
	order = 82,
	immutable = true,
	perishable_compat = true,
	demicoloncompat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.selling_card
			and context.card.ability.name == "Obelisk"
			and not context.retrigger_joker
			and not context.blueprint
		then
			return {}
		elseif
			( -- Compacting all the elseifs into one block for space and readability also maintablity
					context.selling_self
					or context.discard
					or context.reroll_shop --Yes
					or context.buying_card
					or context.skip_blind
					or context.using_consumeable
					or context.selling_card
					or context.setting_blind
					or context.skipping_booster
					or context.open_booster
					or context.forcetrigger
				)
				and (#G.jokers.cards + G.GAME.joker_buffer < (context.selling_self and (G.jokers.config.card_limit + 1) or G.jokers.config.card_limit))
			or context.forcetrigger and not context.retrigger_joker and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:set_edition("e_negative", true, nil, true)
			card.ability.cry_absolute = true
			card:add_to_deck()
			G.jokers:emplace(card)
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.DARK_EDITION,
				}),
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_obelisk" and G.jokers.cards[i].ability.eternal then
					unlock_card(self)
				end
			end
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}

-- Bonus Joker
-- 1 in 8 chance for each played Bonus Card to increase Joker or Consumable slots by 1 when scored
-- Works twice per round
local bonusjoker = {
	object_type = "Joker",
	name = "cry-Bonus Joker",
	key = "bonusjoker",
	pos = { x = 3, y = 2 },
	config = {
		extra = {
			odds = 8,
			add = 1,
		},
		immutable = { check = 0 },
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = false,
	rarity = "cry_epic",
	cost = 11,
	order = 75,
	blueprint_compat = true,
	demicoloncompat = true,
	enhancement_gate = "m_bonus",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
				number_format(card.ability.extra.add),
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
				if
					pseudorandom("bonusjoker")
						< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
					and card.ability.immutable.check < 2
					and not context.retrigger_joker
				then
					local option = pseudorandom_element({ 1, 2 }, pseudoseed("bonusjoker"))
					if option == 1 then
						if not context.blueprint then
							card.ability.immutable.check = lenient_bignum(card.ability.immutable.check + 1)
						end
						G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + card.ability.extra.add)
					else
						if not context.blueprint then
							card.ability.immutable.check = lenient_bignum(card.ability.immutable.check + 1)
						end
						G.consumeables.config.card_limit =
							lenient_bignum(G.consumeables.config.card_limit + to_big(card.ability.extra.add))
					end
					return {
						extra = { focus = card, message = localize("k_upgrade_ex") },
						card = card,
						colour = G.C.MONEY,
					}
				end
			end
		end
		if
			context.end_of_round
			and card.ability.immutable.check ~= 0
			and not context.blueprint
			and not context.retrigger_joker
			and not context.individual
			and not context.repetition
		then
			card.ability.immutable.check = 0
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
		if context.forcetrigger then
			local option = pseudorandom_element({ 1, 2 }, pseudoseed("bonusjoker"))
			if option == 1 then
				if not context.blueprint then
					card.ability.immutable.check = lenient_bignum(card.ability.immutable.check + 1)
				end
				G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + card.ability.extra.add)
			else
				if not context.blueprint then
					card.ability.immutable.check = lenient_bignum(card.ability.immutable.check + 1)
				end
				G.consumeables.config.card_limit =
					lenient_bignum(G.consumeables.config.card_limit + to_big(card.ability.extra.add))
			end
			return {
				extra = { focus = card, message = localize("k_upgrade_ex") },
				card = card,
				colour = G.C.MONEY,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Mult Joker
-- 1 in 3 chance for each played Mult Card to create a Cryptid when scored (Must have room)
local multjoker = {
	object_type = "Joker",
	name = "cry-Mult Joker",
	key = "multjoker",
	pos = { x = 2, y = 3 },
	config = { extra = { odds = 3 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	rarity = "cry_epic",
	order = 99,
	cost = 11,
	blueprint_compat = true,
	demicoloncompat = true,
	enhancement_gate = "m_mult",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cryptid
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if
				SMODS.has_enhancement(context.other_card, "m_mult")
				and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
			then
				if
					pseudorandom("multjoker")
					< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
						/ card.ability.extra.odds
				then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_card =
								create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_cryptid", "multjoker")
							new_card:add_to_deck()
							G.consumeables:emplace(new_card)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("cry_plus_cryptid"), colour = G.C.SECONDARY_SET.Spectral }
					)
					return nil, true
				end
			end
		end
		if context.forcetrigger then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			G.E_MANAGER:add_event(Event({
				func = function()
					local new_card =
						create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_cryptid", "multjoker")
					new_card:add_to_deck()
					G.consumeables:emplace(new_card)
					G.GAME.consumeable_buffer = 0
					return true
				end,
			}))
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Gold Joker
-- Earn +2% at end of round when a Gold Card is scored
local goldjoker = {
	object_type = "Joker",
	name = "cry-gold Joker",
	key = "goldjoker",
	config = {
		extra = {
			percent_mod = 2,
			percent = 0,
		},
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 4 },
	rarity = "cry_epic",
	cost = 14,
	order = 81,
	enhancement_gate = "m_gold",
	perishable_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		return {
			vars = {
				number_format(center.ability.extra.percent),
				number_format(center.ability.extra.percent_mod),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if SMODS.has_enhancement(context.other_card, "m_gold") then
				card.ability.extra.percent =
					lenient_bignum(to_big(card.ability.extra.percent) + card.ability.extra.percent_mod)
				return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.MONEY,
				}
			end
		end
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_gold") then
				card.ability.extra.percent =
					lenient_bignum(to_big(card.ability.extra.percent) + card.ability.extra.percent_mod)
				return {
					message = localize("k_upgrade_ex"),
					card = card,
					colour = G.C.CHIPS,
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		local bonus =
			lenient_bignum(math.max(0, math.floor(0.01 * to_big(card.ability.extra.percent) * (G.GAME.dollars or 0))))
		if to_big(bonus) > to_big(0) then
			return bonus
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Nostalgic Googol Play Card
-- Sell this card to create 2 copies of the leftmost Joker
-- Still needs updated description
local altgoogol = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	pos = { x = 4, y = 3 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 10,
	order = 60,
	blueprint_compat = false,
	eternal_compat = false,
	demicoloncompat = true,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 5, y = 3 } },
	config = { copies = 2 },
	gameset_config = {
		modest = {
			cost = 15,
			copies = 1,
		},
		mainline = { copies = 2 },
		madness = {
			center = { blueprint_compat = true },
			copies = 2,
		},
	},
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { modest = "balanced" }), vars = { center.ability.copies } }
	end,
	calculate = function(self, card, context)
		local gameset = Card.get_gameset(card)
		if
			(context.selling_self and not context.retrigger_joker and (gameset == "madness" or not context.blueprint))
			or context.forcetrigger
		then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
				if not gameset == "modest" or #G.jokers.cards <= G.jokers.config.card_limit then
					if G.jokers.cards[1].ability.name ~= "cry-altgoogol" then
						G.E_MANAGER:add_event(Event({
							func = function()
								for i = 1, card.ability.copies do
									local chosen_joker = G.jokers.cards[1]
									local card = copy_card(
										chosen_joker,
										nil,
										nil,
										nil,
										(
											gameset == "modest"
												and (Cryptid.safe_get(chosen_joker, "edition", "negative"))
											or nil
										)
									)
									card:add_to_deck()
									G.jokers:emplace(card)
								end
								return true
							end,
						}))
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
							message = localize("k_duplicated_ex"),
							colour = G.C.RARITY.cry_epic,
						})
						return nil, true
					else
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
							message = localize("k_nope_ex"),
							colour = G.C.RARITY.cry_epic,
						})
						return nil, true
					end
				else
					card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
						message = localize("k_no_room_ex"),
						colour = G.C.RARITY.cry_epic,
					})
					return nil, true
				end
			else
				card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
					message = localize("k_no_other_jokers"),
					colour = G.C.RARITY.cry_epic,
				})
				return nil, true
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- One For All
-- +1 Joker slot, Booster Pack slot, hand size, consumable slot, shop slot
local soccer = {
	object_type = "Joker",
	name = "cry-soccer",
	key = "soccer",
	pos = { x = 1, y = 4 },
	config = { extra = { holygrail = 1 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = true, -- i swear i changed this... whatever
	rarity = "cry_epic",
	order = 58,
	cost = 20,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { modest = "balanced" }), vars = { center.ability.extra.holygrail } }
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		local mod = card.ability.extra.holygrail
		G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or mod)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + mod
		G.hand:change_size(mod)
		SMODS.change_booster_limit(mod)
		SMODS.change_voucher_limit(mod)
	end,
	remove_from_deck = function(self, card, from_debuff)
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		local mod = card.ability.extra.holygrail
		G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or -mod)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - mod
		G.hand:change_size(-mod)
		SMODS.change_booster_limit(-mod)
		SMODS.change_voucher_limit(-mod)
	end,
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Jevonn",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win" then
			for k, v in pairs(G.GAME.hands) do
				if k ~= "High Card" and G.GAME.hands[k].played ~= 0 then
					return
				end
			end
			return true
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}

-- Flesh Panopticon
-- X20 Boss Blind size; When Boss Blind defeated, self destructs and creates a Negative Gateway
local fleshpanopticon = {
	object_type = "Joker",
	name = "cry-fleshpanopticon",
	key = "fleshpanopticon",
	pos = { x = 0, y = 5 },
	config = { extra = { boss_size = 20 } },
	dependencies = {
		items = {
			"set_cry_epic",
			"c_cry_gateway",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 15,
	order = 146,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Spectral", key = "c_cry_gateway" }
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
		return { vars = { center.ability.extra.boss_size } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint and context.blind.boss and not card.getting_sliced then
			local eval = function(card)
				return not card.REMOVED and not G.RESET_JIGGLES
			end
			juice_card_until(card, eval, true)
			card.gone = false
			G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.boss_size
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.HUD_blind:recalculate()
			G.E_MANAGER:add_event(Event({
				func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound("timpani")
							delay(0.4)
							return true
						end,
					}))
					card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("cry_good_luck_ex") })
					return true
				end,
			}))
		end
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss
			and not card.gone
		then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local card = create_card(
						nil,
						G.consumeables,
						nil,
						nil,
						nil,
						nil,
						Cryptid.enabled("c_cry_gateway") and "c_cry_gateway" or "c_soul",
						"sup"
					)
					card:set_edition({ negative = true }, true)
					card:add_to_deck()
					G.consumeables:emplace(card)
					return true
				end,
			}))
			if not card.ability.eternal then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
			end
			card.gone = true
		end
	end,
	cry_credits = {
		idea = {
			"notmario",
		},
		art = {
			"notmario",
		},
		code = {
			"notmario",
		},
	},
}
-- Spectrogram
-- Retrigger rightmost Joker once for every Echo Card played and scored
local spectrogram = {
	object_type = "Joker",
	name = "cry-Spectrogram",
	key = "spectrogram",
	pos = { x = 1, y = 5 },
	config = {
		extra = {},
		immutable = { echonum = 0 },
	},
	rarity = "cry_epic",
	cost = 9,
	order = 133,
	atlas = "atlasepic",
	dependencies = {
		items = {
			"set_cry_epic",
			"m_cry_echo",
		},
	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cry_echo
		return { vars = {} }
	end,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers then
			card.ability.immutable.echonum = 0
			for i, v in pairs(context.scoring_hand) do
				if v.config.center_key == "m_cry_echo" and not v.debuff then
					card.ability.immutable.echonum = card.ability.immutable.echonum + 1
				end
			end
		end

		if
			context.retrigger_joker_check
			and not context.retrigger_joker
			and context.other_card == G.jokers.cards[#G.jokers.cards]
			and context.other_card ~= self
		then
			if card.ability.immutable.echonum and card.ability.immutable.echonum > 0 then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.immutable.echonum,
					card = card,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"AlexZGreat",
		},
		art = {
			"SMG9000",
		},
		code = {
			"AlexZGreat",
		},
	},
}
local jtron = {
	object_type = "Joker",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	name = "cry-jtron",
	key = "jtron",
	config = {
		extra = { bonus = 1 },
		immutable = { current = 0 },
	},
	rarity = "cry_epic",
	cost = 14,
	order = 64,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "atlasepic",
	pos = { x = 2, y = 5 },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
		center.ability.immutable.current =
			lenient_bignum(1 + to_big(center.ability.extra.bonus) * #SMODS.find_card("j_joker"))
		return {
			vars = {
				number_format(center.ability.extra.bonus),
				number_format(center.ability.immutable.current),
			},
		}
	end,
	calculate = function(self, card, context)
		card.ability.immutable.current =
			lenient_bignum(1 + to_big(card.ability.extra.bonus) * #SMODS.find_card("j_joker"))
		if context.cardarea == G.jokers and context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(card.ability.immutable.current),
					},
				}),
				Emult_mod = lenient_bignum(card.ability.immutable.current),
				colour = G.C.DARK_EDITION,
			}
		end
		if context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(1 + to_big(card.ability.extra.bonus)),
					},
				}),
				Emult_mod = lenient_bignum(1 + to_big(card.ability.extra.bonus)),
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	cry_credits = {
		idea = { "AlexZGreat" },
		art = { "Darren_The_Frog" },
		code = { "candycanearter" },
	},
}
-- Retriggers steels every 2nd hand, scaling xmult every 3rd hand, first card to steel every 5th hand, stronger steels every 7th hand
local clockwork = { -- Steel Support: The Joker
	object_type = "Joker",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	name = "cry-clockwork",
	key = "clockwork",
	pos = { x = 5, y = 5 },
	config = {
		extra = {
			xmult = 1,
			xmult_mod = 0.25,
			steelenhc = 1,
			steel_mod = 0.1,
		},
		immutable = {
			limits = {
				l1 = 2,
				l2 = 3,
				l3 = 5,
				l4 = 7,
			},
			counters = {
				c1 = 0,
				c2 = 0,
				c3 = 0,
				c4 = 0,
			},
		},
	},
	order = 135,
	immutable = false,
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	atlas = "atlasone",
	enhancement_gate = "m_steel", -- lucky joker uses this? hopefully it works
	loc_vars = function(self, info_queue, center)
		local function process_var(m, cap)
			if m >= cap - 1 then
				return localize("k_active_ex")
			end
			return cap - m - 1
		end
		return {
			vars = {
				process_var(center.ability.immutable.counters.c1, center.ability.immutable.limits.l1),
				process_var(center.ability.immutable.counters.c2, center.ability.immutable.limits.l2),
				process_var(center.ability.immutable.counters.c3, center.ability.immutable.limits.l3),
				process_var(center.ability.immutable.counters.c4, center.ability.immutable.limits.l4),
				number_format(center.ability.extra.xmult),
				number_format(center.ability.extra.xmult_mod),
				number_format(center.ability.extra.steelenhc),
				number_format(center.ability.extra.steel_mod),
				center.ability.immutable.limits.l1,
				center.ability.immutable.limits.l2,
				center.ability.immutable.limits.l3,
				center.ability.immutable.limits.l4,
			},
		}
	end,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint and not context.retrigger then
			local function clamp(c, l)
				local m = c + 1
				if c + 1 >= l then
					return 0
				end
				return m
			end

			card.ability.immutable.counters.c1 =
				clamp(card.ability.immutable.counters.c1, card.ability.immutable.limits.l1) -- ticker 1

			card.ability.immutable.counters.c2 =
				clamp(card.ability.immutable.counters.c2, card.ability.immutable.limits.l2) -- ticker 2
			if card.ability.immutable.counters.c2 == 0 then
				card.ability.extra.xmult =
					lenient_bignum(to_big(card.ability.extra.xmult) + card.ability.extra.xmult_mod)
			end

			card.ability.immutable.counters.c3 =
				clamp(card.ability.immutable.counters.c3, card.ability.immutable.limits.l3) -- ticker 3

			card.ability.immutable.counters.c4 =
				clamp(card.ability.immutable.counters.c4, card.ability.immutable.limits.l4) -- ticker 4
			if card.ability.immutable.counters.c4 == 0 then
				card.ability.extra.steelenhc =
					lenient_bignum(to_big(card.ability.extra.steelenhc) + card.ability.extra.steel_mod)
			end
		end
		if context.repetition and context.cardarea == G.hand and card.ability.immutable.counters.c1 == 0 then -- effect 1
			if SMODS.has_enhancement(context.other_card, "m_steel") then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			end
		end
		if
			context.joker_main and context.cardarea == G.jokers -- effect 2
		then
			return { xmult = card.ability.extra.xmult }
		end
		if
			context.before
			and context.cardarea == G.jokers
			and not context.blueprint_card
			and not context.retrigger_joker
			and card.ability.immutable.counters.c3 == 0
		then -- effect 3
			context.full_hand[1]:set_ability(G.P_CENTERS["m_steel"], nil, true)
		end
		if
			context.individual
			and context.cardarea == G.hand
			and not context.end_of_round
			and SMODS.has_enhancement(context.other_card, "m_steel")
			and to_big(card.ability.extra.steelenhc) ~= to_big(1)
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else -- effect 4
				return { xmult = lenient_bignum(card.ability.extra.steelenhc) }
			end
		end
		--imo this secret effect can be madness only -Math
		if
			context.after
			and context.cardarea == G.jokers
			and not context.blueprint_card
			and not context.retrigger_joker
		then -- The Clockwork Joker is canonically a non-binary self-replicating machine amoeba, that self replicates every 21 minutes. Their pronouns are any/all; they are several billion tiny jokers
			if -- in a trench coat, constantly ticking in an almost perfect yet flawed mechanism. Its only purpose is the strengthening and spreading of the steel world; everything else is meaningless to it.
				card.ability.immutable.counters.c1 == 0 -- lore by nova :3
				and card.ability.immutable.counters.c2 == 0
				and card.ability.immutable.counters.c3 == 0
				and card.ability.immutable.counters.c4 == 0
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						local m = copy_card(card)
						m:add_to_deck()
						G.jokers:emplace(m)
						return true
					end,
				}))
				return {
					message = localize("k_duplicated_ex"),
					card = card,
				}
			end
		end
	end,
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.immutable.counters.c1 =
			math.floor(pseudorandom("Clockwork1") * (card.ability.immutable.limits.l1 - 1) + 0.5)
		card.ability.immutable.counters.c2 =
			math.floor(pseudorandom("Clockwork2") * (card.ability.immutable.limits.l2 - 1) + 0.5)
		card.ability.immutable.counters.c3 =
			math.floor(pseudorandom("Clockwork3") * (card.ability.immutable.limits.l3 - 1) + 0.5)
		card.ability.immutable.counters.c4 =
			math.floor(pseudorandom("Clockwork4") * (card.ability.immutable.limits.l4 - 1) + 0.5)
	end,
	cry_credits = {
		idea = {
			"cassknows",
		},
		code = {
			"Nova",
			"Math",
		},
		art = {
			"unexian",
		},
	},
}
-- Force-triggers the rightmost joker during context.joker_main
local demicolon = {
	object_type = "Joker",
	gameset_config = {
		modest = { disabled = true },
		mainline = { disabled = true },
		madness = { disabled = false },
		experimental = { disabled = false },
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	name = "cry-demicolon",
	key = "demicolon",
	rarity = "cry_epic",
	cost = 14,
	order = 299,
	blueprint_compat = false,
	demicoloncompat = false,
	atlas = "atlasepic",
	pos = { x = 3, y = 5 },
	config = { check = nil },
	immutable = true,
	loc_vars = function(self, info_queue, card)
		card.ability.demicoloncompat_ui = card.ability.demicoloncompat_ui or ""
		card.ability.demicoloncompat_ui_check = nil
		local check = card.ability.check
		return {
			main_end = (card.area and card.area == G.jokers)
					and {
						{
							n = G.UIT.C,
							config = { align = "bm", minh = 0.4 },
							nodes = {
								{
									n = G.UIT.C,
									config = {
										ref_table = card,
										align = "m",
										-- colour = (check and G.C.cry_epic or G.C.JOKER_GREY),
										colour = card.ability.colour,
										r = 0.05,
										padding = 0.08,
										func = "blueprint_compat",
									},
									nodes = {
										{
											n = G.UIT.T,
											config = {
												ref_table = card.ability,
												ref_value = "demicoloncompat",
												colour = G.C.UI.TEXT_LIGHT,
												scale = 0.32 * 0.8,
											},
										},
									},
								},
							},
						},
					}
				or nil,
		}
	end,
	update = function(self, card, front)
		local other_joker = nil
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i + 1]
				end
			end
			local m = Cryptid.demicolonGetTriggerable(other_joker)
			if m[1] and not m[2] then
				card.ability.demicoloncompat = "Compatible"
				card.ability.check = true
				card.ability.colour = G.C.SECONDARY_SET.Enhanced
			elseif m[2] then
				card.ability.demicoloncompat = "Dangerous!"
				card.ability.check = true
				card.ability.colour = G.C.MULT
			else
				card.ability.demicoloncompat = "Incompatible"
				card.ability.check = false
				card.ability.colour = G.C.SUITS.Spades
			end
		end
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint and not context.forcetrigger then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if Cryptid.demicolonGetTriggerable(G.jokers.cards[i + 1])[1] then
						local results = Cryptid.forcetrigger(G.jokers.cards[i + 1], context)
						if results and results.jokers then
							results.jokers.message = localize("cry_demicolon")
							results.jokers.colour = G.C.RARITY.cry_epic
							results.jokers.sound = "cry_demitrigger"
							return results.jokers
						end
						return {
							message = localize("cry_demicolon"),
							colour = G.C.RARITY.cry_epic,
							sound = "cry_demitrigger",
						}
					end
				end
			end
		end
	end,
	cry_credits = {
		idea = { "HexaCryonic" },
		art = { "HexaCryonic" },
		code = { "Nova" },
	},
}
return {
	name = "Jokers",
	items = {
		supercell,
		googol_play,
		--sync_catalyst,
		--negative,
		canvas,
		arsonMyFavorite,
		brokenJimbo,
		acesion,
		boredom,
		blanker,
		anitmater,
		oldblueprint,
		crazyHand,
		legendANKH,
		--riffRaffButGood,--i dont like how much joker manipulation this causes
		--below are collectible jokers (shitty jokers)
		--regularJokerButShit,
		--theWorstChipAdditionCard,
		--parasite,
		--rareXChipsMoment_waitItSucks,
		--badJoker,
		--handSelectionIncrease_Butnofunction,
		--royalFlushMoney,
		--loanSharkTank,
		--ScalingChipJoker_collectible,
		--theWorstTradeOfAllTime,
		flatXMultScale,
		--Below are not
		negativePrinter,
		--universalHandType,--done in too many other mods
		theKingdom,
		--theSolo,
		--factoryNewBlueprint,
		doubleUpper,
		monolith,
		accelerant,
		--jimbo,
		--holyFuckCasualTetration,
		spacedJokes,
		consectHand,

		--3rd page
		blindBuster,
		--blindBuster2,--I dont like this one, it is useless past ante 2, also it doesnt work
		CROWBAR,
		UnneccisaryStrenght,
		timeMachine,
		gamblersJoker,
		theGrandFunnel,
		boosterReverseCardSharp,
		retriggeringAscend,
		stamper,
		blackJackSuperScale,
	},
}
