local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table(vars_only)
    local generate_UIBox_ability_table_val = generate_UIBox_ability_table_ref(self, vars_only)

    if generate_UIBox_ability_table_val == nil then
        return
    end

    if self.ability and self.ability.set and self.ability.set == 'Joker' and (self.area and (self.area == G.shop_jokers or self.area == G.pack_cards)) then
        local main_text = generate_UIBox_ability_table_val.main
        main_text[#main_text + 1] = {
            {
                n = G.UIT.T,
                config = {
                    text = "Sell Value: ",
                    colour = G.C.GREY,
                    scale = 0.32
                }
            },
            {
                n = G.UIT.T,
                config = {
                    text = "$" .. self.sell_cost,
                    colour = G.C.MONEY,
                    scale = 0.32
                }
            }
        }
    end

    return generate_UIBox_ability_table_val
end

SMODS.Atlas { -- modicon
    key = 'modicon',
    px = 34,
    py = 34,
    path = 'modicon.png'
}

