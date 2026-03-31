local blind = {
    loc_txt = {
        name = 'Shackles',
        text = {
            "-1 hand size",
        }
    },
    pos = {x = 0, y = 17 },
    atlas = 'pogo_chips',
    boss_colour = HEX('303030'), 
    dollars = 4,
    mult = 1,
    big = {min = 1},
    set_blind = function(self, reset, silent)
        if next(find_joker("Chicot")) then 
            self.disabled = true
        end--makes it useful?
        if self.disabled then return end
        G.hand:change_size(-1)
    end,
    disable = function(self)
        G.hand:change_size(1)
    end,
    defeat = function(self, silent)
        if self.disabled or next(find_joker("Chicot")) then return end
        G.hand:change_size(1)
    end,
}

--this has to be in each one, and I dont know why
local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then return 'Small'
    elseif self.big then return 'Big'
    else return blind_get_type(self) end
end

return blind