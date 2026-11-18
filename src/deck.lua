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

        G.E_MANAGER:add_event(Event({
            func = function()
                if not G.GAME.starting_params.erratic_suits_and_ranks then
                        --Manually add in wild cards
                        for i = 1, 3 do
                            SMODS.add_card({ set = "Base", rank = 'unus_wildcard', suit = 'unus_Wilds', area = G.deck, immediate = true })
                        end
                        SMODS.add_card({ set = "Base", rank = 'unus_draw4', suit = 'unus_Wilds', area = G.deck, immediate = true })
                else
                    --For Erratic Sleeve
                    for i = 1, 4 do
                        SMODS.add_card({ set = "Base", area = G.deck, immediate = true })
                    end
                    for _, playing_card in ipairs(G.playing_cards) do
                        local rand = math.random(#G.playing_cards)
                        if rand <= 2 then
                                assert(SMODS.change_base(playing_card, 'unus_Wilds', 'unus_wildcard'))
                        else
                            if rand <= 4 then
                                assert(SMODS.change_base(playing_card, 'unus_Wilds', 'unus_draw4'))
                            end
                        end
                    end
                end

                G.GAME.starting_deck_size = #G.playing_cards
                
                --Add these back into the pool after the deck is finished
                setPoolRankFlagEnable('unus_wildcard', true);
                setPoolRankFlagEnable('unus_draw4', true);

                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hand_size } }
    end
}