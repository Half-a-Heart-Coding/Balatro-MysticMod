local blind = {
    loc_txt = {
        name = 'Predictable',
        text = {
            "Debuff all played cards",
            "if less than 5 cards are played",
        }
    },
    pos = {x = 0, y = 10 },
    atlas = 'pogo_chips',
    dollars = 4,
    mult = 1.5,
    big = {min = 1},
    --config = {extra = {odds = 1}},
    boss_colour = HEX('3CA45F'),
}

blind.press_play = function(self)
    if self.disabled then return end
        if next(find_joker("Chicot")) then 
            self.disabled = true
        return end--makes it useful?
    local should_debuff = false
    if #G.hand.highlighted < 5 then
        should_debuff = true
    end
    if should_debuff then
        for _, card in ipairs(G.hand.highlighted) do
            card:set_debuff(true)
            G.GAME.blind:wiggle()
            G.GAME.blind.triggered = true
        end
    end
end

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then return 'Small'
    elseif self.big then return 'Big'
    else return blind_get_type(self) end
end

return blind