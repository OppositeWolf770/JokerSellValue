--- STEAMODDED HEADER
--- MOD_NAME: JokerSellValue
--- MOD_ID: JokerSellValue
--- MOD_AUTHOR: [OppositeWolf770]
--- MOD_DESCRIPTION: Makes all joker cards show their sell value in the hover text while they are in the Buffoon Pack


local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local generate_UIBox_ability_table_val = generate_UIBox_ability_table_ref(self)

    if self.area == G.pack_cards and self.ability and self.ability.set == 'Joker' then
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