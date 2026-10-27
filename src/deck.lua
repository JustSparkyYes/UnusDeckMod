SMODS.Back {
    key = "unus",
    atlas = "unus",
    pos = { x = 1, y = 0 },
    config = { hand_size = -1 },
    unlocked = true,
    initial_deck= {
        ranks = {'2', '3', '4', '5', '6', '7', '8', '9', 'unus_0', 'unus_1', 'unus_skip', 'unus_reverse', 'unus_draw2'}
    },
    apply = function(self, back)
        G.GAME.starting_params.unus_start = true

        G.E_MANAGER:add_event(Event({
            func = function()
                --Manually add in wild cards
                for i = 1, 3 do
                    SMODS.add_card({ set = "Base", rank = 'unus_wildcard', suit = 'Diamonds', area = G.deck, immediate = true })
                end
                SMODS.add_card({ set = "Base", rank = 'unus_draw4', suit = 'Diamonds', area = G.deck, immediate = true })

                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hand_size } }
    end
}