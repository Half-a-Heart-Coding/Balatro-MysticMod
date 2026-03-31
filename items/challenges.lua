local NightmareNeedle = {
	object_type = "Challenge",
	key = "Nightmare_Needle",
	order = 1,
	loc_txt = {
        name = 'Nightmare Needle',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
		},
		modifiers = {
			{ id = "discards", value = 1 },
			{ id = "hands", value = 1 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 10 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_burglar" },
			{ id = "j_drunkard" },
			{ id = "j_merry_andy" },
			--below is (mostly) useless jokers
			--{ id = "j_burnt" },
			{ id = "j_banner" },--mostly useless
			--{ id = "j_delayed_grat" },
			--{ id = "j_trading" },
			--{ id = "j_faceless" },
			{ id = "j_card_sharp" },
			{ id = "j_yorick" },--mostly useless
			--below is vouchers
			{ id = "v_grabber" },
			{ id = "v_nacho_tong" },
			{ id = "v_wasteful" },
			{ id = "v_recyclomancy" },
		},
		banned_other = {
			{ id = "bl_house", type = "blind" },
			{ id = "bl_hook", type = "blind" },
			{ id = "bl_water", type = "blind" },
			{ id = "bl_eye", type = "blind" },
			{ id = "bl_mouth", type = "blind" },
			{ id = "bl_serpent", type = "blind" },
			{ id = "bl_needle", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	jokers = {
		--{ id = "j_dusk", edition = "negative", eternal = true },
		{ id = "j_pogoB_spacedJokes", edition = "negative" },
		{ id = "j_delayed_grat", edition = "negative", eternal = true },
		{ id = "j_pogoB_duo_print" },
		{ id = "j_juggler" },
	},
	--vouchers = {
	--	{ id = "v_blank" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local PureChaos = {
	object_type = "Challenge",
	key = "PureChaos",
	order = 1,
	loc_txt = {
        name = 'Calculated Chaos',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{ id = "hah_666" },--not true jokerless
			--{ id = "hah_chaosdhhabsdhasdbhasd" },--tells them that only physic appears
			--{ id = "hah_perm_mech_mirror" },--permanent_relflections
			--{ id = "permanent_arm" },
			{ id = "permanent_psychic" },
			--{ id = "prevent_deck_preview" },--only half works, which means nothing then
			
			--This challenge requires black jack to be utilized--nope
		},
		modifiers = {
			{ id = "discards", value = 0 },
			--{ id = "hands", value = 1 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 10 },
		},
	},
	jokers = {
		--{ id = "j_dusk", edition = "negative", eternal = true },
		--{ id = "j_pogoB_spacedJokes", edition = "negative" },
		{ id = "j_pogoB_lumpyjoke", eternal = true },
		--{ id = "j_pogoB_duo_print" },
		--{ id = "j_juggler" },
	},
	--{ id = "bl_manacle", type = "blind" },
	restrictions = {
		banned_cards = {
			{ id = "j_juggler" },
			{ id = "j_troubadour" },
			{ id = "j_turtle_bean" },
			{ id = "v_paint_brush" },
			{ id = "v_palette" },
			{ id = "c_ectoplasm" },
			{ id = "c_ouija" },

			{ id = "j_drunkard" },
			{ id = "j_merry_andy" },
			--below is (mostly) useless jokers
			{ id = "j_burnt" },
			{ id = "j_banner" },--mostly useless
			{ id = "j_delayed_grat" },

			{ id = "j_square" },
			{ id = "j_half" },
			--{ id = "j_trading" },
			--{ id = "j_faceless" },
			--{ id = "j_card_sharp" },
			{ id = "j_yorick" },--mostly useless
			--below is vouchers
			--{ id = "v_grabber" },
			--{ id = "v_nacho_tong" },
			{ id = "v_wasteful" },
			{ id = "v_recyclomancy" },
		},
		banned_tags = {
			{ id = "tag_juggle" },
		},
		banned_other = {
			--{ id = "bl_arm", type = "blind" },
			{ id = "bl_psychic", type = "blind" },
			{ id = "bl_water", type = "blind" },
			{ id = "bl_hook", type = "blind" },
			{ id = "bl_manacle", type = "blind" },
		},
	},
	--vouchers = {
	--	{ id = "v_blank" },
	--},
	deck = {
		type = "Challenge Deck",
		--cards = {
		--	{ s = "S", r = "2" },
		--	{ s = "S", r = "2" },
		--	{ s = "S", r = "2" },
		--	{ s = "S", r = "2" },
		--	{ s = "S", r = "2" },
		--},
	},
}
local SupremeCruelty = {
	object_type = "Challenge",
	key = "supreme_cruelty",
	order = 4,
	loc_txt = {
        name = 'Extreme Cruelty',
        v_text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			{id = 'no_reward'},
		},
		modifiers = {
			--{ id = "discards", value = 1 },
			--{ id = "hands", value = 1 },
			{ id = "joker_slots", value = 2 },
			--{ id = "hand_size", value = 7 },
			--{ id = "dollars", value = 0 },
			{ id = "consumable_slots", value = 1 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_blueprint" },
			{ id = "v_antimatter" },
		},
		banned_other = {
			--{ id = "bl_small", type = "blind" },
			--{ id = "bl_big", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	vouchers = {
		{ id = "v_blank" },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local TempRent = {
	object_type = "Challenge",
	key = "temp_rent",
	order = 2,
	loc_txt = {
        name = '6',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			{ id = "hah_jokerless" },--not true jokerless
			{id = 'no_shop_jokers'},
			{ id = "hah_666" },--not true jokerless
			--{ id = 'green_stake' },
		},
		modifiers = {
			{ id = "discards", value = 0 },
			{ id = "hands", value = 2 },
			{ id = "joker_slots", value = 0 },
			{ id = "hand_size", value = 5 },
			--{ id = "dollars", value = 0 },
			--{ id = "consumable_slots", value = 1 },
			--{ id = 'gold_stake' },
            --            { id = 'gold_cards' },
            --            { id = 'increased_price' }
            --        },
            --        modifiers = {
             --           { id = 'discards',    value = 2 },
             --           { id = 'hand_size',   value = 7 },
             --           { id = 'reroll_cost', value = 25 },
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "j_blueprint" },
			{ id = "v_magic_trick" },
			{ id = "v_wasteful" },
			{ id = "v_recyclomancy" },
			{ id = "v_illusion" },
			{ id = "v_directors_cut" },
			{ id = "v_retcon" },
			{ id = "c_familiar" },
			{ id = "c_grim" },
			{ id = "c_incantation" },
			{ id = "c_wraith" },
			{ id = "c_pogoB_wraithMythicVersion" },
			{ id = "c_pogoB_soul_but_weaker" },
			{ id = "c_pogoB_ectoplasm_butdifferent" },
			{ id = "c_pogoB_death_but_for_jokers_spectral" },
			--{ id = "c_pogoB_devilDeal" },
			{ id = "c_sigil" },
			{ id = "c_medium" },
			{ id = "c_ouija" },
			{ id = "c_ectoplasm" },
			{ id = "c_immolate" },
			{ id = "c_ankh" },
			{ id = "c_hex" },
			{ id = "c_cryptid" },
			{ id = "c_soul" },
			{ id = "c_justice" },
			{ id = "c_strength" },
			{ id = "c_hanged_man" },
			{ id = "c_tower" },
			{ id = "c_judgement" },
			{
				id = "p_buffoon_normal_1",
				ids = {
					"p_buffoon_normal_1",
					"p_buffoon_normal_2",
					"p_buffoon_jumbo_1",
					"p_buffoon_mega_1",
				},
			},
			{
				id = "p_standard_normal_1",
				ids = {
					"p_standard_normal_1",
					"p_standard_normal_2",
					"p_standard_normal_3",
					"p_standard_normal_4",
					"p_standard_jumbo_1",
					"p_standard_jumbo_2",
					"p_standard_mega_1",
					"p_standard_mega_2",
				},
			},
		},
		banned_tags = {
			{ id = "tag_uncommon" },
			{ id = "tag_rare" },
			{ id = "tag_pogoB_mythic" },
			{ id = "tag_pogoB_anitmaterJoke" },
			{ id = "tag_top_up" },
			{ id = "tag_negative" },
			{ id = "tag_foil" },
			{ id = "tag_holo" },
			{ id = "tag_polychrome" },
			{ id = "tag_boss" },
			{ id = "tag_standard" },
			{ id = "tag_buffoon" },
		},
		banned_other = {
			{ id = "bl_psychic", type = "blind" },
			--{ id = "bl_manacle", type = "blind" },
			{ id = "bl_goad", type = "blind" },
			{ id = "bl_hook", type = "blind" },
			{ id = "bl_head", type = "blind" },
			{ id = "bl_wheel", type = "blind" },
			{ id = "bl_club", type = "blind" },
			{ id = "bl_fish", type = "blind" },
			{ id = "bl_water", type = "blind" },
			{ id = "bl_window", type = "blind" },
			{ id = "bl_plant", type = "blind" },
			{ id = "bl_serpent", type = "blind" },
			{ id = "bl_pillar", type = "blind" },
			{ id = "bl_mark", type = "blind" },
			{ id = "bl_mouth", type = "blind" },
			{ id = "bl_eye", type = "blind" },
			--finisher blinds
			{ id = "bl_final_leaf", type = "blind" },
			{ id = "bl_final_heart", type = "blind" },
			{ id = "bl_final_acorn", type = "blind" },
			{ id = "bl_final_bell", type = "blind" },
			{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_big", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	jokers = {
		--{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
		--{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
		--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
		{ id = "j_sixth_sense" },
		--{ id = "j_cavendish", stickers = "eternal" },
		{ id = "j_dna", eternal = true },
		--{ id = "j_half" },--this makes it way too easy early game, hell late game
		--{ id = "j_hanging_chad" },--this makes it way too easy
		{ id = "j_joker", eternal = true },
		--{ id = "j_green_joker" },
		--{ id = "j_red_card" },
		--balance
		--{ id = "j_hologram" },
		--{ id = "j_obelisk" },--this hints at the final blind, too obvoius
		--{ id = "j_dusk" },
		--{ id = "j_card_sharp" },
		--{ id = "j_acrobat" },
		--{ id = "j_cavendish" },
		--{ id = "j_cavendish" },
	},
	consumeables = {
		{ id = "c_black_hole" },
		{ id = "c_black_hole" },
		{ id = "c_black_hole" },
	},
	vouchers = {
		{ id = "v_blank" },
		{ id = "v_crystal_ball" },
		{ id = "v_omen_globe" },
		{ id = "v_telescope" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "6" },
		},
	},
}
local MoneyHell = {
	object_type = "Challenge",
	key = "money_hell",
	order = 3,
	loc_txt = {
        name = 'Student Loans',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			
            {id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			{ id = "hah_debt" },
		},
		modifiers = {
			--{ id = "discards", value = 1 },
			--{ id = "hands", value = 1 },
			--{ id = "joker_slots", value = 2 },
			--{ id = "hand_size", value = 7 },
			{ id = "dollars", value = -20 },
			--{ id = "consumable_slots", value = 5 },
			{id = 'reroll_cost', value = 10},--double
		},
	},
	restrictions = {
		banned_cards = {
                {id = 'v_seed_money'},
                {id = 'v_money_tree'},
                {id = 'j_to_the_moon'},
                {id = 'j_rocket'},
				{id = 'j_egg'},
                {id = 'j_golden'},
				{id = 'j_hologram'},--certificate hologram is not a challenge
                --{id = 'j_satellite'},--terrible econ joker, so its allowed
                {id = 'j_delayed_grat'},
                {id = 'j_business'},
                {id = 'j_faceless'},
                {id = 'j_todo_list'},
                {id = 'j_ticket'},
                {id = 'j_matador'},
                {id = 'j_cloud_9'},
                {id = 'j_reserved_parking'},
                {id = 'j_mail'},
                {id = 'j_rough_gem'},
                --{id = 'j_chaos'},
                --{id = 'j_astronomer'},--not an econ, just stupidly op
                {id = 'c_hermit'},
                {id = 'c_temperance'},
				{ id = "c_wraith" },
				{ id = "c_pogoB_wraithMythicVersion" },
				{ id = "c_pogoB_soul_but_weaker" },
				{ id = "c_pogoB_ectoplasm_butdifferent" },
			{ id = "c_pogoB_death_but_for_jokers_spectral" },
			{ id = "c_pogoB_devilDeal" },
				{ id = "c_immolate" },
                --{id = 'c_talisman'},--certificate can give gold seal
				--{id = "v_reroll_surplus"},
				--{id = "v_reroll_glut"},
            },
			banned_tags = {
                {id = 'tag_skip'},
				{id = 'tag_handy'},
                {id = 'tag_garbage'},
                {id = 'tag_investment'},
                {id = 'tag_economy'},
            },
		banned_other = {
			--{ id = "bl_small", type = "blind" },
			--{ id = "bl_big", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	jokers = {
		--{ id = "j_loyalty_card", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_scholar", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
		{ id = "j_certificate", eternal = true },
		{ id = "j_credit_card" },
		--{ id = "j_vagabond" },
		--{ id = "j_ramen" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
	},
	vouchers = {
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local Neckro = {
	object_type = "Challenge",
	key = "neckro",
	order = 5,
	loc_txt = {
        name = 'Necromancer',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			
            --{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			{ id = "hah_bones" },
			{ id = "hah_bones86" },
			{ id = "hah_championStake" },
			--{id = 'no_shop_jokers'},
			{id = 'no_reward'},
		},
		modifiers = {
			--{ id = "discards", value = 2 },
			{ id = "hands", value = 3 },
			--{ id = "joker_slots", value = 4 },
			{ id = "hand_size", value = 7 },

			--{ id = "stake", value = 6 },
			--{ id = "hah_champion", },--hah_champion

			--{ id = "dollars", value = -20 },
			--{ id = "consumable_slots", value = 5 },
			--{id = 'reroll_cost', value = 10},--double
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "j_blueprint" },
			--{ id = "v_magic_trick" },
			--{ id = "v_wasteful" },
			--{ id = "v_recyclomancy" },
			--{ id = "v_illusion" },
			--{ id = "v_directors_cut" },
			--{ id = "v_retcon" },
			--{ id = "c_familiar" },
			--{ id = "c_grim" },
			--{ id = "c_incantation" },

			--{ id = "c_wraith" },
			--{ id = "c_pogoB_wraithMythicVersion" },
			--{ id = "c_pogoB_soul_but_weaker" },
			--{ id = "c_pogoB_ectoplasm_butdifferent" },
			{ id = "c_pogoB_death_but_for_jokers_spectral" },
			--{ id = "c_pogoB_devilDeal" },
			--{ id = "v_antimatter" },
			--{ id = "c_sigil" },
			--{ id = "c_medium" },
			--{ id = "c_ouija" },
			--{ id = "c_ectoplasm" },
			--{ id = "c_immolate" },
			{ id = "c_ankh" },
			--{ id = "c_hex" },
			--{ id = "c_cryptid" },
			--{ id = "c_soul" },
			--{ id = "c_justice" },
			--{ id = "c_strength" },
			--{ id = "c_hanged_man" },
			--{ id = "c_tower" },
			--{ id = "c_judgement" },
			--{
			--	id = "p_buffoon_normal_1",
			--	ids = {
			--		"p_buffoon_normal_1",
			--		"p_buffoon_normal_2",
			--		"p_buffoon_jumbo_1",
			--		"p_buffoon_mega_1",
			--	},
			--},
		},
		banned_tags = {
			--{ id = "tag_uncommon" },
			--{ id = "tag_rare" },
			--{ id = "tag_pogoB_mythic" },
			--{ id = "tag_pogoB_anitmaterJoke" },
			--{ id = "tag_top_up" },
			--{ id = "tag_negative" },
			--{ id = "tag_foil" },
			--{ id = "tag_holo" },
			--{ id = "tag_polychrome" },
			--{ id = "tag_boss" },
			--{ id = "tag_standard" },
			--{ id = "tag_buffoon" },
		},
		banned_other = {
			--{ id = "bl_final_leaf", type = "blind" },
			--{ id = "bl_final_heart", type = "blind" },
			--{ id = "bl_final_acorn", type = "blind" },
			--{ id = "bl_final_bell", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_big", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	jokers = {
		--{ id = "j_loyalty_card", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_scholar", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
		{ id = "j_golden", eternal = true },
		--{ id = "j_mr_bones", eternal = true, stickers = { "eternal" } },
		--{ id = "j_vagabond" },
		--{ id = "j_ramen" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
	},
	consumeables = {
		--{ id = "c_black_hole" },
	},
	vouchers = {
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local NoChallenge = {
	object_type = "Challenge",
	key = "no_challenge",
	order = 6,
	loc_txt = {
        name = 'The Gambling Master',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			
            --{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			{ id = "hah_jokerless" },
			{id = 'no_shop_jokers'},
			{ id = "hah_purge" },
			--{id = 'no_reward'},
		},
		modifiers = {
			{ id = "discards", value = 4 },
			{ id = "hands", value = 5 },
			{ id = "joker_slots", value = 10 },
			{ id = "hand_size", value = 9 },
			{ id = "dollars", value = 5 },
			{ id = "consumable_slots", value = 3 },
			{id = 'reroll_cost', value = 4},
			-- +1 to all (-1 to reroll_cost)
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "j_blueprint" },
			--{ id = "v_magic_trick" },
			--{ id = "v_wasteful" },
			--{ id = "v_recyclomancy" },
			--{ id = "v_illusion" },
			--{ id = "v_directors_cut" },
			--{ id = "v_retcon" },
			--{ id = "c_familiar" },
			--{ id = "c_grim" },
			--{ id = "c_incantation" },

			--{ id = "c_wraith" },

			--{ id = "v_antimatter" },
			--{ id = "c_sigil" },
			--{ id = "c_medium" },
			--{ id = "c_ouija" },
			--{ id = "c_ectoplasm" },
			--{ id = "c_immolate" },
			--{ id = "c_ankh" },
			--{ id = "c_hex" },
			--{ id = "c_cryptid" },
			--{ id = "c_soul" },
			{ id = "c_justice" },
			{ id = "c_strength" },
			{ id = "c_hanged_man" },
			{ id = "c_tower" },
			{ id = "c_fool" },
			{ id = "c_magician" },
			{ id = "c_high_priestess" },
			{ id = "c_empress" },
			{ id = "c_emperor" },
			{ id = "c_heirophant" },--Hierophant
			{ id = "c_wheel_of_fortune" },
			{ id = "c_lovers" },
			{ id = "c_chariot" },
			{ id = "c_hermit" },
			{ id = "c_death" },
			{ id = "c_temperance" },
			{ id = "c_devil" },
			{ id = "c_star" },
			{ id = "c_moon" },
			{ id = "c_sun" },
			{ id = "c_world" },
			--{ id = "c_judgement" }, --this_is_the_only_tarot_allowed_in_this_challenge
			{
				id = "p_buffoon_normal_1",
				ids = {
					"p_buffoon_normal_1",
					"p_buffoon_normal_2",
					"p_buffoon_jumbo_1",
					"p_buffoon_mega_1",
				},
			},
		},
		banned_tags = {
			{ id = "tag_uncommon" },
			{ id = "tag_rare" },
			{ id = "tag_pogoB_mythic" },
			{ id = "tag_pogoB_anitmaterJoke" },

			--{ id = "tag_top_up" }, --ehh, more Gambling

			{ id = "tag_negative" },
			{ id = "tag_foil" },
			{ id = "tag_holo" },
			{ id = "tag_polychrome" },
			{ id = "tag_boss" },
			{ id = "tag_standard" },
			{ id = "tag_buffoon" },
			{id = 'tag_skip'},
			{id = 'tag_handy'},
            {id = 'tag_garbage'},
            {id = 'tag_investment'},
            {id = 'tag_economy'},
			{id = 'tag_charm'},
				{id = 'tag_meteor'},
                {id = 'tag_ethereal'},
                {id = 'tag_coupon'},
                {id = 'tag_double'},
				{id = 'tag_d6'},
				{id = 'tag_dice'},
				{id = 'tag_voucher'},
                {id = 'tag_juggle'},
                {id = 'tag_orbital'},
		},
		banned_other = {
			--{ id = "bl_final_leaf", type = "blind" },
			--{ id = "bl_final_heart", type = "blind" },
			--{ id = "bl_final_acorn", type = "blind" },
			--{ id = "bl_final_bell", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_big", type = "blind" },
			--{ id = "bl_pogo_chips_gein", type = "blind" },--Idk how to disable, also basically water
		},
	},
	jokers = {
		--{ id = "j_loyalty_card", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_scholar", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_golden", eternal = true },
		{ id = "j_ring_master", eternal = true },
		--{ id = "j_vagabond" },
		--{ id = "j_ramen" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
	},
	consumeables = {
		--{ id = "c_black_hole" },
	},
	vouchers = {
		{ id = "v_tarot_merchant" },
		{ id = "v_tarot_tycoon" },
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local Printer = {
	object_type = "Challenge",
	key = "printer",
	order = 7,
	loc_txt = {
        name = 'PERISHMENT',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{ id = "inflation" },
            --{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{ id = "hah_purge" },
			{id = 'hah_allperish'},
		},
		modifiers = {
			--{ id = "discards", value = 4 },
			--{ id = "hands", value = 5 },
			--{ id = "joker_slots", value = 10 },
			--{ id = "hand_size", value = 9 },
			--{ id = "dollars", value = 5 },
			--{ id = "consumable_slots", value = 3 },
			--{id = 'reroll_cost', value = 4},
			-- +1 to all (-1 to reroll_cost)
		},
	},
	jokers = {
		--{ id = "j_loyalty_card", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_scholar", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_golden", eternal = true },
		--{ id = "j_ring_master", eternal = true },
		--{ id = "j_vagabond" },
		--{ id = "j_ramen" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_invisible" },
	},
	consumeables = {
		--{ id = "c_wraith" },
		--{ id = "c_judgement" },
	},
	vouchers = {
		{ id = "v_clearance_sale" },
		{ id = "v_liquidation" },
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local AllIn = {
	object_type = "Challenge",
	key = "all_in",
	order = 7,
	loc_txt = {
        name = 'Eternal Rent',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			{ id = "all_eternal" },
			--{ id = "inflation" },
            {id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--to the fucking moon
			{id = 'no_reward'},
			{id = 'hah_all_in_bs_rules'},
			--{id = 'golden'},
			--{id = 'dollar_discard'},
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{ id = "hah_purge" },
			--{id = 'hah_allperish'},
		},
		modifiers = {
			--{ id = "discards", value = 3 },
			--{ id = "hands", value = 3 },
			{ id = "joker_slots", value = 25 },
			--{ id = "hand_size", value = 9 },
			{ id = "dollars", value = 100 },
			--{ id = "win_ante", value = 10 },
			--{ id = "stake", value = 6 },
			--{ id = "pack_size", value = 3},
			--{ id = "reroll_cost_increase", value = 2 }, --maybe this means 2 at a time?
			--{ id = "ante", value = 3 },
			--{ id = "consumable_slots", value = 3 },
			--{id = 'reroll_cost', value = 4},
			-- +1 to all (-1 to reroll_cost)
		},
	},
	restrictions = {
		banned_cards = {
            --{id = 'v_seed_money'},
           --{id = 'v_money_tree'},
            {id = 'j_to_the_moon'},
			{ id = "c_ectoplasm" },
			{ id = "v_blank" },
			{ id = "v_antimatter" },
			{ id = "j_stencil" },
			{ id = "j_abstract" },
		},
	},
	jokers = {
		--{ id = "j_loyalty_card", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_scholar", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_blackboard", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_golden", eternal = true },
		--{ id = "j_ring_master", eternal = true },
		--{ id = "j_vagabond" },
		--{ id = "j_ramen" },
		--{ id = "j_ride_the_bus", stickers = { "eternal" }, edition = "negative" },
		--{ id = "j_invisible" },
	},
	consumeables = {
		--{ id = "c_wraith" },
		--{ id = "c_judgement" },
	},
	vouchers = {
		{ id = "v_seed_money" },
		{ id = "v_money_tree" },
	},
	--jokers = {
	--	{ id = "j_dusk", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	{ id = "j_delayed_grat", edition = "negative", stickers = { "eternal" } },--cant get eternal to work
	--	--{ id = "j_splash", edition = "negative", stickers = { "eternal" } },
	--	{ id = "j_juggler" },
	--},
	deck = {
		type = "Challenge Deck",
	},
}
local HollowHell = {
	object_type = "Challenge",
	key = "Hollow_Hell",
	order = 8,
	loc_txt = {
        name = 'Hollow Deck',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			{id = 'no_extra_hand_money'},
            {id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			{id = 'no_reward'},
			{ id = 'HaH_gift_basket'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			{ id = "dollars", value = 0 },
			{id = 'reroll_cost', value = 10},
			{ id = "consumable_slots", value = 1 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_credit_card" },--yeah...no
			--{ id = "j_golden" },
			{id = 'v_seed_money'},
                {id = 'v_money_tree'},
                {id = 'j_to_the_moon'},
                {id = 'j_rocket'},
				{id = 'j_egg'},
                {id = 'j_golden'},
				--{id = 'j_hologram'},--certificate hologram is not a challenge
                --{id = 'j_satellite'},--terrible econ joker, so its allowed
                {id = 'j_delayed_grat'},
                {id = 'j_business'},
                {id = 'j_faceless'},
                {id = 'j_todo_list'},
                {id = 'j_ticket'},
                {id = 'j_matador'},
                {id = 'j_cloud_9'},
                {id = 'j_reserved_parking'},
                {id = 'j_mail'},
                {id = 'j_rough_gem'},
				--{ id = "c_wraith" },
				{ id = "c_immolate" },
			--{ id = "j_drunkard" },
			--{ id = "j_merry_andy" },
			--{ id = "j_banner" },--useless
			--{ id = "j_yorick" },--useless
			--{ id = "j_delayed_grat" },--useless
			--below is vouchers
			--{ id = "v_wasteful" },
			--{ id = "v_recyclomancy" },
			--{ id = "c_hanged_man" },
			{ id = "c_fool" },--just annoying
			{ id = "c_magician" },--instant win if it hits
			--{ id = "c_high_priestess" },
			--{ id = "c_empress" },
			--{ id = "c_emperor" },
			--{ id = "c_heirophant" },--Hierophant
			--{ id = "c_wheel_of_fortune" },
			--{ id = "c_lovers" },
			--{ id = "c_chariot" },
			{ id = "c_hermit" },--no
			{ id = "c_devil" },
			{ id = "c_temperance" },--no, just no
		},
		banned_tags = {
			{ id = "tag_uncommon" },
			{ id = "tag_rare" },
			{ id = "tag_pogoB_mythic" },
			{ id = "tag_pogoB_anitmaterJoke" },

			{ id = "tag_top_up" },

			{ id = "tag_negative" },
			{ id = "tag_foil" },
			{ id = "tag_holo" },
			{ id = "tag_polychrome" },
			--{ id = "tag_boss" },
			{ id = "tag_standard" },
			{ id = "tag_buffoon" },
			{id = 'tag_skip'},
			{id = 'tag_handy'},
            {id = 'tag_garbage'},
            {id = 'tag_investment'},
            {id = 'tag_economy'},
			{id = 'tag_charm'},
				{id = 'tag_meteor'},
                {id = 'tag_ethereal'},
                {id = 'tag_coupon'},
                {id = 'tag_double'},
				{id = 'tag_d6'},
				{id = 'tag_dice'},
				{id = 'tag_voucher'},
                --{id = 'tag_juggle'},
                {id = 'tag_orbital'},
		},
		banned_other = {
			--{ id = "bl_water", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		{ id = "j_splash" },--when highcard is gone
		{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		{ id = "j_idol", eternal = true },
		{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		{ id = "v_planet_merchant" },
		{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		{ id = "v_clearance_sale" },
		{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pluto" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "2" },
			{ s = "C", r = "3" },
			{ s = "C", r = "4" },
			{ s = "C", r = "5" },
			{ s = "C", r = "7" },
			{ s = "H", r = "8" },
			{ s = "H", r = "9" },
			{ s = "H", r = "T" },
			{ s = "D", r = "Q" },
			{ s = "D", r = "K" },
			{ s = "S", r = "A" },
		},
	},
}
local GetDunkedOn = {
	object_type = "Challenge",
	key = "Get_Dunked_On",
	order = 9,
	loc_txt = {
        name = 'Get Dunked On',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_dunked_On'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "consumable_slots", value = 1 },
		},
	},
	restrictions = {
		banned_cards = {
			
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_water", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pluto" },
	},
	deck = {
		type = "Challenge Deck",
		--cards = {
			--{ s = "S", r = "2" },
			--{ s = "C", r = "3" },
			--{ s = "C", r = "4" },
			--{ s = "C", r = "5" },
			--{ s = "C", r = "7" },
			--{ s = "H", r = "8" },
			--{ s = "H", r = "9" },
			--{ s = "H", r = "T" },
			--{ s = "D", r = "Q" },
			--{ s = "D", r = "K" },
			--{ s = "S", r = "A" },
		--},
	},
}
local PersihEternal = {
	object_type = "Challenge",
	key = "Persih_Eternal",
	order = 10,
	loc_txt = {
        name = 'Perished Eternity',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_delayed_eternal'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			{ id = "joker_slots", value = 3 },
		},
	},
	restrictions = {
		banned_cards = {
			
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_water", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pluto" },
	},
	deck = {
		type = "Challenge Deck",
		--cards = {
			--{ s = "S", r = "2" },
			--{ s = "C", r = "3" },
			--{ s = "C", r = "4" },
			--{ s = "C", r = "5" },
			--{ s = "C", r = "7" },
			--{ s = "H", r = "8" },
			--{ s = "H", r = "9" },
			--{ s = "H", r = "T" },
			--{ s = "D", r = "Q" },
			--{ s = "D", r = "K" },
			--{ s = "S", r = "A" },
		--},
	},
}
local PersihEternal2 = {
	object_type = "Challenge",
	key = "Persih_Eternal2",
	order = 11,
	loc_txt = {
        name = 'Strongest Will',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_delayed_champion'},
			--{id = 'hah_allperish'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "joker_slots", value = 3 },
		},
	},
	restrictions = {
		banned_cards = {
			
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_water", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pluto" },
	},
	deck = {
		type = "Challenge Deck",
		--cards = {
			--{ s = "S", r = "2" },
			--{ s = "C", r = "3" },
			--{ s = "C", r = "4" },
			--{ s = "C", r = "5" },
			--{ s = "C", r = "7" },
			--{ s = "H", r = "8" },
			--{ s = "H", r = "9" },
			--{ s = "H", r = "T" },
			--{ s = "D", r = "Q" },
			--{ s = "D", r = "K" },
			--{ s = "S", r = "A" },
		--},
	},
}
local OneJimbo = {
	object_type = "Challenge",
	key = "One_Jimbo",
	order = 10,
	loc_txt = {
        name = 'The Chosen One',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_no_negatives'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			{ id = "joker_slots", value = 1 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_madness" },
			{ id = "j_stencil" },
			{ id = "j_ceremonial" },
			{ id = "j_abstract" },
			{ id = "j_swashbuckler" },
			{ id = "j_riff_raff" },
			{ id = "j_gift" },
			{ id = "j_baseball" },
			{ id = "j_blueprint" },
			{ id = "j_brainstorm" },
			{ id = "j_invisible" },
		},
		banned_tags = {
			{ id = "tag_negative" },
		},
		banned_other = {
			--{ id = "bl_water", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pluto" },
	},
	deck = {
		type = "Challenge Deck",
		--cards = {
			--{ s = "S", r = "2" },
			--{ s = "C", r = "3" },
			--{ s = "C", r = "4" },
			--{ s = "C", r = "5" },
			--{ s = "C", r = "7" },
			--{ s = "H", r = "8" },
			--{ s = "H", r = "9" },
			--{ s = "H", r = "T" },
			--{ s = "D", r = "Q" },
			--{ s = "D", r = "K" },
			--{ s = "S", r = "A" },
		--},
	},
}
local AceInThePot = {
	object_type = "Challenge",
	key = "Ace_In_The_Pot",
	order = 11,
	loc_txt = {
        name = 'Pot of Aces',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			{ id = 'HaH_no_negatives'},
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			{ id = "joker_slots", value = 1 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_madness" },
			{ id = "j_stencil" },
			{ id = "j_ceremonial" },
			{ id = "j_abstract" },
			{ id = "j_swashbuckler" },
			{ id = "j_riff_raff" },
			{ id = "j_gift" },
			{ id = "j_baseball" },
			{ id = "j_blueprint" },
			{ id = "j_brainstorm" },
			{ id = "j_invisible" },
		},
		banned_tags = {
			{ id = "tag_negative" },
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			{ id = "bl_needle", type = "blind" },
			{ id = "bl_wall", type = "blind" },
			{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_ceres" },
		--{ id = "c_ceres" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "A" },
			{ s = "S", r = "A" },
			{ s = "H", r = "A" },
			{ s = "H", r = "A" },
			{ s = "C", r = "A" },
			{ s = "C", r = "A" },
			{ s = "D", r = "A" },
			{ s = "D", r = "A" },
			{ s = "S", r = "2" },
			{ s = "D", r = "2" },
			{ s = "H", r = "3" },
			{ s = "C", r = "3" },
			{ s = "S", r = "4" },
			{ s = "D", r = "4" },
			{ s = "H", r = "5" },
			{ s = "C", r = "5" },
			{ s = "S", r = "6" },
			{ s = "D", r = "6" },
			{ s = "H", r = "7" },
			{ s = "C", r = "7" },
			{ s = "S", r = "8" },
			{ s = "D", r = "8" },
			{ s = "H", r = "9" },
			{ s = "C", r = "9" },
			{ s = "S", r = "T" },
			{ s = "D", r = "T" },
			{ s = "H", r = "J" },
			{ s = "C", r = "J" },
			{ s = "S", r = "Q" },
			{ s = "D", r = "Q" },
			{ s = "H", r = "K" },
			{ s = "C", r = "K" },
			{ s = "S", r = "3" },
			{ s = "D", r = "3" },
			{ s = "H", r = "2" },
			{ s = "C", r = "2" },
		},
	},
}
local PerfectlyNormalScaling = {
	object_type = "Challenge",
	key = "Perfectly_Normal_Scaling",
	order = 12,
	loc_txt = {
        name = 'Perfectly Normal Scaling',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			{ id = 'HaH_super_scaling'},--ante_scales_go_brrr
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "scaling", value = 4 },
			--{ id = "booster_ante_scaling", value = true },
			--{ id = "ante_scaling", value = 50 },
		},
	},
	restrictions = {
		banned_cards = {
			
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			--{ id = "bl_needle", type = "blind" },
			--{ id = "bl_wall", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_ceres" },
		--{ id = "c_ceres" },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local SpectralNightmare = {
	object_type = "Challenge",
	key = "Spectral_Nightmare",
	order = 13,
	loc_txt = {
        name = 'Spectral Tycoon',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			--{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			{ id = 'HaH_spectral_rate_up'},--spectral_go_brrr
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "scaling", value = 4 },
			--{ id = "booster_ante_scaling", value = true },
			--{ id = "ante_scaling", value = 50 },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "v_planet_merchant" },
			{ id = "v_tarot_merchant" },
			{ id = "v_planet_tycoon" },
			{ id = "v_tarot_tycoon" },
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			--{ id = "bl_needle", type = "blind" },
			--{ id = "bl_wall", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_ceres" },
		--{ id = "c_ceres" },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local AnteUP = {
	object_type = "Challenge",
	key = "Ante_UP",
	order = 14,
	loc_txt = {
        name = 'Up the Ante',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			--{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			{ id = 'HaH_ANTEUP'},--anteUp
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "scaling", value = 4 },
			--{ id = "booster_ante_scaling", value = true },
			--{ id = "ante", value = 3 },
			--{ id = "blind_ante", value = 3 },
			--{ id = "win_ante", value = 10 },
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "v_planet_merchant" },
			--{ id = "v_tarot_merchant" },
			--{ id = "v_planet_tycoon" },
			--{ id = "v_tarot_tycoon" },
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			--{ id = "bl_needle", type = "blind" },
			--{ id = "bl_wall", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		--{ id = "j_hanging_chad", eternal = true },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_certificate", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_ceres" },
		--{ id = "c_ceres" },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local DebugTestChal = {
	object_type = "Challenge",
	key = "Debug_Test__challne",
	order = 15,
	loc_txt = {
        name = 'Easy Mode',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			--{ id = "hah_jokerless" },
			--{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			--{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			--{ id = 'HaH_no_negatives'},
		},
		modifiers = {
			{ id = "discards", value = 4 },
			{ id = "hands", value = 3 },
			{ id = "hand_size", value = 9 },
			{ id = "dollars", value = 25 },
			{id = 'reroll_cost', value = 4},
			{ id = "joker_slots", value = 6 },
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "j_madness" },
			--{ id = "j_stencil" },
			--{ id = "j_ceremonial" },
			--{ id = "j_abstract" },
			--{ id = "j_swashbuckler" },
			--{ id = "j_riff_raff" },
			--{ id = "j_gift" },
			--{ id = "j_baseball" },
			--{ id = "j_blueprint" },
			--{ id = "j_brainstorm" },
			--{ id = "j_invisible" },
		},
		banned_tags = {
			--{ id = "tag_negative" },
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			--{ id = "bl_needle", type = "blind" },
			--{ id = "bl_wall", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		{ id = "j_pogoB_googol_play" },--when highcard is gone
		--{ id = "j_pogoB_blank_joke" },
		{ id = "j_pogoB_blank_joke" },
		{ id = "j_pogoB_blueprint_mythic" },
		--{ id = "j_pogoB_blank_joke" },
		{ id = "j_pogoB_selective_jokes" },
		{ id = "j_pogoB_bordom" },
		--{ id = "j_pogoB_bordom" },
		--{ id = "j_delayed_grat", edition = "negative", eternal = true },
		--{ id = "j_splash", eternal = true },
		--{ id = "j_idol", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		{ id = "v_planet_merchant" },
		{ id = "v_planet_tycoon" },
		--{ id = "v_tarot_merchant" },
		{ id = "v_telescope" },
		{ id = "v_observatory" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_pogoB_randomHandPlanet" },
		--{ id = "c_pogoB_white_hole" },
		--{ id = "c_pogoB_worm_hole" },
		--{ id = "c_pogoB_wraithMythicVersion" },
		{ id = "c_pogoB_gasterAHand" },
		{ id = "c_pogoB_gasterAHand" },
		{ id = "c_black_hole" },
		{ id = "c_pogoB_gasterAHand" },
		{ id = "c_pogoB_gasterAHand" },
		{ id = "c_pogoB_gasterAHand" },
		{ id = "c_pogoB_gasterAHand" },
		--{ id = "c_pogoB_randomHandPlanet" },
		--{ id = "c_pogoB_randomHandPlanet" },
		--{ id = "c_pogoB_recentHandPlanet" },
		--{ id = "c_pogoB_recentHandPlanet" },
		--{ id = "c_pogoB_recentHandPlanet" },
		--{ id = "c_ceres" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "2" },
			{ s = "S", r = "3" },
			{ s = "S", r = "4" },
			{ s = "S", r = "5" },
			{ s = "S", r = "6" },
			{ s = "S", r = "7" },
			{ s = "S", r = "8" },
			{ s = "S", r = "9" },
			{ s = "S", r = "T" },
			{ s = "S", r = "J" },
			{ s = "S", r = "Q" },
			{ s = "S", r = "K" },
			{ s = "S", r = "A" },
		},
	},
}
local CheesyMethods = {
	object_type = "Challenge",
	key = "cheeseyyyy",
	order = 16,
	loc_txt = {
        name = 'Cheese',
        text = {
            "Modded Challenge",
        }
    },
	rules = {
		custom = {
			--{ id = "all_eternal" },
			--{id = 'no_extra_hand_money'},
            --{id = 'no_interest'},--you need to get out of debt
			--{ id = "hah_bones" },
			{ id = "hah_jokerless" },
			{id = 'no_shop_jokers'},
			--{id = 'no_reward'},
			--{ id = 'HaH_perm_flint'},--1.5x_small 2.25x_big 3.25x_boss
			--{ id = 'HaH_ANTEUP'},--anteUp
		},
		modifiers = {
			--{ id = "discards", value = 0 },
			--{ id = "hands", value = 11 },
			--{ id = "hand_size", value = 10 },
			--{ id = "dollars", value = 0 },
			--{id = 'reroll_cost', value = 10},
			--{ id = "scaling", value = 4 },
			--{ id = "booster_ante_scaling", value = true },
			--{ id = "ante", value = 3 },
			--{ id = "blind_ante", value = 3 },
			--{ id = "win_ante", value = 10 },
		},
	},
	restrictions = {
		banned_cards = {
			--{ id = "v_planet_merchant" },
			--{ id = "v_tarot_merchant" },
			--{ id = "v_planet_tycoon" },
			--{ id = "v_tarot_tycoon" },
		},
		banned_tags = {
			
		},
		banned_other = {
			--{ id = "bl_flint", type = "blind" },
			--{ id = "bl_needle", type = "blind" },
			--{ id = "bl_wall", type = "blind" },
			--{ id = "bl_final_vessel", type = "blind" },
			--{ id = "bl_serpent", type = "blind" },
		},
	},
	jokers = {
		--{ id = "j_splash" },--when highcard is gone
		{ id = "j_perkeo", edition = "negative", eternal = true },
		--{ id = "j_oops", edition = "negative", eternal = true },
		--{ id = "j_oops", edition = "negative", eternal = true },
		{ id = "j_marble", eternal = true },
		{ id = "j_marble", eternal = true },
		{ id = "j_marble", eternal = true },
		{ id = "j_flower_pot", eternal = true },
		--{ id = "j_yorick", eternal = true },
	},
	vouchers = {
		--{ id = "v_planet_merchant" },
		--{ id = "v_tarot_merchant" },
		--{ id = "v_overstock" },
		--{ id = "v_clearance_sale" },
		--{ id = "v_directors_cut" },
	},
	consumeables = {
		--{ id = "c_hex" },
		--{ id = "c_hex" },
		--{ id = "c_hex" },
		--{ id = "c_hex" },
		--{ id = "c_ectoplasm" },
		--{ id = "c_ectoplasm" },
		--{ id = "c_wheel_of_fortune" },
		--{ id = "c_wheel_of_fortune" },
		--{ id = "c_wheel_of_fortune" },
		--{ id = "c_wheel_of_fortune" },
		{ id = "c_pogoB_garden" },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local gfcr = G.FUNCS.can_reroll
function G.FUNCS.can_reroll(e)
	if G.GAME.modifiers.cry_no_rerolls then
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	else
		return gfcr(e)
	end
end
local gsr = Game.start_run
function Game:start_run(args)
	gsr(self, args)
	if G.GAME.modifiers.hah_jokerless then
		G.GAME.joker_rate = 0
	end
	if G.GAME.modifiers.hah_championStake then
        G.GAME.modifiers.no_blind_reward = self.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
        G.GAME.modifiers.scaling = 3
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.booster_ante_scaling = true
		G.GAME.starting_params.enable_champions = true
		G.GAME.starting_params.allow_biggerBlinds = true
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1--this does not work here
        G.GAME.stake = 11
    end
	if G.GAME.modifiers.HaH_spectral_rate_up then
		G.GAME.spectral_rate = 5
		G.GAME.edition_rate = 0
        G.GAME.joker_rate = 0
        G.GAME.tarot_rate = 0
		G.GAME.planet_rate = 0
        G.GAME.playing_card_rate = 0
	end
	--if G.GAME.modifiers.permanent_psychic then
	--level_up_hand(args, "pogoB_GodHand", true, 1.8e308)
	if G.GAME.modifiers.HaH_ANTEUP then
		G.GAME.round_resets.ante = -1
		G.GAME.round_resets.blind_ante = -1
		--G.GAME.modifiers.scaling = 0.95
        --G.GAME.modifiers.booster_ante_scaling = true
	end
	--G.P_CENTERS.j_blueprint.rarity = "pogoB_hah_mythic"

	--Joker Reworks (Add a config option later)
	if pogoB_config.vanilla_rework then
		--ease_dollars(20000)--just to make sure it works quickly
		G.P_CENTERS.j_chicot.rarity = "pogoB_hah_mythic"--a proper rarity
		G.P_CENTERS.j_chicot.cost = 14
		--G.P_CENTERS.j_duo.config.Xmult = 3
		--G.P_CENTERS.j_trio.config.Xmult = 4
		--G.P_CENTERS.j_family.config.Xmult = 5
		G.P_CENTERS.j_order.config.Xmult = 3.5
		G.P_CENTERS.j_tribe.config.Xmult = 2.5
		G.P_CENTERS.j_obelisk.config.extra = 0.25--just a little better
		G.P_CENTERS.j_wee.config.extra.chip_mod = 10--just a little better
		G.P_CENTERS.j_stuntman.config.extra.chip_mod = 300--just a little better
		G.P_CENTERS.j_loyalty_card.config.extra.every = 4--just a little better
		G.P_CENTERS.j_green_joker.rarity = 2--uncommon, because green
		G.P_CENTERS.j_green_joker.config.extra.hand_add = 2--match green deck, and make it useful/valid option
		G.P_CENTERS.j_green_joker.cost = 5
		G.P_CENTERS.j_square.config.extra.chip_mod = 9--over 2x better, this joker sucks normally, and this is still a square
		G.P_CENTERS.j_seance.cost = 5--I cant find a way to make this joker good/useful
		G.P_CENTERS.j_yorick.config.Xmult = 2--start at 2x mult, because it takes a while
		G.P_CENTERS.j_throwback.config.extra = 0.3--just a little better
		G.P_CENTERS.j_campfire.rarity = 2
		G.P_CENTERS.j_campfire.cost = 7
		G.P_CENTERS.j_campfire.config.extra = 0.2--weaker, but uncommon
	end
	--if not G.mechanicCardDuration then 
		G.mechanicCardDuration = 4
	--end
	if G.GAME and G.GAME.used_vouchers["v_pogoB_mechanicCardVoucher"] then
		G.mechanicCardDuration = 6
	end
	if G.GAME.cheaterDeck_is_currentDeck then--50% more common
		G.P_CENTERS.p_pogoB_mechanic_normal_1.weight = 2.1
		G.P_CENTERS.p_pogoB_mechanic_jumbo_1.weight = 0.9
	end
	pogoB_config.allow_blackJack = false
	--if G.GAME.hands["pogoB_BlackJack"].level == 1 then--otherwise save quit levels it up every time, and black goo is broken
	--	if pogoB_config.allow_blackJack then--this handtype is weird
	--		update_hand_text(
	--			{ sound = "button", volume = 0.0, pitch = 1.1, delay = 0 },
	--			{ mult = 0, chips = 0, handname = "Dont question it", level = "" }
	--		)
	--		level_up_hand(used_consumable, "pogoB_BlackJack", false, 1)
	--		G.GAME.hands["pogoB_BlackJack"].l_chips = 0
	--		update_hand_text(
	--			{ sound = "button", volume = 0.0, pitch = 1.1, delay = 0 },
	--			{ mult = 0, chips = 0, handname = "", level = "" }
	--		)
	--		--G.GAME.blackGoo_chance_upperNum = 100
	--		--G.GAME.blackGoo_chance_lowerNum = 1
	--	end
	--end
	if not G.GAME.pizzaRollsahasdhasgfhasgfhas_thisIsFirstLoadOfRun then
		G.GAME.pizzaRollsahasdhasgfhasgfhas_thisIsFirstLoadOfRun = 10
		G.GAME.blackGoo_chance_upperNum = 100
		G.GAME.blackGoo_chance_lowerNum = 1
		mechanic_tag_soStackInsteadOfDuplicate = false
		if pogoB_config.silver_spoon then
			pogoB_config.silver_spoon = false
			ease_dollars(0.01)
		end
		--G.P_CENTERS.tag_pogoB_merge_mech_tag.config.rounds_to_last = 4
	end
	if G.GAME.massiveDeck_make_standard_packs_free then
		G.P_CENTERS.p_standard_normal_1.cost = 0
		G.P_CENTERS.p_standard_normal_2.cost = 0
		G.P_CENTERS.p_standard_normal_3.cost = 0
		G.P_CENTERS.p_standard_normal_4.cost = 0
		G.P_CENTERS.p_standard_jumbo_1.cost = 0
		G.P_CENTERS.p_standard_jumbo_2.cost = 0
		G.P_CENTERS.p_standard_mega_1.cost = 0
		G.P_CENTERS.p_standard_mega_2.cost = 0
		if pogoB_config.vanilla_rework then--erosion breaks on this deck for some reason, so massive bonus if you can cut the deck this much
			--update: fixed, but still buffing it
			G.P_CENTERS.j_erosion.config.extra = 5--10
		end
		G.GAME.starting_deck_size = 104
	else
		G.P_CENTERS.p_standard_normal_1.cost = 4
		G.P_CENTERS.p_standard_normal_2.cost = 4
		G.P_CENTERS.p_standard_normal_3.cost = 4
		G.P_CENTERS.p_standard_normal_4.cost = 4
		G.P_CENTERS.p_standard_jumbo_1.cost = 6
		G.P_CENTERS.p_standard_jumbo_2.cost = 6
		G.P_CENTERS.p_standard_mega_1.cost = 8
		G.P_CENTERS.p_standard_mega_2.cost = 8
		G.P_CENTERS.j_erosion.config.extra = 4--always reset it to vanilla value
	end
	if G.GAME.GodHoodDeck and pogoB_config.vanilla_rework then
		G.P_CENTERS.j_credit_card.config.extra = 10
	else
		G.P_CENTERS.j_credit_card.config.extra = 20
	end
	G.GAME.hands["pogoB_BlackJack"].l_chips = 0

	if (G.GAME.challenge == "Neckro" or G.GAME.modifiers.hah_bones) and G.jokers and G.jokers.cards and #G.jokers.cards < 1 then
		G.GAME.modifiers.no_blind_reward = self.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
        G.GAME.modifiers.scaling = 3
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.booster_ante_scaling = true
		G.GAME.starting_params.enable_champions = true
		G.GAME.starting_params.allow_biggerBlinds = true
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1--this does not work here
        G.GAME.stake = 11
		local card = create_card("Joker", G.jokers, nil, nil, true, nil, "j_mr_bones", "j_mr_bones")
		card:add_to_deck()
		card:start_materialize()
		set_stamp(card, "immunity_stamp")
		card.config.center.eternal_compat = true
		card.eternal = true
		card:set_eternal(true)
		card.ability.eternal = true
		G.jokers:emplace(card)
	end
end
local break_even = {
	object_type = "Achievement",
	key = "break_even",
	order = 1,
	bypass_all_unlocked = true,
	--atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "chip_score" and args.chips == 300 then--to_big(2) ^ to_big(1024)
			return true
		end
	end,
}
local challenges = {
	NightmareNeedle,
	--SupremeCruelty,
	--TempRent,
	--MoneyHell,
	Neckro,
	--NoChallenge,
	--Printer,
	--AllIn,
	--HollowHell,
	GetDunkedOn,
	--PersihEternal,
	PersihEternal2,
	PureChaos,
	--AceInThePot,
	--PerfectlyNormalScaling,
	--SpectralNightmare,
	--AnteUP,
	--DebugTestChal,
	--CheesyMethods,

	--Achievements
	--break_even,
}



local ashduas = Game.update
function Game:update(dt)
	--if G.GAME.round_resets.blind_ante >= 38 then
	--	G.GAME.round_resets.blind_choices.Boss = "bl_pogoB_tumble"
	--	if G.GAME.round_resets.boss_rerolled then
	--		--G.STATE = G.STATES.NEW_ROUND
	--		G.GAME.round_resets.blind_ante = 39--i said dont reroll
	--	end
	--end
	if G.GAME.GodHoodDeck then
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
	end
	if not G.mechanicCardDuration then 
		G.mechanicCardDuration = 4
	end
	if (G.GAME.challenge == "Neckro" or G.GAME.modifiers.hah_bones) and G.jokers and G.jokers.cards and #G.jokers.cards < 1 then
		G.GAME.modifiers.no_blind_reward = self.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
        G.GAME.modifiers.scaling = 3
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.booster_ante_scaling = true
		G.GAME.starting_params.enable_champions = true
		G.GAME.starting_params.allow_biggerBlinds = true
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1--this does not work here
        G.GAME.stake = 11
		local card = create_card("Joker", G.jokers, nil, nil, true, nil, "j_mr_bones", "j_mr_bones")
		card:add_to_deck()
		card:start_materialize()
		set_stamp(card, "immunity_stamp")
		card.config.center.eternal_compat = true
		card.eternal = true
		card:set_eternal(true)
		card.ability.eternal = true
		G.jokers:emplace(card)
	end
	if G.GAME.chips and G.GAME.blind and G.GAME.blind.chips and G.GAME.blind.chips > 1 and G.GAME.chips > 1 and G.GAME.chips/G.GAME.blind.chips > 1 and (G.GAME.challenge == "Neckro" or G.GAME.modifiers.hah_bones) then
		--G.STATE = G.STATES.GAME_OVER
		 G.GAME.modifiers.scaling = 999
		 G.GAME.modifiers.HaH_super_scaling = true
		 G.GAME.modifiers.HaH_perm_flint = true
	end
	if G.jokers and G.jokers.cards and G.GAME and G.GAME.blind and G.GAME.blind.chips then
		for _, card in ipairs(G.jokers.cards) do
            --card:set_debuff(true)
			if card.config.preventValue then
				card.config.preventValue = math.ceil(G.GAME.blind.chips / 4)
			end
			if card.ability.preventValue then
				card.ability.preventValue = math.ceil(G.GAME.blind.chips / 4)
			end
        end
	end
	ashduas(self, dt)
end

local bsb = Blind.set_blind
function Blind:set_blind(blind, y, z)
	--if G.GAME.round_resets.blind_ante >= 38 then
	--	G.GAME.round_resets.blind_choices.Boss = "bl_pogoB_tumble"
	--end
	if G.GAME.modifiers.HaH_perm_flint then
		local c = "Boss"
		if string.sub(G.GAME.subhash or "", -1) == "S" then
			c = "Small"
		end
		if string.sub(G.GAME.subhash or "", -1) == "B" then
			c = "Big"
		end
		if not y and blind and blind.mult then
			if c == "Boss" then
				blind.mult = 3.25
			elseif c == "Big" then
				blind.mult = 2.25
			else 
				blind.mult = 1.5
			end
		end
		if G.GAME.modifiers.HaH_super_scaling then 
	--	G.GAME.interest_cap = 1000000--yes, this works, but no, balance is not here
		--G.GAME.modifiers.scaling = 4
       -- G.GAME.modifiers.booster_ante_scaling = true
		G.GAME.modifiers.ante_scaling = 50
	end
	--else
	--	local c = "Boss"
	--	if string.sub(G.GAME.subhash or "", -1) == "S" then
	--		c = "Small"
	--	end
	--	if string.sub(G.GAME.subhash or "", -1) == "B" then
	--		c = "Big"
	--	end
	--	if not y and blind and blind.mult then
	--		if c == "Boss" then
	--			blind.mult = 2
	--		elseif c == "Big" then
	--			blind.mult = 1.5
	--		else 
	--			blind.mult = 1
	--		end
	--	end
	end
	bsb(self, blind, y, z)
end

--for k, v in pairs(G.P_CENTERS) do
--	if v.set == "Joker" then
--		if not v.perishable_compat or not v.eternal_compat then
--			NightmareNeedle.restrictions.banned_cards[#NightmareNeedle.restrictions.banned_cards + 1] = { id = k }
--		end
--	end
--end

-- Calculate events on start of shop
local guis = G.UIDEF.shop
G.UIDEF.shop = function(e)
	local ret = guis(e)
	SMODS.calculate_context({ start_shop = true })
	--if G.GAME.challenge == "Neckro" or G.GAME.modifiers.hah_bones then
	--	local card = create_card("Joker", G.jokers, nil, nil, true, nil, "j_mr_bones", "j_mr_bones")
	--			card:add_to_deck()
	--			card:start_materialize()
	--			G.jokers:emplace(card)
	--end
	--if G.GAME.shopperDeck then
	--	G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
	--end
	--if (G.GAME.challenge == "NoChallenge" or G.GAME.modifiers.hah_purge) then
	--	for _, card in ipairs(G.jokers.cards) do
    --        --card:set_debuff(true)
	--		--if (not card.eternal) then --does not work on the first showman for some reason
	--			card:start_dissolve()
	--		--end
    --        --card:juice_up()
    --    end
	--	local card_show = create_card("Joker", G.jokers, nil, nil, true, nil, "j_ring_master", "j_ring_master")
	--			card_show:add_to_deck()
	--			card_show:start_materialize()
	--			card_show.eternal = true
	--			card_show:set_eternal(true)
	--			card_show.ability.eternal = true
	--			G.jokers:emplace(card_show)
	--end
	
	for iii, card in ipairs(G.jokers.cards) do
		if card.ability.perishimient ~= nil then
		if card.ability.perishimient == true then
            --card:set_debuff(true)
			--if (not card.eternal) then --does not work on the first showman for some reason
				card:start_dissolve()
			--end
            --card:juice_up()
        end
		end
	end
	if G.GAME.modifiers.hah_all_in_bs_rules then 
	--	G.GAME.interest_cap = 1000000--yes, this works, but no, balance is not here
		G.GAME.modifiers.scaling = 3
        G.GAME.modifiers.booster_ante_scaling = true
	end
	if G.GAME.modifiers.HaH_gift_basket then
		local card = create_card("Consumeable", G.consumeables, nil, nil, true, nil, "c_emperor", "c_emperor")
				card:add_to_deck()
				card:start_materialize()
				G.consumeables:emplace(card)
	end
	if G.GAME.modifiers.HaH_dunked_On then
		for _, card in ipairs(G.jokers.cards) do
            --card:set_debuff(true)
			if card.ability.perish_tally == nil then
				card:juice_up()
				card:set_debuff(true)
				card:set_perishable(true)
				card.ability.perish_tally = 0 -- set_perishable should be doing this? whatever
				card.ability.perishable = true
			elseif (card.ability.perish_tally < 1) then --does not work on the first showman for some reason
				card:juice_up()
				card:set_debuff(false)
				card:set_perishable(false)
				card.ability.perish_tally = 2 -- set_perishable should be doing this? whatever
				card.ability.perishable = false
			else
				card:juice_up()
				card:set_debuff(true)
				card:set_perishable(true)
				card.ability.perish_tally = 0 -- set_perishable should be doing this? whatever
				card.ability.perishable = true
			end
        end
	end
	if G.GAME.modifiers.HaH_delayed_eternal then
		for _, card in ipairs(G.jokers.cards) do
		if card.ability.eternal then
			card:juice_up()
			--card:set_debuff(false)
			--card:set_perishable(false)
			card.ability.perish_tally = 999 -- set_perishable should be doing this? whatever
			card.ability.perishable = false
		elseif card.ability.perish_tally == nil then
			card:juice_up()
			card:set_debuff(true)
			card:set_perishable(true)
			card.ability.perish_tally = G.GAME.perishable_rounds -- set_perishable should be doing this? whatever
			card.ability.perishable = true
		elseif (card.ability.perish_tally < 1) then --does not work on the first showman for some reason
			card:juice_up()
			card:set_debuff(false)
			card:set_perishable(false)
			card.ability.perish_tally = 999 -- set_perishable should be doing this? whatever
			card.ability.perishable = false

			card:set_eternal(true)
			card.ability.eternal = true
		end
		end
	end
	if G.GAME.modifiers.HaH_delayed_champion then
		for _, card in ipairs(G.jokers.cards) do
		if card.ability.champion_sticker_stake then
			card:juice_up()
			--card:set_debuff(false)
			--card:set_perishable(false)
			card.ability.perish_tally = 999 -- set_perishable should be doing this? whatever
			card.ability.perishable = false
		elseif card.ability.perish_tally == nil then
			card:juice_up()
			card:set_debuff(true)
			card:set_perishable(true)
			card.ability.perish_tally = 3 -- set_perishable should be doing this? whatever
			card.ability.perishable = true
		elseif (card.ability.perish_tally < 1) then --does not work on the first showman for some reason
			card:juice_up()
			card:set_debuff(false)
			card:set_perishable(false)
			card.ability.perish_tally = 999 -- set_perishable should be doing this? whatever
			card.ability.perishable = false

			--card:set_eternal(true)
			card.ability.champion_sticker_stake = true
		end
		end
	end
	if G.GAME.modifiers.HaH_super_scaling then 
	--	G.GAME.interest_cap = 1000000--yes, this works, but no, balance is not here
		if G.GAME.modifiers.scaling == nil then
		G.GAME.modifiers.scaling = 4
		else
		G.GAME.modifiers.scaling = G.GAME.modifiers.scaling + 0.5
		end
        G.GAME.modifiers.booster_ante_scaling = true
		--G.GAME.modifiers.ante_scaling = 50
	end
	if G.GAME.modifiers.HaH_ANTEUP then
		G.GAME.round_resets.ante = G.GAME.round_resets.ante + 1
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
		--G.GAME.modifiers.scaling = 0.95
        --G.GAME.modifiers.booster_ante_scaling = true
	end
	return ret
end

--Calculate events on cash out
local gfco = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
	local ret = gfco(e)
	SMODS.calculate_context({ cash_out = true })
	--if G.GAME.modifiers.hah_all_in_bs_rules then
	--	G.GAME.interest_cap = 1000000
	--end
	return ret
end

function determineCost(DefaultCost)
	local finalCost = DefaultCost
	if G.GAME.GodHoodDeck then
		
	else

	end
	return finalCost
end

--it works, it shouldnt but we dont question it (import from Cryptidmod worked without much issue)
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local area = area or G.jokers
	local pseudo = function(x)
		return pseudorandom(pseudoseed(x))
	end
	local ps = pseudoseed
	if area == "ERROR" then
		pseudo = function(x)
			return pseudorandom(Cryptid.predict_pseudoseed(x))
		end
		ps = Cryptid.predict_pseudoseed
	end
	local center = G.P_CENTERS.b_red
	if (_type == "Joker" or _type == "Meme") and G.GAME and G.GAME.modifiers and G.GAME.modifiers.all_rnj then
		forced_key = "j_cry_rnjoker"
	end
	if _type == "Joker" and G.GAME.modifiers.hah_acension == true then
		center.rarity = 2
	end
	local function aeqviable(center)
		return center.unlocked and not Cryptid.no(center, "doe") and not (center.rarity == "cry_exotic")
	end
	if _type == "Joker" and not _rarity and not legendary then
		if not G.GAME.aequilibriumkey then
			G.GAME.aequilibriumkey = 1
		end
		local aeqactive = nil
		if next(find_joker("Ace Aequilibrium")) and not forced_key then
			while not aeqactive or not aeqviable(G.P_CENTER_POOLS.Joker[aeqactive]) do
				if math.ceil(G.GAME.aequilibriumkey) > #G.P_CENTER_POOLS["Joker"] then
					G.GAME.aequilibriumkey = 1
				end
				aeqactive = math.ceil(G.GAME.aequilibriumkey)
				G.GAME.aequilibriumkey = math.ceil(G.GAME.aequilibriumkey + 1)
			end
		end
		if aeqactive then
			forced_key = G.P_CENTER_POOLS["Joker"][aeqactive].key
		end
	end
	--should pool be skipped with a forced key
	if not forced_key and soulable and not G.GAME.banned_keys["c_soul"] then
		for _, v in ipairs(SMODS.Consumable.legendaries) do
			if
				(_type == v.type.key or _type == v.soul_set)
				and not (G.GAME.used_jokers[v.key] and not next(find_joker("Showman")) and not v.can_repeat_soul)
			then
				if pseudo("soul_" .. v.key .. _type .. G.GAME.round_resets.ante) > (1 - v.soul_rate) then
					forced_key = v.key
				end
			end
		end
		if
			(_type == "Tarot" or _type == "Spectral" or _type == "Tarot_Planet")
			and not (G.GAME.used_jokers["c_soul"] and not next(find_joker("Showman")))
		then
			if pseudo("soul_" .. _type .. G.GAME.round_resets.ante) > 0.997 then
				forced_key = "c_soul"
			end
		end
		if
			(_type == "Planet" or _type == "Spectral")
			and not (G.GAME.used_jokers["c_black_hole"] and not next(find_joker("Showman")))
		then
			if pseudo("soul_" .. _type .. G.GAME.round_resets.ante) > 0.997 then
				forced_key = "c_black_hole"
			end
		end
	end

	if _type == "Base" then
		forced_key = "c_base"
	end

	if forced_key then --vanilla behavior change, mainly for M Joker reasons
		center = G.P_CENTERS[forced_key]
		_type = (center.set ~= "Default" and center.set or _type)
	else
		gcparea = area
		local _pool, _pool_key = get_current_pool(_type, _rarity, legendary, key_append)
		gcparea = nil
		center = pseudorandom_element(_pool, ps(_pool_key))
		local it = 1
		while center == "UNAVAILABLE" do
			it = it + 1
			center = pseudorandom_element(_pool, ps(_pool_key .. "_resample" .. it))
		end

		center = G.P_CENTERS[center]
	end

	local front = (
		(_type == "Base" or _type == "Enhanced")
		and (
			pseudorandom_element(G.P_CARDS, ps("front" .. (key_append or "") .. G.GAME.round_resets.ante))
			or G.P_CARDS["S_T"]
		)
	) or nil

	if area == "ERROR" then
		local ret = (front or center)
		if not ret.config then
			ret.config = {}
		end
		if not ret.config.center then
			ret.config.center = {}
		end
		if not ret.config.center.key then
			ret.config.center.key = ""
		end
		if not ret.ability then
			ret.ability = {}
		end
		return ret --the config.center.key stuff prevents a crash with Jen's Almanac hook
	end

	local card = Card(
		area and (area.T.x + area.T.w / 2) or 0,
		area and area.T.y or 0,
		G.CARD_W * (center and center.set == "Booster" and 1.27 or 1),
		G.CARD_H * (center and center.set == "Booster" and 1.27 or 1),
		front,
		center,
		{
			bypass_discovery_center = area == G.shop_jokers
				or area == G.pack_cards
				or area == G.shop_vouchers
				or (G.shop_demo and area == G.shop_demo)
				or area == G.jokers
				or area == G.consumeables,
			bypass_discovery_ui = area == G.shop_jokers
				or area == G.pack_cards
				or area == G.shop_vouchers
				or (G.shop_demo and area == G.shop_demo),
			discover = area == G.jokers or area == G.consumeables,
			bypass_back = G.GAME.selected_back.pos,
		}
	)
	if front and G.GAME.modifiers.cry_force_suit then
		card:change_suit(G.GAME.modifiers.cry_force_suit)
	end
	if front and G.GAME.modifiers.cry_force_enhancement then
		card:set_ability(G.P_CENTERS[G.GAME.modifiers.cry_force_enhancement])
	end
	if front and G.GAME.modifiers.cry_force_edition then
		card:set_edition({ [G.GAME.modifiers.cry_force_edition] = true }, true, true)
	end
	if front and G.GAME.modifiers.cry_force_seal then
		card:set_seal(G.GAME.modifiers.cry_force_seal)
	end
	if card.ability.consumeable and not skip_materialize then
		card:start_materialize()
	end
	--if front and G.GAME.massiveDeck_make_standard_packs_free then
	--	card.ability.couponed = true
	--	card:set_cost()
	--end
	for k, v in ipairs(SMODS.Sticker.obj_buffer) do
		local sticker = SMODS.Stickers[v]
		if
			sticker.should_apply
			and type(sticker.should_apply) == "function"
			and sticker:should_apply(card, center, area)
		then
			sticker:apply(card, true)
		end
	end
	if
		G.GAME.modifiers.cry_force_sticker == "eternal"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then -- wow that is long
		card:set_eternal(true)
		card.ability.eternal = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "perishable"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card:set_perishable(true)
		card.ability.perish_tally = G.GAME.perishable_rounds -- set_perishable should be doing this? whatever
		card.ability.perishable = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "rental"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card:set_rental(true)
		card.ability.rental = true
	end
	if G.GAME.forcedStampProtocol and (_type == "Joker" or _type == "Card" or _type == "Playing Card" or _type == "Base" or _type == "Enhanced") then
		local randChosen = math.random()
		if randChosen > 0.8 then
			set_stamp(card, "nebula_stamp")
		elseif randChosen > 0.6 then
			set_stamp(card, "aggressive_stamp")
		elseif randChosen > 0.4 then
			set_stamp(card, "immunity_stamp")
		elseif randChosen > 0.2 then
			set_stamp(card, "powered_stamp")
		else
			set_stamp(card, "golden_stamp")
		end
	end
	if not G.GAME.forcedStampProtocol and math.random() > 0.76 and (_type == "Card" or _type == "Playing Card" or _type == "Base" or _type == "Enhanced") and _type ~= "Joker" then
		local randChosen = math.random()
		if randChosen > 0.8 then
			set_stamp(card, "nebula_stamp")
		elseif randChosen > 0.6 then
			set_stamp(card, "aggressive_stamp")
		elseif randChosen > 0.4 then
			set_stamp(card, "immunity_stamp")
		elseif randChosen > 0.2 then
			set_stamp(card, "powered_stamp")
		else
			set_stamp(card, "golden_stamp")
		end
	end
	if not G.GAME.forcedStampProtocol and math.random() > 0.88 and (_type == "Joker") then
		if pogoB_config.allow_naturalAggressive then
			local randChosen = math.random()
			if randChosen > 0.8 then
				set_stamp(card, "nebula_stamp")
			elseif randChosen > 0.6 then
				set_stamp(card, "aggressive_stamp")
			elseif randChosen > 0.4 then
				set_stamp(card, "immunity_stamp")
			elseif randChosen > 0.2 then
				set_stamp(card, "powered_stamp")
			else
				set_stamp(card, "golden_stamp")
			end
		else
			local randChosen = math.random()
			if randChosen > 0.75 then
				set_stamp(card, "nebula_stamp")
			elseif randChosen > 0.5 then
				set_stamp(card, "immunity_stamp")
			elseif randChosen > 0.25 then
				set_stamp(card, "powered_stamp")
			else
				set_stamp(card, "golden_stamp")
			end
		end
	end
	if
		G.GAME.modifiers.cry_force_sticker == "pinned"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card.pinned = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "banana"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card.ability.banana = true
	end
	if G.GAME.modifiers.cry_sticker_sheet_plus and not (_type == "Base" or _type == "Enhanced") then
		for k, v in pairs(SMODS.Stickers) do
			if v.apply and not v.no_sticker_sheet then
				v:apply(card, true)
			end
		end
	end

	if card.ability.name == "cry-Cube" then
		card:set_eternal(true)
	end
	if _type == "Joker" or (G.GAME.modifiers.cry_any_stickers and not G.GAME.modifiers.cry_sticker_sheet) then
		if G.GAME.modifiers.all_eternal then
			card:set_eternal(true)
		end
		--if card.ability.name == "pogoB_acesion" then
		--	card:set_edition("e_polychrome")
		--end
		if G.GAME.modifiers.cry_all_perishable then
			card:set_perishable(true)
		end
		if G.GAME.modifiers.hah_allperish then
			card:set_perishable(true)
			card.ability.perish_tally = 3
			card.ability.perishable = true
		end
		if G.GAME.modifiers.cry_all_rental then
			card:set_rental(true)
		end
		if G.GAME.modifiers.hah_debt and card.ability.eternal then
			card:set_rental(true)
		end
		if G.GAME.modifiers.hah_all_in_bs_rules then
			G.GAME.rental_rate = 1
			card:set_rental(true)
			G.GAME.rental_rate = 1
		end
		if G.GAME.modifiers.HaH_delayed_eternal then
			card:set_perishable(true)
			card.ability.perish_tally = G.GAME.perishable_rounds
			card.ability.perishable = true
		end
		if G.GAME.modifiers.HaH_delayed_champion then
			card:set_perishable(true)
			card.ability.perish_tally = 3
			card.ability.perishable = true
		end
		if G.GAME.modifiers.hah_purge then
			card.ability.perishimient = true
		end
		if G.GAME.modifiers.HaH_no_negatives then
			card.ability.negative = false
		end
		if G.GAME.modifiers.cry_all_pinned then
			card.pinned = true
		end
		if G.GAME.modifiers.cry_all_banana then
			card.ability.banana = true
		end
		if
			G.GAME.starting_params.enable_delayed
			and not card.ability.perishimient
			and (pseudorandom("cry_banana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
		then
			card:set_procrast(true)
		end
		if (area == G.shop_jokers) or (area == G.pack_cards) then
			local eternal_perishable_poll = pseudorandom("cry_et" .. (key_append or "") .. G.GAME.round_resets.ante)
			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
				card:set_eternal(true)
			end
			if G.GAME.modifiers.enable_perishables_in_shop then
				if
					not G.GAME.modifiers.cry_eternal_perishable_compat
					and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7))
				then
					card:set_perishable(true)
				end
				if
					G.GAME.modifiers.cry_eternal_perishable_compat
					and pseudorandom("cry_per" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
				then
					card:set_perishable(true)
				end
			end
			if
				G.GAME.starting_params.enable_champions
				and not card.ability.champion_sticker_stake
				and eternal_perishable_poll <= 0.4
				and eternal_perishable_poll > 0.15
			then
				card.ability.champion_sticker_stake = true
				--card:set_eternal(false)
				--card:set_perishable(false)
				card.ability.eternal = false
				card.ability.perishable = false
			end
			if
				G.GAME.modifiers.enable_rentals_in_shop
				and pseudorandom("cry_ssjr" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card:set_rental(true)
			end
			if
				G.GAME.modifiers.cry_enable_pinned_in_shop
				and pseudorandom("cry_pin" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card.pinned = true
			end
			if
				not G.GAME.modifiers.cry_eternal_perishable_compat
				and G.GAME.modifiers.enable_banana
				and (pseudorandom("cry_banana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
				and (eternal_perishable_poll <= 0.7)
			then
				card.ability.banana = true
			end
			if
				G.GAME.modifiers.cry_eternal_perishable_compat
				and G.GAME.modifiers.enable_banana
				and (pseudorandom("cry_banana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
			then
				card.ability.banana = true
			end
			if G.GAME.modifiers.cry_sticker_sheet then
				for k, v in pairs(SMODS.Stickers) do
					if v.apply and not v.no_sticker_sheet then
						v:apply(card, true)
					end
				end
			end
			if
				not card.ability.eternal
				and G.GAME.modifiers.cry_enable_flipped_in_shop
				and pseudorandom("cry_flip" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card.cry_flipped = true
			end
		end
		if _type == "Joker" and not G.GAME.modifiers.cry_force_edition then
			local edition = poll_edition("edi" .. (key_append or "") .. G.GAME.round_resets.ante)
			card:set_edition(edition)
			check_for_unlock({ type = "have_edition" })
		end
	end
	if (card.ability.set == "Code") and G.GAME.used_vouchers.v_cry_quantum_computing then
		local tot = 0
		for k, v in pairs(SMODS.find_card("v_cry_quantum_computing")) do
			tot = tot + v.ability.extra
		end
		if card.ability.cry_multiuse then
			card.ability.cry_multiuse = math.ceil((card.ability.cry_multiuse + tot))
		else
			card.ability.cry_multiuse = tot + 1
		end
	end
	if
		G.GAME.modifiers.cry_force_edition
		and not G.GAME.modifiers.cry_force_random_edition
		and area ~= G.pack_cards
	then
		card:set_edition(nil, true)
	end
	if G.GAME.modifiers.cry_force_random_edition and area ~= G.pack_cards then
		local edition = Cryptid.poll_random_edition()
		card:set_edition(edition, true)
	end
	if card.ability.consumeable and card.pinned then -- counterpart is in Sticker.toml
		G.GAME.cry_pinned_consumeables = G.GAME.cry_pinned_consumeables + 0
	end


	if G.GAME.mechanics_tagsOnBlind and card.ability.consumeable then
		card:set_edition("e_negative", true)
		card.cost = 3
	end


	if next(find_joker("Cry-topGear")) and card.config.center.rarity == 1 then
		if
			card.ability.name ~= "cry-meteor"
			and card.ability.name ~= "cry-exoplanet"
			and card.ability.name ~= "cry-stardust"
			and card.ability.name ~= "cry-universe"
		then
			card:set_edition("e_polychrome", true, nil, true)
		end
	end
	if card.ability.name == "cry-meteor" then
		card:set_edition("e_foil", true, nil, true)
	end
	if card.ability.name == "cry-exoplanet" then
		card:set_edition("e_holo", true, nil, true)
	end
	if card.ability.name == "cry-stardust" then
		card:set_edition("e_polychrome", true, nil, true)
	end
	if card.ability.name == "cry-universe" then
		card:set_edition("e_cry_astral", true, nil, true)
	end
	-- Certain jokers such as Steel Joker and Driver's License depend on values set
	-- during the update function. Cryptid can create jokers mid-scoring, meaning
	-- those values will be unset during scoring unless update() is manually called.
	card:update(0.016) -- dt is unused in the base game, but we're providing a realistic value anyway
	return card
end

return { name = "Challenges", items = challenges }
