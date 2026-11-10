SMODS.Back {
    key = "unus",
    atlas = "unus",
    pos = { x = 0, y = 0 },
    config = { hand_size = -1 },
    unlocked = true,
    initial_deck= {
        ranks = {'2', '3', '4', '5', '6', '7', '8', '9', 'unus_0', 'unus_1', 'unus_skip', 'unus_reverse', 'unus_draw2'}
    },
    apply = function(self, back)
        G.GAME.starting_params.enable_unus = true

        setPoolRankFlagEnable('unus_0', true);
        setPoolRankFlagEnable('unus_1', true);
        setPoolRankFlagEnable('unus_skip', true);
        setPoolRankFlagEnable('unus_reverse', true);
        setPoolRankFlagEnable('unus_draw2', true);
        setPoolRankFlagEnable('unus_wildcard', true);
        setPoolRankFlagEnable('unus_draw4', true);

        G.E_MANAGER:add_event(Event({
            func = function()
                --Manually add in wild cards
                for i = 1, 3 do
                    SMODS.add_card({ set = "Base", rank = 'unus_wildcard', suit = 'unus_Wilds', area = G.deck, immediate = true })
                end
                SMODS.add_card({ set = "Base", rank = 'unus_draw4', suit = 'unus_Wilds', area = G.deck, immediate = true })

                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hand_size } }
    end
}