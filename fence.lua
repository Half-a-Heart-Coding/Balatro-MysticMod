local blind = {
    loc_txt = {
        name = 'Hurdle',
        text = {
            "Bigger Blind",
            --"{C:inactive,s:0.8}Mini-Boss Blind{}",
        }
    },
    pos = {x = 0, y = 11 },
    atlas = 'pogo_chips',
    dollars = 4,
    mult = 2,
    big = {min = 1},
    --boss = {min = 99999},
    boss_colour = HEX('B17057'),
    set_blind = function(self, reset, silent)
        if self.disabled or next(find_joker("Chicot")) then--makes it useful?
            G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling * 1.5
		    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            self.disabled = true
            return end
    --    for _, card in ipairs(G.jokers.cards) do
    --        card:set_debuff(true)
    --        card:juice_up()
    --    end
    --    --G.GAME.blind:wiggle()
    --    G.GAME.blind.prepped = false
    --end,
    --press_play = function(self)
    --    G.GAME.blind.prepped = true
    end,
    disable = function(self, silent)
		G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling * 1.5
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
    --defeat = function(self, silent)
    --    if self.disabled then return end
    --    for _, card in ipairs(G.jokers.cards) do
    --        card:set_debuff(false)
     --   end
    --end,

    --in_pool = function()
	--	return not G.GAME.modifiers.hah_666
	--end,

    --debuff_card = function(self, card, from_blind)
    --    if card.area == G.jokers then
    --        if card then
    --            card:juice_up()
    --            G.GAME.blind:wiggle()
    --            return true
    --        else
    --            return false
    --        end
    --    end
    --end,
    --drawn_to_hand = function(self)
--end
}

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then return 'Small'
    elseif self.big then return 'Big'
    else return blind_get_type(self) end
end

return blind