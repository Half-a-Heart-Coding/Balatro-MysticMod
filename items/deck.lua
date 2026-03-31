SMODS.Atlas({
	key = "balatro_sprites_unusedDecks",
	path = "balatro_sprites_unusedDecks.png",
	px = 71,--69, 71
	py = 93,--93, 95
})
SMODS.Atlas({
	key = "Balatro_UnusedDeck",
	path = "Balatro_UnusedDeck.png",
	px = 71,--69, 71
	py = 95,--93, 95
})
SMODS.Atlas({
	key = "heirLoomDeck",
	path = "heirLoomDeck.png",
	px = 71,--69, 71
	py = 95,--93, 95
})
SMODS.Atlas({
	key = "extra_decks",
	path = "extra_decks.png",
	px = 71,--69, 71
	py = 95,--93, 95
})


local very_fair = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "Very Fair Deck",
	key = "very_fair",
	config = { hands = -2, discards = -2 },
	pos = { x = 4, y = 0 },
	order = 1,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_no_vouchers = true
	end,
	init = function(self)
		very_fair_quip = {}
		local avts = SMODS.add_voucher_to_shop
		function SMODS.add_voucher_to_shop(...)
			if G.GAME.modifiers.cry_no_vouchers then
				return
			end
			return avts(...)
		end
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win_deck" then
			if get_deck_win_stake("b_cry_blank") > 0 then
				unlock_card(self)
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
local equilibrium = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Honed Deck",
	key = "honedDeck",
	order = 4,
	config = { vouchers = { "v_hone", "v_glow_up" } },
	pos = { x = 4, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		G.GAME.common_mod = 0.7
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local cheaterDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Cheater Deck",
	key = "cheaterDeck",
	order = 4,
	config = { vouchers = { "v_pogoB_mechanicCardVoucher", "v_pogoB_mechanicCardVoucherUpgrade" } },
	pos = { x = 4, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 0.7
		G.GAME.cheaterDeck_is_currentDeck = true
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local factoryDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Factory Deck",
	key = "factoryDeck",
	order = 6,
	--config = { jokers = { "j_pogoB_legend_ankh" } },
	pos = { x = 0, y = 0 },
	atlas = "Balatro_UnusedDeck",
	apply = function(self)
		giveFactory()
		--G.GAME.common_mod = 0.7
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
		add_tag(Tag("tag_voucher"))
	end,
	init = function(self)
		
		function giveFactory()
		G.E_MANAGER:add_event(Event({
					func = function()
				local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_pogoB_legend_ankh", "j_pogoB_legend_ankh")
				card_show:add_to_deck()
				card_show:start_materialize()
				card_show.rental = true
				card_show:set_rental(true)
				card_show.ability.rental = true
				--card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
										return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local heirloomDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "True Heirloom Deck",
	key = "heirloomDeck",
	order = 7,
	--config = { dollars = 0 },
	pos = { x = 0, y = 0 },
	atlas = "heirLoomDeck",
	apply = function(self)
		giveHeirloom()
		--G.GAME.common_mod = 0.7
		G.GAME.starting_params.dollars = 0
		G.GAME.modifiers.hah_heirLoomFinder = true
		G.GAME.modifiers.hah_heirLoomFinder2 = true
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	init = function(self)
		
		function giveHeirloom()
		G.E_MANAGER:add_event(Event({
					func = function()
					if G.ARGS and G.ARGS.save_settings and G.ARGS.save_settings.hah_lastSoldJokerOnHeirDeck ~= nil then
						local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, G.ARGS.save_settings.hah_lastSoldJokerOnHeirDeck, G.ARGS.save_settings.hah_lastSoldJokerOnHeirDeck)
				card_show:add_to_deck()
				card_show:start_materialize()
				card_show.eternal = true
				card_show:set_eternal(true)
				card_show.ability.eternal = true
				card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
				G.GAME.modifiers.hah_lastSoldJokerOnHeirDeck = nil
				G.ARGS.save_settings.hah_lastSoldJokerOnHeirDeck = nil
				else
				local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_joker", "j_joker")
				card_show:add_to_deck()
				card_show:start_materialize()
				card_show.eternal = true
				card_show:set_eternal(true)
				card_show.ability.eternal = true
				card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
				end
				if G.ARGS and G.ARGS.save_settings and G.ARGS.save_settings.hah_lastSoldConsumeOnHeirDeck ~= nil then
						local card_show2 = create_card("Consumable", G.consumeables, nil, nil, true, nil, G.ARGS.save_settings.hah_lastSoldConsumeOnHeirDeck, G.ARGS.save_settings.hah_lastSoldConsumeOnHeirDeck)
				card_show2:add_to_deck()
				card_show2:start_materialize()
				--card_show.eternal = true
				--card_show:set_eternal(true)
				--card_show.ability.eternal = true
				--card_show:set_edition("e_negative")
				G.consumeables:emplace(card_show2)
				G.GAME.modifiers.hah_lastSoldConsumeOnHeirDeck = nil
				G.ARGS.save_settings.hah_lastSoldConsumeOnHeirDeck = nil
				else
				local card_show2 = create_card("Consumable", G.consumeables, nil, nil, true, nil, "c_judgement", "c_judgement")
				card_show2:add_to_deck()
				card_show2:start_materialize()
				--card_show.eternal = true
				--card_show:set_eternal(true)
				--card_show.ability.eternal = true
				--card_show:set_edition("e_negative")
				G.consumeables:emplace(card_show2)
				end
										return true
					end,
				}))
		end
		function giveBoneMan()
		G.E_MANAGER:add_event(Event({
					func = function()

				local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_mr_bones", "j_mr_bones")
				card_show:add_to_deck()
				card_show:start_materialize()
				card_show.perishable = true
				card_show:set_perishable(true)
				card_show.ability.perishable = true
				--card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
										return true
					end,
				}))
		end
		function giveChoasClown()
		G.E_MANAGER:add_event(Event({
					func = function()

				local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_chaos", "j_chaos")
				card_show:add_to_deck()
				card_show:start_materialize()
				--card_show.perishable = true
				--card_show:set_perishable(true)
				--card_show.ability.perishable = true
				--card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
				card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_flash", "j_flash")
				card_show:add_to_deck()
				card_show:start_materialize()
				--card_show.perishable = true
				--card_show:set_perishable(true)
				--card_show.ability.perishable = true
				--card_show:set_edition("e_negative")
				G.jokers:emplace(card_show)
										return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local sell_card_stuff = Card.sell_card
function Card:sell_card()
	if self.config.center.set == "Joker" then
		--if G.GAME.modifiers.hah_heirLoomFinder == true and G.GAME.modifiers.hah_lastSoldJokerOnHeirDeck == nil then --self.config.center.key ~= "j_cry_necromancer" then
			
		if G.GAME.modifiers.hah_heirLoomFinder == true and G.GAME.modifiers.hah_lastSoldJokerOnHeirDeck == nil then
			G.GAME.modifiers.hah_lastSoldJokerOnHeirDeck = self.config.center.key
			G.ARGS.save_settings.hah_lastSoldJokerOnHeirDeck = self.config.center.key
		end
		-- Add Jolly Joker to the pool if card was treated as Jolly Joker
	end
	if self.config.center.set == "Consumable" then
		--if G.GAME.modifiers.hah_heirLoomFinder == true and G.GAME.modifiers.hah_lastSoldJokerOnHeirDeck == nil then --self.config.center.key ~= "j_cry_necromancer" then
			
		if G.GAME.modifiers.hah_heirLoomFinder2 == true then--and G.GAME.modifiers.hah_lastSoldConsumeOnHeirDeck == nil
			G.GAME.modifiers.hah_lastSoldConsumeOnHeirDeck = self.config.center.key
			G.ARGS.save_settings.hah_lastSoldConsumeOnHeirDeck = self.config.center.key
		end
		-- Add Jolly Joker to the pool if card was treated as Jolly Joker
	end
	--G.P_CENTERS.j_jolly
	sell_card_stuff(self)
end
local foilDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Foil Deck",
	key = "foilDeck",
	order = 3,
	config = { discards = -1 },
	pos = { x = 3, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		G.GAME.common_mod = 1.5
		foilDeckApply()
	end,
	init = function(self)
		
		function foilDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								v:set_edition("e_foil")
								--v:set_ability("m_pogoB_GodHoodCard")
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function celesteDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								v:set_ability("m_pogoB_celestialCard")
								--if math.random() > 0.5 then
								--	set_stamp(v, "nebula_stamp")
								--else
								--	set_stamp(v, "golden_stamp")
								--end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function massiveDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								
								v.ability.cheesestickwafflesssssssss = true
								--v:set_ability("m_bonus")
						end
						for k, v in pairs(G.playing_cards) do
							if v.ability.cheesestickwafflesssssssss then
								local new_card = create_playing_card(nil, G.deck)
								new_card:add_to_deck()
								SMODS.change_base(new_card, nil, v.base.value)
								new_card:change_suit(v.base.suit)
								new_card:add_to_deck()
								--new_card:set_ability("m_mult")
								--if math.random() > 0.5 then
								--	set_stamp(v, "nebula_stamp")
								--else
								--	set_stamp(v, "golden_stamp")
								--end
							end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						--local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_pogoB_accelerant", "j_pogoB_accelerant")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						return true--DO NOT COMMENT OUT (this has happened)
					end,
				}))
		end

		function stampedDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								--v:set_ability("m_pogoB_celestialCard")
								local randChosen = math.random()
								if randChosen > 0.8 then
									set_stamp(v, "nebula_stamp")
								elseif randChosen > 0.6 then
									set_stamp(v, "aggressive_stamp")
								elseif randChosen > 0.4 then
									set_stamp(v, "immunity_stamp")
								elseif randChosen > 0.2 then
									set_stamp(v, "powered_stamp")
								else
									set_stamp(v, "golden_stamp")
								end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function ascendedDeckApply4()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								if v.ability.effect == "Base" then
									v:set_ability("m_pogoB_hatchlingCard")
								end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						--local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_pogoB_doubleUpper", "j_pogoB_doubleUpper")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						--card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_constellation", "j_constellation")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local shopersDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Shop Deck",
	key = "shopersDeck",
	order = 22,
	config = { vouchers = { "v_clearance_sale", "v_reroll_surplus" } },--, "v_overstock_norm"
	pos = { x = 2, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 1.5

		--G.GAME.round_resets.ante = 0
		--G.GAME.round_resets.blind_ante = 0

		--local _hand = "High Card"
		--update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		--	handname = "All Hands",
		--	chips = 0,
		--	mult = 0,
		--	level = 0,
		--})
		----local removed_levels = 0
		--for k, v in ipairs(G.handlist) do
		--	level_up_hand(card, v, true, -1)
		--end
		--update_hand_text(
		--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		--	{ mult = 0, chips = 0, handname = "", level = "" }
		--)

		--G.cry_runarea = CardArea(
		--	G.discard.T.x,
		--	G.discard.T.y,
		--	G.discard.T.w,
		--	G.discard.T.h,
		--	{ type = "discard", card_limit = 1e100 }
		--)
		--local hand_count = #G.hand.cards
		--for i = 1, hand_count do
		--	draw_card(G.hand, G.cry_runarea, i * 100 / hand_count, "down", nil, nil, 0.07)
		--end
		--abstractThisDeck()
		--G.GAME.shopperDeck = true
		--G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
		--calculate_reroll_cost(true)
		--giveBoneMan()
		--SMODS.change_voucher_limit(-1)--dont, this crashes game when vouchers are redeemed
		G.GAME.modifiers.discard_cost = 1
		G.GAME.modifiers.cry_no_vouchers = true
	end,
	init = function(self)
		very_fair_quip = {}
		local avts = SMODS.add_voucher_to_shop
		function SMODS.add_voucher_to_shop(...)
			if G.GAME.modifiers.cry_no_vouchers then
				return
			end
			return avts(...)
		end
	end,
	--calculate = function(self, card, context)
	--	if context.reroll_shop and not G.GAME.shopperDeck then
	--		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
	--		calculate_reroll_cost(true)
	--		G.GAME.shopperDeck = true
	--		G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + 2
	--	elseif context.reroll_shop and G.GAME.shopperDeck then
	--		G.GAME.shopperDeck = false
	--	end
	--end,
	calculate = function(self, card, context)
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			add_tag(Tag("tag_voucher"))
		end
	end,
	unlocked = true,
}
local rerollInsaneDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Reroll Deck",
	key = "rerollInsaneDeck",
	order = 23,
	--config = { dollars = 1000 },
	pos = { x = 2, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		giveChoasClown()
		--G.GAME.common_mod = 1.5

		--G.GAME.round_resets.ante = 0
		--G.GAME.round_resets.blind_ante = 0

		--G.cry_runarea = CardArea(
		--	G.discard.T.x,
		--	G.discard.T.y,
		--	G.discard.T.w,
		--	G.discard.T.h,
		--	{ type = "discard", card_limit = 1e100 }
		--)
		--local hand_count = #G.hand.cards
		--for i = 1, hand_count do
		--	draw_card(G.hand, G.cry_runarea, i * 100 / hand_count, "down", nil, nil, 0.07)
		--end
		--abstractThisDeck()
		--G.GAME.shopperDeck = true
		--G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
		--calculate_reroll_cost(true)
		--giveBoneMan()
		--SMODS.change_voucher_limit(1)
	end,
	calculate = function(self, card, context)
		if G.STATE == G.STATES.SHOP and G.GAME.rememberedRerollCost and G.GAME.current_round.reroll_cost_increase and G.GAME.current_round.reroll_cost_increase < G.GAME.rememberedRerollCost and not G.GAME.shop_d6ed then
			G.GAME.current_round.reroll_cost_increase = G.GAME.rememberedRerollCost
			G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost + G.GAME.current_round.reroll_cost_increase
		end
		if context.reroll_shop and not G.GAME.shopperDeck then
			G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
			calculate_reroll_cost(true)
			G.GAME.shopperDeck = true
			--G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + 2
			G.GAME.rememberedRerollCost = G.GAME.current_round.reroll_cost_increase
		elseif context.reroll_shop and G.GAME.shopperDeck then
			G.GAME.shopperDeck = false
		end
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			G.GAME.rememberedRerollCost = 0
			G.GAME.current_round.reroll_cost_increase = 0
		end
	end,
	--calculate = function(self, card, context)
	--	if context.end_of_round
	--		and not context.individual
	--		and not context.repetition
	--		and not context.blueprint then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
	--		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
	--	end
	--end,
	unlocked = true,
}
local juggleDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Juggle Deck",
	key = "juggleDeck",
	order = 10,
	config = { no_low_ranks = true },
	pos = { x = 3, y = 3 },
	atlas = "extra_decks",
	apply = function(self)
		G.GAME.round_resets.ante = 2
		G.GAME.round_resets.blind_ante = 2
		removeTheTwosDeckApply()
		--G.GAME.starting_params.no_low_ranks = true
	end,
	init = function(self)
		
		function removeTheTwosDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
			for k, v in pairs(G.playing_cards) do
				if v.base.value == "Two" or v.base.value == "2" or v.base.value == 2 then--v.base.suit == "Spades" then --
				--v:set_ability("m_pogoB_blankCardEnhance")
					v:start_dissolve()
				--v.config.center_key = "m_pogoB_blankCardEnhance"
				end
				if v.base.value == "Three" or v.base.value == "3" or v.base.value == 3 then--v.base.suit == "Spades" then --
				--v:set_ability("m_pogoB_blankCardEnhance")
					v:start_dissolve()
				--v.config.center_key = "m_pogoB_blankCardEnhance"
				end
				if v.base.value == "Four" or v.base.value == "4" or v.base.value == 4 then--v.base.suit == "Spades" then --
				--v:set_ability("m_pogoB_blankCardEnhance")
					v:start_dissolve()
				--v.config.center_key = "m_pogoB_blankCardEnhance"
				end
				--if v.base.value == "Five" or v.base.value == "5" or v.base.value == 5 then--v.base.suit == "Spades" then --
				--v:set_ability("m_pogoB_blankCardEnhance")
				--	v:start_dissolve()
				--v.config.center_key = "m_pogoB_blankCardEnhance"
				--end
			end
			G.GAME.starting_deck_size = 40
			return true
			end,
		}))
		end
		
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local ascendedDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Ascended Deck",
	key = "ascendedDeck",
	order = 19,
	config = { should_be_red_seal = true },
	pos = { x = 5, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 1.5
		G.GAME.modifiers.should_be_red_seal = true
		ascendedDeckApply()
	end,
	calculate = function(self, card, context)
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			v = pseudorandom_element(G.playing_cards, pseudoseed("ashdgasydgashbhfifjahdhbas"))
			iii = 0
			--for k, v in pairs(G.playing_cards) do
				--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
				while (v.config.center == "m_pogoB_ascendedCard") and iii < 5200 do
					v = pseudorandom_element(G.playing_cards, pseudoseed("sasdhjashdhfyfbfhasuuasdbfyas"))
					iii = iii + 1
				end
				--v:set_edition("e_polychrome")
				v:set_ability("m_pogoB_ascendedCard")
				--v.ability.should_be_red_seal = true
		end
	end,
	init = function(self)
		
		function ascendedDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						v = pseudorandom_element(G.playing_cards, pseudoseed("cgegevasjdas"))
						--for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_polychrome")
								v:set_ability("m_pogoB_ascendedCard")
								--v.ability.should_be_red_seal = true
								--v.center:set_sprite_pos({ x = 6, y = 0 })
								--v.ability.extra = "red"
								--v.seal = 1
								--v.seal.red = true
								--v.seal = "red"
								--v.seal = "red"
								--play_sound("gold_seal", 1.2, 0.4)
								--v:set_seal("red_seal", true, false)
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						--end
						--for k, w in pairs(G.playing_cards) do
							--if w ~= v then
								--w:set_ability("m_pogoB_hatchlingCard")
								--w:set_ability("m_pogoB_ascendedCard")
							--end
						--end
						--local card_show = create_card("Spectral", G.consumeables, nil, nil, true, nil, "c_deja_vu", "c_deja_vu")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						--card_show = create_card("Tarot", G.consumeables, nil, nil, true, nil, "c_death", "c_death")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local godhoodDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "GodHood Deck",
	key = "godhoodDeck",
	order = 34,
	--config = { dollars = 1000 },
	pos = { x = 0, y = 0 },
	atlas = "GodhoodCard_Pre",
	apply = function(self)
		--G.GAME.common_mod = 1.5
		--G.GAME.modifiers.should_be_red_seal = true
		G.GAME.discount_percent = -99 --100 is weird
		SMODS.change_booster_limit(-1)
		G.GAME.bankrupt_at = 25
		G.GAME.GodHoodDeck = true
		--G.GAME.base_reroll_cost = 10
		ascendedDeckApply2()
	end,
	init = function(self)
		
		function ascendedDeckApply2()
		G.E_MANAGER:add_event(Event({
					func = function()
					change_shop_size(-1)
						v = pseudorandom_element(G.playing_cards, pseudoseed("cgegevasjdas"))
						--for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_polychrome")
								v:set_ability("m_pogoB_GodHoodCard")
								set_stamp(v, "immunity_stamp")
								--v.ability.should_be_red_seal = true
								--v.center:set_sprite_pos({ x = 6, y = 0 })
								--v.ability.extra = "red"
								--v.seal = 1
								--v.seal.red = true
								--v.seal = "red"
								--v.seal = "red"
								--play_sound("gold_seal", 1.2, 0.4)
								--v:set_seal("red_seal", true, false)
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						--end
						--for k, w in pairs(G.playing_cards) do
							--if w ~= v then
								--w:set_ability("m_pogoB_hatchlingCard")
								--w:set_ability("m_pogoB_ascendedCard")
							--end
						--end
						if 1==2 then
							if pseudorandom("riffleRaffleDuplication") > 0.95 and 1==2 then
								local card_show2 = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic2", true, nil, nil, "j_pogoB_anitmater")--5% chance to give antimatter, even though its not actually a mythic
								card_show2:add_to_deck()
								card_show2:start_materialize()
								--card_show2.eternal = true
								--card_show2.ability.perishimient = true
								--card_show2:set_eternal(true)
								--card_show2.ability.eternal = true
								card_show2:set_edition("e_negative")
								G.jokers:emplace(card_show2)
							else
								local card_show2 = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic", true, nil, nil, "j_pogoB_riffRaffButGood")--"pogoB_hah_mythic"
								card_show2:add_to_deck()
								card_show2:start_materialize()
								--card_show2.eternal = true
								--card_show2.ability.perishimient = true
								--card_show2:set_eternal(true)
								--card_show2.ability.eternal = true
								card_show2:set_edition("e_base")
								G.jokers:emplace(card_show2)
							end
						end
						--local card_show = create_card("Joker", G.jokers, nil, "pogoB_hah_mythic", true, nil, "j_joker")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.jokers:emplace(card_show)
						card_show = create_card("Spectral", G.consumeables, nil, nil, true, nil, "c_pogoB_devilDeal", "c_pogoB_devilDeal")
						card_show:add_to_deck()
						card_show:start_materialize()
						G.consumeables:emplace(card_show)
						--card_show = create_card("Spectral", G.consumeables, nil, nil, true, nil, "c_pogoB_superAcension", "c_pogoB_superAcension")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						--card_show = create_card("Tarot", G.consumeables, nil, nil, true, nil, "c_death", "c_death")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						return true
					end,
				}))
		end
		function ascendedDeckApply3()
		G.E_MANAGER:add_event(Event({
					func = function()
					--change_shop_size(-1)
						v = pseudorandom_element(G.playing_cards, pseudoseed("cgegevasjdas"))
						--for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_polychrome")
								v:set_ability("m_pogoB_GodHoodCard")
								--set_stamp(v, "immunity_stamp")
								--v.ability.should_be_red_seal = true
								--v.center:set_sprite_pos({ x = 6, y = 0 })
								--v.ability.extra = "red"
								--v.seal = 1
								--v.seal.red = true
								--v.seal = "red"
								--v.seal = "red"
								--play_sound("gold_seal", 1.2, 0.4)
								--v:set_seal("red_seal", true, false)
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						--end
						--for k, w in pairs(G.playing_cards) do
							--if w ~= v then
								--w:set_ability("m_pogoB_hatchlingCard")
								--w:set_ability("m_pogoB_ascendedCard")
							--end
						--end
						--local card_show = create_card("Spectral", G.consumeables, nil, nil, true, nil, "c_pogoB_superAcension", "c_pogoB_superAcension")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						--card_show = create_card("Spectral", G.consumeables, nil, nil, true, nil, "c_pogoB_superAcension", "c_pogoB_superAcension")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						--card_show = create_card("Tarot", G.consumeables, nil, nil, true, nil, "c_death", "c_death")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--G.consumeables:emplace(card_show)
						return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	calculate = function(self, card, context)
		if #SMODS.find_card("j_credit_card") <= 0 then
			if G.GAME.dollars < G.GAME.interest_cap then
				G.GAME.bankrupt_at = G.GAME.interest_cap
			else
				G.GAME.bankrupt_at = 0--allow purchases but only 1 when at/above interest_cap but only barely
			end
		elseif pogoB_config.vanilla_rework then
			G.GAME.bankrupt_at = -10
		else
			G.GAME.bankrupt_at = -20
		end
		if #SMODS.find_card("v_clearance_sale") <= 0 then
			G.GAME.discount_percent = -99
		elseif #SMODS.find_card("v_liquidation") <= 0 then
			G.GAME.discount_percent = -40
		else
			G.GAME.discount_percent = 10
		end
	end,
	unlocked = true,
}
local voidDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Void Deck",
	key = "voidDeck",
	order = 23,
	--config = { discards = -1 },
	pos = { x = 3, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		--G.GAME.common_mod = 1.5
		--voidDeck()
		--init = function(self)
		--local _hand = "High Card"
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = "All Hands",
			chips = 0,
			mult = 0,
			level = 0,
		})
		----local removed_levels = 0
		for k, v in ipairs(G.handlist) do
			level_up_hand(card, v, true, -1)
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
		for i = 1, 9 do
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
			local neutronhand = get_random_hand3(_hand, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
			if neutronhand and G.GAME.hands[neutronhand].visible then
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0 }, {
					handname = localize(neutronhand, "poker_hands"),
					chips = G.GAME.hands[neutronhand].chips,
					mult = G.GAME.hands[neutronhand].mult,
					level = G.GAME.hands[neutronhand].level,
				})
				--gone
				G.GAME.hands[neutronhand].visible = false
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
				--5 empty cards doesnt have a planet card
				--G.GAME.hands[neutronhand].played = 0
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = "", level = "" }
				)
			end
		end
	end,
	unlocked = true,
}
local mysticDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "This Deck",
	key = "mysticDeck",
	order = 21,
	config = { vouchers = { "v_planet_merchant", "v_planet_tycoon" } },
	pos = { x = 1, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		--G.GAME.common_mod = 0
		--G.GAME.starting_params.dollars = 10000
		--G.GAME.win_ante = 2
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 999999
		--G.GAME.modifiers.booster_ante_scaling = true
		--G.GAME.uncommon_mod = 5
		--G.GAME.rare_mod = 2
		--foilDeckApply()
		celesteDeckApply()
	end,
	calculate = function(self, card, context)
		--if G.play and G.play.cards and context.before then--context.main_scoring and--and G.GAME.current_round.hands_left == 0
		--	local eval = context.scoring_name
		--	update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		--		handname = localize(eval, "poker_hands"),
		--		chips = G.GAME.hands[eval].chips,
		--		mult = G.GAME.hands[eval].mult,
		--		level = G.GAME.hands[eval].level,
		--	})
		--	level_up_hand(self, eval, true, G.GAME.hands[eval].level)
		--	update_hand_text(
		--		{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		--		{ mult = 0, chips = 0, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
		--	)
		--end
		if G.play and G.play.cards and context.after then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1--and G.GAME.current_round.hands_left == 0
			local eval = context.scoring_name
			--update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			--	handname = localize(eval, "poker_hands"),
			--	chips = G.GAME.hands[eval].chips,
			--	mult = G.GAME.hands[eval].mult,
			--	level = G.GAME.hands[eval].level,
			--})
			if not G.GAME.handsPlayedCelesteDeck then
				G.GAME.handsPlayedCelesteDeck = { "Empty" }
				G.GAME.handsPlayedCelesteDeck[1] = eval
			else
				G.GAME.handsPlayedCelesteDeck[#G.GAME.handsPlayedCelesteDeck + 1] = eval
			end
			--level_up_hand(self, eval, true, (G.GAME.hands[eval].level - 1) * -1)--reset poker hand level
			--update_hand_text(
			--	{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			--	{ mult = 0, chips = 0, handname = localize(eval, "poker_hands"), level = G.GAME.hands[eval].level }
			--)
		end
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint 
			and G.GAME.handsPlayedCelesteDeck then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			for i = 1, #G.GAME.handsPlayedCelesteDeck do
				local eval = G.GAME.handsPlayedCelesteDeck[i]
				if G.GAME.hands[eval].level > G.GAME.round_resets.ante then--downside cannot be upside
					level_up_hand(self, eval, true, (G.GAME.hands[eval].level - G.GAME.round_resets.ante) * -1)--reset poker hand level
				end
				G.GAME.handsPlayedCelesteDeck[i] = nil
			end
			G.GAME.handsPlayedCelesteDeck = nil
		end
	end,
	
	unlocked = true,
}
local massiveDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Idk how you will get use out of this, but op at same time",
	key = "massiveDeck",
	order = 30,
	config = { vouchers = { "v_magic_trick", "v_illusion" } },
	pos = { x = 0, y = 3 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 0
		G.GAME.starting_deck_size = 104
		--G.GAME.starting_params.dollars = 10000
		--G.GAME.win_ante = 2
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 999999
		--G.GAME.modifiers.booster_ante_scaling = true
		--G.GAME.uncommon_mod = 5
		--G.GAME.rare_mod = 2
		--foilDeckApply()
		massiveDeckApply()
		G.GAME.massiveDeck_make_standard_packs_free = true
		G.GAME.starting_deck_size = 104
	end,
	calculate = function(self, card, context)
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint 
			and G.GAME.blind.boss then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			add_tag(Tag("tag_standard"))
		end
	end,
	
	unlocked = true,
}
local midnightDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Antimatter Deck Super Balanced",
	key = "midnightDeck",
	order = 31,
	config = { joker_slot = -3, hands = -2, vouchers = { "v_blank" } },
	pos = { x = 3, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--midnightDeckApply()
	end,
	calculate = function(self, card, context)
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint 
			and G.GAME.blind.boss then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			for k, v in pairs(G.jokers.cards) do
				local edition = { negative = true }
				v:set_edition(edition, true)
				--check_for_unlock({ type = "have_edition" })
			end
		end
	end,
	init = function(self)
		
		function foilDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								v:set_edition("e_foil")
								--v:set_ability("m_pogoB_GodHoodCard")
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function celesteDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								v:set_ability("m_pogoB_celestialCard")
								--if math.random() > 0.5 then
								--	set_stamp(v, "nebula_stamp")
								--else
								--	set_stamp(v, "golden_stamp")
								--end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function massiveDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								
								v.ability.cheesestickwafflesssssssss = true
								--v:set_ability("m_bonus")
						end
						for k, v in pairs(G.playing_cards) do
							if v.ability.cheesestickwafflesssssssss then
								local new_card = create_playing_card(nil, G.deck)
								new_card:add_to_deck()
								SMODS.change_base(new_card, nil, v.base.value)
								new_card:change_suit(v.base.suit)
								new_card:add_to_deck()
								--new_card:set_ability("m_mult")
								--if math.random() > 0.5 then
								--	set_stamp(v, "nebula_stamp")
								--else
								--	set_stamp(v, "golden_stamp")
								--end
							end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						--local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_pogoB_accelerant", "j_pogoB_accelerant")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						return true--DO NOT COMMENT OUT (this has happened)
					end,
				}))
		end

		function stampedDeckApply()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								--v:set_ability("m_pogoB_celestialCard")
								local randChosen = math.random()
								if randChosen > 0.8 then
									set_stamp(v, "nebula_stamp")
								elseif randChosen > 0.6 then
									set_stamp(v, "aggressive_stamp")
								elseif randChosen > 0.4 then
									set_stamp(v, "immunity_stamp")
								elseif randChosen > 0.2 then
									set_stamp(v, "powered_stamp")
								else
									set_stamp(v, "golden_stamp")
								end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end

		function ascendedDeckApply4()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							--if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								--v:set_edition("e_foil")
								if v.ability.effect == "Base" then
									v:set_ability("m_pogoB_hatchlingCard")
								end
							--end
							--if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						--local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_pogoB_doubleUpper", "j_pogoB_doubleUpper")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						--card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_constellation", "j_constellation")
						--card_show:add_to_deck()
						--card_show:start_materialize()
						--card_show.eternal = true
						--card_show:set_eternal(true)
						--card_show.ability.eternal = true
						--card_show:set_edition("e_negative")
						--G.jokers:emplace(card_show)
						return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	
	unlocked = true,
}
local stampedDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "agshdgasdhashfbahfdshgf Deck",
	key = "stampedDeck",
	order = 24,
	--config = { vouchers = { "v_planet_merchant", "v_planet_tycoon" } },
	pos = { x = 1, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 0
		--G.GAME.starting_params.dollars = 10000
		--G.GAME.win_ante = 2
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 999999
		--G.GAME.modifiers.booster_ante_scaling = true
		--G.GAME.uncommon_mod = 5
		G.GAME.forcedStampProtocol = true
		--foilDeckApply()
		stampedDeckApply()
		use_consumable_animation(card, nil, function()
      --if #G.jokers.cards < G.jokers.config.card_limit then
        G.SETTINGS.paused = true

        local selectable_jokers = {}

        --for _, v in ipairs(G.P_CENTER_POOLS.Joker) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
        --  if v.discovered and not next(SMODS.find_card(v.key))
        --      and v.rarity == 1 then
        --    selectable_jokers[#selectable_jokers + 1] = v
        --  end
        --end

		for _, v in ipairs(G.P_CENTER_POOLS.Spectral) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
          if v.discovered and not next(SMODS.find_card(v.key))
              and not v.hidden and v.stamp_converter then
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
            { 5 },
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
	--calculate = function(self, card, context)
	--	
	--end,
	
	unlocked = true,
}
local SilverDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Heirloom Deck",
	key = "SilverDeck",
	order = 5,
	config = { hand_size = -1 },
	pos = { x = 2, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		--G.GAME.common_mod = 0
		--G.GAME.win_ante = 3
		--G.GAME.uncommon_mod = 5
		--G.GAME.rare_mod = 2
		--foilDeckApply()
		anitmatterDeckBalancedVeryMuch()
	end,
	init = function(self)
		
		function anitmatterDeckBalancedVeryMuch()
		G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							if v.base.value == "Ace" or v.base.value == "A" or v.base.value == 14 then
								v:set_edition("e_negative")
							end
							if v.base.value == "2" or v.base.value == 2 or v.base.value == "Two" then
								v:set_edition("e_negative")
							end
							--if v.base.value == "3" or v.base.value == 3 or v.base.value == "Three" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.value == "8" or v.base.value == 8 or v.base.value == "Eight" then
							--	v:set_edition("e_foil")
							--end
							--if v.base.rank == "2" then
							--	v:change_suit("Hearts")
							--end
						end
						return true
					end,
				}))
		end
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	unlocked = true,
}
local PurpleDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Purple Deck",
	key = "PurpleDeck",
	order = 20,
	--config = { vouchers = { "v_grabber", "v_wasteful" } },
	config = { discards = 1, hands = 1 },
	pos = { x = 0, y = 2 },
	atlas = "extra_decks",
	apply = function(self)
		--G.GAME.common_mod = 0
		--G.GAME.win_ante = 3
		--G.GAME.uncommon_mod = 5
		--G.GAME.rare_mod = 2
		--G.GAME.bankrupt_at = 25
		--foilDeckApply()
		--anitmatterDeckBalancedVeryMuch()
	end,
	calculate = function(self, card, context)
		if G.STATE == G.STATES.SHOP and G.GAME.rememberedRerollCost and G.GAME.current_round.reroll_cost_increase and G.GAME.current_round.reroll_cost_increase < G.GAME.rememberedRerollCost and not G.GAME.shop_d6ed then
			G.GAME.current_round.reroll_cost_increase = G.GAME.rememberedRerollCost
			G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost + G.GAME.current_round.reroll_cost_increase
		end
		if context.reroll_shop and not G.GAME.shopperDeck then
			G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
			calculate_reroll_cost(true)
			G.GAME.shopperDeck = true
			--G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + 2
			G.GAME.rememberedRerollCost = G.GAME.current_round.reroll_cost_increase
		elseif context.reroll_shop and G.GAME.shopperDeck then
			G.GAME.shopperDeck = false
		end
		if context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss then--context.main_scoring and --and G.GAME.current_round.hands_left <= 1
			G.GAME.rememberedRerollCost = 0
			G.GAME.current_round.reroll_cost_increase = 0
		end
	end,
	unlocked = true,
}
local mirrorDeck = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Recycle Deck",
	key = "mirrorDeck",
	order = 1,
	--config = { vouchers = { "v_hone", "v_glow_up" } },
	pos = { x = 0, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		--G.GAME.common_mod = 0.7
		G.GAME.modifiers.hah_returningdeck = true
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	isFinalPre = false,
	calculate = function(self, card, context)
		if context.final_scoring_step and G.GAME.modifiers.hah_returningdeck and G.play ~= nil and G.play.cards ~= nil and #G.play.cards > 0 then--context.final_scoring_step
			isFinalPre = true
		elseif isFinalPre and G.GAME.modifiers.hah_returningdeck and (G.play == nil or G.play.cards == nil or #G.play.cards <= 0) and G.discard ~= nil and G.discard.cards ~= nil and #G.discard.cards > 0 then--isFinalPre and not context.destroying_card and
			isFinalPre = false
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
			G.E_MANAGER:add_event(Event({
				--trigger = "after",
				--delay = 5,
				func = function()
					draw_card(G.discard, G.hand, nil, nil, false, G.discard.cards[#G.discard.cards])
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
					--G.deck:shuffle("cry_reboot" .. G.GAME.round_resets.ante)
					--G.deck:hard_set_T()
					--G.STATE_COMPLETE = false
					return true
				end,
			}))
		end
	end,
	unlocked = true,
}
local mirrorDeck2 = {
	object_type = "Back",
	--dependencies = {
	--	items = {
	--		"set_cry_deck",
	--	},
	--},
	name = "Mirror Deck",
	key = "mirrorDeck2",
	order = 2,
	--config = { vouchers = { "v_hone", "v_glow_up" } },
	pos = { x = 0, y = 0 },
	atlas = "balatro_sprites_unusedDecks",
	apply = function(self)
		--G.GAME.common_mod = 0.7
		G.GAME.modifiers.hah_returningdeck = true
		--G.GAME.uncommon_mod = 1.5
		--G.GAME.rare_mod = 2
	end,
	isFinalPre = false,
	lastHandCardCount = 0,
	calculate = function(self, card, context)
		if context.final_scoring_step and G.GAME.modifiers.hah_returningdeck and G.play ~= nil and G.play.cards ~= nil and #G.play.cards > 0 then--context.final_scoring_step
			isFinalPre = true
			lastHandCardCount = #G.play.cards
		elseif isFinalPre and G.GAME.modifiers.hah_returningdeck and (G.play == nil or G.play.cards == nil or #G.play.cards <= 0) and lastHandCardCount ~= nil and lastHandCardCount ~= 0 and G.discard ~= nil and G.discard.cards ~= nil and #G.discard.cards > 0 then--isFinalPre and not context.destroying_card and
			isFinalPre = false
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
			G.E_MANAGER:add_event(Event({
				--trigger = "after",
				--delay = 5,
				func = function()
					for i = 0, lastHandCardCount - 1 do
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
					return true
				end,
			}))
		end
	end,
	unlocked = true,
}
local misprint = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Misprint",
	key = "misprint",
	order = 4,
	config = { cry_misprint_min = 0.1, cry_misprint_max = 10 },
	pos = { x = 4, y = 2 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 1) * self.config.cry_misprint_min
		G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 1) * self.config.cry_misprint_max
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition and G.jokers.cards[i].edition.cry_glitched then
					unlock_card(self)
					break
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
local infinite = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Infinite",
	key = "infinite",
	order = 2,
	config = { cry_highlight_limit = 1e20, hand_size = 1 },
	pos = { x = 3, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_highlight_limit = self.config.cry_highlight_limit
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "hand_contents" then
			if #args.cards >= 6 then
				unlock_card(self)
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
local conveyor = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Conveyor",
	key = "conveyor",
	order = 7,
	pos = { x = 1, y = 1 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_conveyor = true
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.cry_used_consumable == "c_cry_analog" then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
local CCD = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-CCD",
	key = "CCD",
	order = 5,
	config = { cry_ccd = true },
	pos = { x = 0, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_ccd = true
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.cry_used_consumable == "c_cry_hammerspace" then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
local wormhole = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
			"set_cry_exotic",
		},
	},
	name = "cry-Wormhole",
	key = "wormhole",
	order = 6,
	config = { cry_negative_rate = 20, joker_slot = -2 },
	pos = { x = 3, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_negative_rate = self.config.cry_negative_rate
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
	init = function(self)
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * (G.GAME.modifiers.cry_negative_rate or 1)
			end,
		}, true)
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.rarity == "cry_exotic" then
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
local redeemed = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Redeemed",
	key = "redeemed",
	order = 8,
	pos = { x = 4, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_redeemed = true
	end,
	init = function(self)
		local cr = Card.redeem
		function Card:redeem()
			cr(self)

			if G.GAME.modifiers.cry_redeemed then
				if
					#G.play.cards == 0
					and (not G.redeemed_vouchers_during_hand or #G.redeemed_vouchers_during_hand.cards == 0)
				then
					G.cry_redeemed_buffer = {}
				end
				for k, v in pairs(G.P_CENTER_POOLS["Voucher"]) do
					if v.requires and not G.GAME.used_vouchers[v] then
						for _, vv in pairs(v.requires) do
							if vv == self.config.center.key then
								--redeem extra voucher code based on Betmma's Vouchers
								local area
								if G.STATE == G.STATES.HAND_PLAYED then
									if not G.redeemed_vouchers_during_hand then
										G.redeemed_vouchers_during_hand = CardArea(
											G.play.T.x,
											G.play.T.y,
											G.play.T.w,
											G.play.T.h,
											{ type = "play", card_limit = 5 }
										)
									end
									area = G.redeemed_vouchers_during_hand
								else
									area = G.play
								end
								if not G.cry_redeemed_buffer then
									G.cry_redeemed_buffer = {}
								end
								if not G.cry_redeemed_buffer[v.key] and v.unlocked then
									local card = create_card("Voucher", area, nil, nil, nil, nil, v.key)
									G.cry_redeemed_buffer[v.key] = true
									card:start_materialize()
									area:emplace(card)
									card.cost = 0
									card.shop_voucher = false
									local current_round_voucher = G.GAME.current_round.voucher
									card:redeem()
									G.GAME.current_round.voucher = current_round_voucher
									G.E_MANAGER:add_event(Event({
										trigger = "after",
										delay = 0,
										func = function()
											card:start_dissolve()
											return true
										end,
									}))
								end
							end
						end
					end
				end
			end
		end
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "discover_amount" then
			if G.DISCOVER_TALLIES.vouchers.tally / G.DISCOVER_TALLIES.vouchers.of >= 1 then
				unlock_card(self)
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
local legendary = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Legendary",
	key = "legendary",
	config = { cry_legendary = true, cry_legendary_rate = 0.2 },
	pos = { x = 0, y = 6 },
	atlas = "atlasdeck",
	order = 15,
	calculate = function(self, back, context)
		if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
			if G.jokers then
				if #G.jokers.cards < G.jokers.config.card_limit then
					local legendary_poll = pseudorandom(pseudoseed("cry_legendary"))
					legendary_poll = legendary_poll / (G.GAME.probabilities.normal or 1)
					if legendary_poll < self.config.cry_legendary_rate then
						local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
					else
						card_eval_status_text(
							G.jokers,
							"jokers",
							nil,
							nil,
							nil,
							{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
						)
					end
				else
					card_eval_status_text(
						G.jokers,
						"jokers",
						nil,
						nil,
						nil,
						{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
					)
				end
			end
		end
	end,
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			local count = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.rarity == 4 then
					count = count + 1
				end
			end
			if count >= 2 then
				unlock_card(self)
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
local critical = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Critical",
	key = "critical",
	order = 10,
	config = { cry_crit_rate = 0.25, cry_crit_miss_rate = 0.125 },
	pos = { x = 4, y = 5 },
	atlas = "atlasdeck",
	loc_vars = function(self, info_queue, center)
		return { vars = { G.GAME.probabilities.normal or 1 } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			local check
			local crit_poll = pseudorandom(pseudoseed("cry_critical"))
			crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
			if crit_poll < self.config.cry_crit_rate then
				check = 2
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("talisman_emult", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_hit_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			elseif crit_poll < self.config.cry_crit_rate + self.config.cry_crit_miss_rate then
				check = 0.5
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("timpani", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_miss_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			end
			delay(0.6)
			if check then
				return {
					Emult_mod = check,
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.cry_rigged then
					unlock_card(self)
					break
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
local glowing = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Glowing",
	key = "glowing",
	-- is this config even used for anything
	config = { cry_glowing = true },
	pos = { x = 4, y = 2 },
	order = 9,
	loc_vars = function(self, info_queue, center)
		return { vars = { " " } }
	end,
	atlas = "glowing",
	calculate = function(self, back, context)
		if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
			for i = 1, #G.jokers.cards do
				if not Card.no(G.jokers.cards[i], "immutable", true) then
					Cryptid.with_deck_effects(G.jokers.cards[i], function(card)
						Cryptid.misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
					end)
				end
			end
		end
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win_deck" then
			if get_deck_win_stake("b_cry_beige") > 0 then
				unlock_card(self)
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
local beta = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Beta",
	key = "beta",
	config = { cry_beta = true },
	pos = { x = 5, y = 5 },
	order = 13,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_beta = true
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win_deck" then
			if get_deck_win_stake() >= 9 then
				unlock_card(self)
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
local bountiful = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Bountiful",
	key = "bountiful",
	config = { cry_forced_draw_amount = 5 },
	pos = { x = 2, y = 6 },
	order = 14,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_forced_draw_amount = self.config.cry_forced_draw_amount
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "round_win" then
			if
				G.GAME.blind.name == "The Serpent"
				and G.GAME.current_round.discards_left == G.GAME.round_resets.discards
			then
				unlock_card(self)
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
local beige = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Beige",
	key = "beige",
	pos = { x = 1, y = 6 },
	order = 15,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_common_value_quad = true
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "discover_amount" then
			if args.amount >= 200 then
				unlock_card(self)
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
local blank = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Blank",
	key = "blank",
	order = 75,
	pos = { x = 1, y = 0 },
	atlas = "atlasdeck",
}
local antimatter = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { mainline = "balanced", modest = "balanced" }) }
	end,
	name = "cry-Antimatter",
	order = 76,
	key = "antimatter",
	config = {
		cry_antimatter = true,
		cry_crit_rate = 0.25, --Critical Deck
		cry_legendary_rate = 0.2, --Legendary Deck
		-- Enhanced Decks
		cry_force_enhancement = "random",
		cry_force_edition = "random",
		cry_force_seal = "random",
		cry_forced_draw_amount = 5,
	},
	pos = { x = 2, y = 0 },
	calculate = function(self, back, context)
		if context.context ~= "final_scoring_step" then
			Cryptid.antimatter_trigger(self, context, Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness")
		else
			return Cryptid.antimatter_trigger_final_scoring(
				self,
				context,
				Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness"
			)
		end
	end,
	apply = function(self)
		Cryptid.antimatter_apply(Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness")
	end,
	atlas = "atlasdeck",
	init = function(self)
		function Cryptid.antimatter_apply(skip)
			--Blue Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_blue", "wins", 8) or 0 ~= 0) or skip
			then
				G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
			end
			--All Consumables (see Cryptid.get_antimatter_consumables)
			local querty = Cryptid.get_antimatter_consumables(nil, skip)
			if #querty > 0 then
				delay(0.4)
				G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in ipairs(querty) do
							if G.P_CENTERS[v] then
								local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, v, "deck")
								card:add_to_deck()
								G.consumeables:emplace(card)
							end
						end
						return true
					end,
				}))
			end
			--Yellow Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_yellow", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + 10
			end
			--Abandoned Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_abandoned", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.no_faces = true
			end
			--Ghost Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.spectral_rate = 2
			end
			-- Red Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_red", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
			end
			-- All Decks with Vouchers (see Cryptid.get_antimatter_vouchers)
			local vouchers = Cryptid.get_antimatter_vouchers(nil, skip)
			if #vouchers > 0 then
				for k, v in pairs(vouchers) do
					if G.P_CENTERS[v] then
						G.GAME.used_vouchers[v] = true
						G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
						G.E_MANAGER:add_event(Event({
							func = function()
								Card.apply_to_run(nil, G.P_CENTERS[v])
								return true
							end,
						}))
					end
				end
			end
			-- Checkered Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_checkered", "wins", 8) or 0) ~= 0
				or skip
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							if v.base.suit == "Clubs" then
								v:change_suit("Spades")
							end
							if v.base.suit == "Diamonds" then
								v:change_suit("Hearts")
							end
						end
						return true
					end,
				}))
			end
			-- Erratic Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_erratic", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.erratic_suits_and_ranks = true
			end
			-- Black Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_black", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
			end
			-- Painted Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_painted", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 2
			end
			-- Green Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_green", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) + 1
				G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 1
			end
			-- Spooky Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_spooky", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_spooky = true
				G.GAME.modifiers.cry_curse_rate = 0
				if Cryptid.enabled("j_cry_chocolate_dice") == true then
					G.E_MANAGER:add_event(Event({
						func = function()
							if G.jokers then
								local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chocolate_dice")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
								return true
							end
						end,
					}))
				end
			end
			-- Deck of Equilibrium
			if
				(
						Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
						or 0
					)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_equilibrium = true
			end
			-- Misprint Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_misprint", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_misprint_min = 1
				G.GAME.modifiers.cry_misprint_max = 10
			end
			-- Infinite Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_infinite", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_highlight_limit = 1e20
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			end
			-- Wormhole deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_wormhole", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_negative_rate = 20

				if Cryptid.enabled("set_cry_exotic") == true then
					G.E_MANAGER:add_event(Event({
						func = function()
							if G.jokers then
								local card =
									create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
								return true
							end
						end,
					}))
				end
			end
			-- Redeemed deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_redeemed", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_redeemed = true
			end
			--[[
			G.GAME.bosses_used["bl_goad"] = 1e308
			G.GAME.bosses_used["bl_window"] = 1e308
			G.GAME.bosses_used["bl_head"] = 1e308
			G.GAME.bosses_used["bl_club"] = 1e308
			]]
			--
			--Legendary Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_legendary", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
			end
			--Encoded Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_encoded", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							if
								G.P_CENTERS["j_cry_CodeJoker"]
								and (G.GAME.banned_keys and not G.GAME.banned_keys["j_cry_CodeJoker"])
								and Cryptid.enabled("j_cry_CodeJoker") == true
							then
								local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_CodeJoker")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
							end
							if
								G.P_CENTERS["j_cry_copypaste"]
								and Cryptid.enabled("j_cry_copypaste") == true
								and (G.GAME.banned_keys and not G.GAME.banned_keys["j_cry_copypaste"])
							then
								local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_copypaste")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
							end
							return true
						end
					end,
				}))
			end
			--Beige Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_beige", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.modifiers.cry_common_value_quad = true
			end
		end

		function Cryptid.antimatter_trigger_final_scoring(self, context, skip)
			if context.context == "final_scoring_step" then
				local crit_poll = pseudorandom(pseudoseed("cry_critical"))
				crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
				--Critical Deck
				if
					(
							Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_critical", "wins", 8)
							or 0
						)
						~= 0
					or skip
				then
					if crit_poll < self.config.cry_crit_rate then
						context.mult = context.mult ^ 2
						update_hand_text({ delay = 0 }, { mult = context.mult, chips = context.chips })
						G.E_MANAGER:add_event(Event({
							func = function()
								play_sound("talisman_emult", 1)
								attention_text({
									scale = 1.4,
									text = localize("cry_critical_hit_ex"),
									hold = 4,
									align = "cm",
									offset = { x = 0, y = -1.7 },
									major = G.play,
								})
								return true
							end,
						}))
						delay(0.6)
					end
				end
				--Plasma Deck
				local tot = context.chips + context.mult
				if
					(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_plasma", "wins", 8) or 0)
						~= 0
					or skip
				then
					context.chips = math.floor(tot / 2)
					context.mult = math.floor(tot / 2)
					update_hand_text({ delay = 0 }, { mult = context.mult, chips = context.chips })

					G.E_MANAGER:add_event(Event({
						func = function()
							local text = localize("k_balanced")
							play_sound("gong", 0.94, 0.3)
							play_sound("gong", 0.94 * 1.5, 0.2)
							play_sound("tarot1", 1.5)
							ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
							ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
							attention_text({
								scale = 1.4,
								text = text,
								hold = 2,
								align = "cm",
								offset = { x = 0, y = -2.7 },
								major = G.play,
							})
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								blockable = false,
								blocking = false,
								delay = 4.3,
								func = function()
									ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
									ease_colour(G.C.UI_MULT, G.C.RED, 2)
									return true
								end,
							}))
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								blockable = false,
								blocking = false,
								no_delete = true,
								delay = 6.3,
								func = function()
									G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] =
										G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
									G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] =
										G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
									return true
								end,
							}))
							return true
						end,
					}))

					delay(0.6)
				end
				return context.chips, context.mult
			end
		end
		function Cryptid.antimatter_trigger(self, context, skip)
			if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
				--Glowing Deck
				if
					(
							Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_glowing", "wins", 8)
							or 0
						)
						~= 0
					or skip
				then
					for i = 1, #G.jokers.cards do
						Cryptid.with_deck_effects(G.jokers.cards[i], function(card)
							Cryptid.misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
						end)
					end
				end
				--Legendary Deck
				if G.jokers then
					if
						(
								Cryptid.safe_get(
									G.PROFILES,
									G.SETTINGS.profile,
									"deck_usage",
									"b_cry_legendary",
									"wins",
									8
								) or 0
							)
							~= 0
						or skip
					then
						if #G.jokers.cards < G.jokers.config.card_limit then
							local legendary_poll = pseudorandom(pseudoseed("cry_legendary"))
							legendary_poll = legendary_poll / (G.GAME.probabilities.normal or 1)
							if legendary_poll < self.config.cry_legendary_rate then
								local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
								return true
							else
								card_eval_status_text(
									G.jokers,
									"jokers",
									nil,
									nil,
									nil,
									{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
								)
							end
						else
							card_eval_status_text(
								G.jokers,
								"jokers",
								nil,
								nil,
								nil,
								{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
							)
						end
					end
				end
				--Anaglyph Deck
				if
					(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_anaglyph", "wins", 8) or 0)
						~= 0
					or skip
				then
					G.E_MANAGER:add_event(Event({
						func = function()
							add_tag(Tag("tag_double"))
							play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
							play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
							return true
						end,
					}))
				end
			end
		end
		function Cryptid.get_antimatter_vouchers(voucher_table, skip)
			-- Create a table or use one that is passed into the function
			if not voucher_table or type(voucher_table) ~= "table" then
				voucher_table = {}
			end
			-- Add Vouchers into the table by key
			local function already_exists(t, voucher)
				for _, v in ipairs(t) do
					if v == voucher then
						return true
					end
				end
				return false
			end
			local function Add_voucher_to_the_table(t, voucher)
				if not already_exists(t, voucher) then
					table.insert(t, voucher)
				end
			end
			--Nebula Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_nebula", "wins", 8) or 0 ~= 0)
				or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_telescope")
			end
			-- Magic Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8) or 0 ~= 0) or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_crystal_ball")
			end
			-- Zodiac Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_zodiac", "wins", 8) or 0 ~= 0)
				or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_tarot_merchant")
				Add_voucher_to_the_table(voucher_table, "v_planet_merchant")
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
			end
			-- Deck Of Equilibrium
			if
				(
					Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
					or 0 ~= 0
				) or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
				Add_voucher_to_the_table(voucher_table, "v_overstock_plus")
			end
			return voucher_table
		end
		--Does this even need to be a function idk
		function Cryptid.get_antimatter_consumables(consumable_table, skip)
			if not consumable_table or type(consumable_table) ~= "table" then
				consumable_table = {}
			end
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8) or 0 ~= 0) or skip
			then
				table.insert(consumable_table, "c_fool")
				table.insert(consumable_table, "c_fool")
			end
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8) or 0 ~= 0) or skip
			then
				table.insert(consumable_table, "c_hex")
			end
			return consumable_table
		end
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win_deck" then
			if get_deck_win_stake("b_cry_blank") > 0 and get_deck_win_stake() >= 8 then
				unlock_card(self)
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

return {
	name = "Misc. Decks",
	items = {
		--very_fair,
		--equilibrium,--removed for too basic/i did not like
		--mirrorDeck,
		--mirrorDeck2,--mirror decks were combined into a mechanic card
		--foilDeck,--removed for too basic/i did not like
		--mysticDeck,--removed for too basic/i did not like
		--factoryDeck,--removed for too basic/i did not like
		--SilverDeck,--potential removal
		heirloomDeck,
		--voidDeck,--potential removal
		--misprint,
		--infinite,
		--conveyor,
		--CCD,
		--wormhole,
		--redeemed,
		--legendary,
		--critical,
		--glowing,
		--beta,
		--bountiful,
		--beige,
		--blank,
		--antimatter,
		--e_deck,
		--et_deck,
		--sk_deck,
		--st_deck,
		--sl_deck,
		--ascendedDeck,
		juggleDeck,
		PurpleDeck,
		godhoodDeck,
		--shopersDeck,
		--rerollInsaneDeck,
		stampedDeck,
		massiveDeck,
		midnightDeck,
		cheaterDeck,
	},
}
