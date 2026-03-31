local blind = {
    loc_txt = {
        name = 'Steel',
        text = {
            "0.75x base chips and mult",
        }
    },
    config = {extra = {odds = chance_to}},
    pos = {x = 0, y = 2 },
    atlas = 'pogo_chips',
    dollars = 4,
    mult = 1.5,
    big = { min = 1 },
    boss_colour = HEX('009ECC'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if G.GAME.blind.disabled then return mult, hand_chips, false end
        hand_chips = hand_chips * 0.75
        mult = mult * 0.75
            G.GAME.blind.triggered = true
            G.GAME.blind:wiggle()
            if G.GAME.blind.triggered == true then
                return mult, hand_chips, true
            end
        return mult, hand_chips, false
    end
}

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then return 'Small'
    elseif self.big then return 'Big'
    else return blind_get_type(self) end
end

return blind
