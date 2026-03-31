local blind = {
    loc_txt = {
        name = 'Balance',
        text = {
            "-1 hand",
            "-1 discard",
        }
    },
    pos = {x = 0, y = 14 },
    atlas = 'pogo_chips',
    dollars = 4,
    mult = 1.5,
    big = {min = 3},--this one is a little harder than the others
    set_blind = function(self, reset, silent)
        if self.disabled then return end
        if next(find_joker("Chicot")) then 
            self.disabled = true
        return end--makes it useful?
        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 1
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 1
    end,
    disable = function(self)
        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
    end,
    defeat = function(self, silent)
        if self.disabled then return end
        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
    end,
    boss_colour = HEX('B85D61'),
    --press_play = function(self)
    --    if self.disabled then return end
    --    G.E_MANAGER:add_event(Event({ func = function()
    --        local any_selected = nil
    --        for i = 2, #G.play.cards do
    --                G.play.cards[i]:start_dissolve()
    --                --G.hand:add_to_highlighted(G.hand.cards[i], true)
    --                --table.remove(_cards, card_key)
    --                --any_selected = true
    --                --play_sound('card1', 1)
    --        end
    --    return true end })) 
    --    self.triggered = true
    --    G.GAME.blind:wiggle()
    --    delay(0.7)
    --end
}

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then return 'Small'
    elseif self.big then return 'Big'
    else return blind_get_type(self) end
end

return blind
