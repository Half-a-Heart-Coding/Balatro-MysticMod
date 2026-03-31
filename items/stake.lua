--These don't use the gameset system currently.
--Will probably add when there's a way to view stakes in the Collection
SMODS.Atlas({
	key = "stickers_hah_stakesAndStuff_balatroMod",
	path = "stickers_hah_stakesAndStuff_balatroMod.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "pogoStakes",
	path = "pogoStakes.png",
	px = 29,
	py = 29,
})
local clown = {
	--golden orange stake
	object_type = "Stake",
	name = "Clown Stake",
	key = "hah_clown",
	pos = { x = 3, y = 1 },
	--atlas = "stake",
	applied_stakes = { "gold" },
	prefix_config = { applied_stakes = { mod = false } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		G.GAME.starting_params.allow_biggerBlinds = true
		--G.GAME.round_resets.blind_choices = {Small = 'bl_small', Big = 'bl_pogoB_fence'}
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	sticker_pos = { x = 0, y = 0 },
	order = 9,
	shiny = false,
	colour = HEX("de7f0b"),
}
local champion = {
	--Champion Stake
	object_type = "Stake",
	name = "Champion Stake",
	key = "hah_champion",
	pos = { x = 4, y = 0 },
	atlas = "pogoStakes",
	applied_stakes = { "hah_clown2" },
	prefix_config = { applied_stakes = { "hah_clown2" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		G.GAME.starting_params.enable_champions = true
		--G.GAME.round_resets.blind_choices = {Small = 'bl_small', Big = 'bl_pogoB_fence'}
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	sticker_pos = { x = 1, y = 1 },
	order = 31,
	shiny = true,
	colour = HEX("ff0000"),
}
local collectionablestake = {
	--hellfire stake
	object_type = "Stake",
	name = "Clown Stake",
	key = "hah_clown3",
	pos = { x = 1, y = 1 },
	--atlas = "stake",
	applied_stakes = { "pogoB_hah_clown2" },
	prefix_config = { applied_stakes = { "pogoB_hah_clown2" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		G.GAME.starting_params.allow_collectionables_aka_shitjokers = true
		--G.GAME.round_resets.blind_choices = {Small = 'bl_small', Big = 'bl_pogoB_fence'}
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	order = 12,
	sticker_pos = { x = 1, y = 0 },
	shiny = true,
	colour = HEX("c93a3a"),
}
local chaos = {
	--clown stake
	object_type = "Stake",
	name = "Chaos Stake",
	key = "hah_clown2",
	pos = { x = 4, y = 1 },
	--pos = { x = 0, y = 1 },
	--atlas = "stake",
	applied_stakes = { "pogoB_hah_clown" },
	prefix_config = { applied_stakes = { "pogoB_hah_clown" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		--G.GAME.starting_params.allow_biggerBlinds = true
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	order = 11,
	shiny = true,
	sticker_pos = { x = 2, y = 0 },
	colour = HEX("c41f46"),
}
local whatTheFuck = {
	--orange but cool stake
	object_type = "Stake",
	name = "Insanity Stake",
	key = "hah_clown4",
	pos = { x = 3, y = 1 },
	--atlas = "stake",
	applied_stakes = { "pogoB_hah_clown6" },
	prefix_config = { applied_stakes = { "pogoB_hah_clown6" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		G.GAME.win_ante = 16
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		--G.GAME.starting_params.allow_biggerBlinds = true
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	order = 13,
	sticker_pos = { x = 3, y = 0 },
	shiny = true,
	colour = HEX("c41f46"),
}
local holyShitManStopIt = {
	--white stake?
	object_type = "Stake",
	name = "Insanity Stake2",
	key = "hah_clown5",
	pos = { x = 0, y = 0 },--how poetic
	--atlas = "stake",
	applied_stakes = { "pogoB_hah_clown4" },
	prefix_config = { applied_stakes = { "pogoB_hah_clown4" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		G.GAME.win_ante = 38
		--G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
		--G.GAME.starting_params.allow_biggerBlinds = true
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	order = 14,
	shiny = true,
	sticker_pos = { x = 0, y = 1 },
	colour = HEX("c41f46"),
}
local noJustNo = {
	--super blue stake
	object_type = "Stake",
	name = "Insanity Stake3",
	key = "hah_clown6",
	pos = { x = 3, y = 0 },
	--atlas = "stake",
	applied_stakes = { "pogoB_hah_clown" },
	prefix_config = { applied_stakes = { "pogoB_hah_clown" } },
	modifiers = function()
		--G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
		--G.GAME.rare_mod = 0
		--G.GAME.uncommon_mod = 0
		--G.GAME.ante = 2
		--G.GAME.round_resets.ante = 2
		--G.GAME.round_resets.blind_ante = 2
		G.GAME.starting_params.enable_delayed = true
		--G.GAME.starting_params.alwaysShowdown = true
		--G.GAME.round_resets.blind_choices.Boss = "bl_pogoB_tumble"
		--G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	order = 10,
	shiny = true,
	sticker_pos = { x = 4, y = 0 },
	colour = HEX("c41f46"),
}
local brown = {
	object_type = "Stake",
	name = "cry-Brown Stake",
	key = "brown",
	pos = { x = 1, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_pink" },
	modifiers = function()
		G.GAME.modifiers.cry_eternal_perishable_compat = true
	end,
	order = 10,
	colour = HEX("883200"),
}
local yellow = {
	object_type = "Stake",
	name = "cry-Yellow Stake",
	key = "yellow",
	pos = { x = 2, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_brown" },
	modifiers = function()
		G.GAME.modifiers.cry_any_stickers = true
	end,
	order = 11,
	colour = HEX("f7ff1f"),
}
local jade = {
	object_type = "Stake",
	name = "cry-Jade Stake",
	key = "jade",
	pos = { x = 3, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_yellow" },
	modifiers = function()
		G.GAME.modifiers.flipped_cards = 20
	end,
	shiny = true,
	order = 12,
	colour = HEX("78953c"),
}
local cyan = {
	object_type = "Stake",
	name = "cry-Cyan Stake",
	key = "cyan",
	pos = { x = 4, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_jade" },
	modifiers = function()
		G.GAME.modifiers.cry_rarer_jokers = true
		-- Note that this is not the exact rarity as the old lovely patch might be nerf/buff to the stake
		G.GAME.uncommon_mod = 0.8
		G.GAME.rare_mod = 0.8
	end,
	order = 13,
	colour = HEX("39ffcc"),
}
local gray = {
	object_type = "Stake",
	name = "cry-Gray Stake",
	key = "gray",
	pos = { x = 0, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_cyan" },
	modifiers = function()
		G.GAME.modifiers.cry_reroll_scaling = 2
	end,
	order = 14,
	colour = HEX("999999"),
}
local crimson = {
	object_type = "Stake",
	name = "cry-Crimson Stake",
	key = "crimson",
	pos = { x = 1, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_gray" },
	modifiers = function()
		G.GAME.modifiers.cry_voucher_restock_antes = 2
	end,
	order = 15,
	colour = HEX("800000"),
}
local diamond = {
	object_type = "Stake",
	name = "cry-Diamond Stake",
	key = "diamond",
	pos = { x = 2, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_crimson" },
	modifiers = function()
		G.GAME.win_ante = 10
	end,
	shiny = true,
	order = 16,
	colour = HEX("88e5d9"),
}
local amber = {
	object_type = "Stake",
	name = "cry-Amber Stake",
	key = "amber",
	pos = { x = 3, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_diamond" },
	modifiers = function()
		G.GAME.modifiers.extra_boosters = -1
	end,
	shiny = true,
	order = 17,
	colour = HEX("feb900"),
}
local bronze = {
	object_type = "Stake",
	name = "cry-Bronze Stake",
	key = "bronze",
	pos = { x = 4, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_amber" },
	modifiers = function()
		G.GAME.modifiers.cry_voucher_price_hike = 1.5
	end,
	shiny = true,
	order = 18,
	colour = HEX("d27c37"),
}
local quartz = {
	object_type = "Stake",
	name = "cry-Quartz Stake",
	key = "quartz",
	pos = { x = 0, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_bronze" },
	modifiers = function()
		G.GAME.modifiers.cry_enable_pinned_in_shop = true
	end,
	shiny = true,
	order = 19,
	colour = HEX("e8e8e8"),
}
local ruby = {
	object_type = "Stake",
	name = "cry-Ruby Stake",
	key = "ruby",
	pos = { x = 1, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_quartz" },
	modifiers = function()
		G.GAME.modifiers.cry_big_boss_rate = 0.3
	end,
	shiny = true,
	order = 20,
	colour = HEX("fc5f55"),
}
local glass = {
	object_type = "Stake",
	name = "cry-Glass Stake",
	key = "glass",
	pos = { x = 2, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_ruby" },
	modifiers = function()
		G.GAME.modifiers.cry_shatter_rate = 30
	end,
	shiny = true,
	order = 21,
	colour = HEX("ffffff8f"),
}
local sapphire = {
	object_type = "Stake",
	name = "cry-Sapphire Stake",
	key = "sapphire",
	pos = { x = 3, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_glass" },
	modifiers = function()
		G.GAME.modifiers.cry_ante_tax = 0.25
		G.GAME.modifiers.cry_ante_tax_max = 10
	end,
	shiny = true,
	order = 22,
	colour = HEX("3551fc"),
}
local emerald = {
	object_type = "Stake",
	name = "cry-Emerald Stake",
	key = "emerald",
	pos = { x = 4, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_sapphire" },
	modifiers = function()
		G.GAME.modifiers.cry_enable_flipped_in_shop = true
	end,
	shiny = true,
	order = 23,
	colour = HEX("06fc2c"),
}
local platinum = {
	object_type = "Stake",
	name = "cry-Platinum Stake",
	key = "platinum",
	pos = { x = 0, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_emerald" },
	modifiers = function()
		G.GAME.modifiers.cry_no_small_blind = true
		G.GAME.round_resets.blind_states["Small"] = "Hide"
	end,
	shiny = true,
	order = 24,
	colour = HEX("b0f6ff"),
}
--init colors so they have references
G.C.CRY_TWILIGHT = { 0, 0, 0, 0 }
G.C.CRY_VERDANT = { 0, 0, 0, 0 }
G.C.CRY_EMBER = { 0, 0, 0, 0 }
G.C.CRY_DAWN = { 0, 0, 0, 0 }
G.C.CRY_HORIZON = { 0, 0, 0, 0 }
G.C.CRY_BLOSSOM = { 0, 0, 0, 0 }
G.C.CRY_AZURE = { 0, 0, 0, 0 }
G.C.CRY_ASCENDANT = { 0, 0, 0, 0 }
local twilight = {
	object_type = "Stake",
	name = "cry-Twilight Stake",
	key = "twilight",
	pos = { x = 1, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_platinum" },
	modifiers = function()
		G.GAME.modifiers.enable_banana = true
	end,
	shiny = true,
	order = 25,
	colour = G.C.CRY_TWILIGHT,
}
local verdant = {
	object_type = "Stake",
	name = "cry-Verdant Stake",
	key = "verdant",
	pos = { x = 2, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_twilight" },
	modifiers = function()
		G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
	end,
	shiny = true,
	order = 26,
	colour = G.C.CRY_VERDANT,
}
local ember = {
	object_type = "Stake",
	name = "cry-Ember Stake",
	key = "ember",
	pos = { x = 3, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_verdant" },
	modifiers = function()
		G.GAME.modifiers.cry_no_sell_value = true
	end,
	shiny = true,
	order = 27,
	colour = G.C.CRY_EMBER,
}
local dawn = {
	object_type = "Stake",
	name = "cry-Dawn Stake",
	key = "dawn",
	pos = { x = 4, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_ember" },
	modifiers = function()
		G.GAME.modifiers.cry_consumable_reduce = true
	end,
	shiny = true,
	order = 28,
	colour = G.C.CRY_DAWN,
}
local horizon = {
	object_type = "Stake",
	name = "cry-Horizon Stake",
	key = "horizon",
	pos = { x = 0, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_dawn" },
	modifiers = function()
		G.GAME.modifiers.cry_card_each_round = true
	end,
	shiny = true,
	order = 29,
	colour = G.C.CRY_HORIZON,
}
local blossom = {
	object_type = "Stake",
	name = "cry-Blossom Stake",
	key = "blossom",
	pos = { x = 1, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_horizon" },
	modifiers = function()
		G.GAME.modifiers.cry_big_showdown = true
	end,
	shiny = true,
	order = 30,
	colour = G.C.CRY_BLOSSOM,
}
local azure = {
	object_type = "Stake",
	name = "cry-Azure Stake",
	key = "azure",
	pos = { x = 2, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_blossom" },
	modifiers = function()
		G.GAME.modifiers.cry_jkr_misprint_mod = 0.8
	end,
	shiny = true,
	order = 31,
	colour = G.C.CRY_AZURE,
}
local ascendant = {
	object_type = "Stake",
	name = "cry-Ascendant Stake",
	key = "ascendant",
	pos = { x = 3, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_azure" },
	modifiers = function()
		change_shop_size(-1)
	end,
	shiny = true,
	order = 32,
	colour = G.C.CRY_ASCENDANT,
}
--local stake_atlas = { object_type = "Atlas", key = "stake", path = "stake_cry.png", px = 29, py = 29 }
return {
	name = "More Stakes",
	init = function(self)
		-- Disallow use of Debuffed Perishable consumables
		-- Overriding Steamodded's registering of Incantation/Familiar/Grim
		for _, v in pairs(self.items) do
			if v.object_type == "Stake" then
				--v.sticker_pos = v.pos
				v.sticker_atlas = "stickers_hah_stakesAndStuff_balatroMod"
			end
		end
	end,
	items = {
		--stake_atlas,
		--pink,
		--brown,
		--yellow,
		--jade,
		--cyan,
		--gray,
		--crimson,
		--diamond,
		--amber,
		--bronze,
		--quartz,
		--ruby,
		--glass,
		--sapphire,
		--emerald,
		--platinum,
		--twilight,
		--verdant,
		--ember,
		--dawn,
		--horizon,
		--blossom,
		--azure,
		--ascendant,
		clown,
		--collectionablestake,
		chaos,
		--whatTheFuck,
		--holyShitManStopIt,
		--noJustNo,
		champion,
	},
}
