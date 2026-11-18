SMODS.Atlas {
    key = "sleeve",
    path = "sleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "unus",
    name = "Unus Sleeve",
    atlas = "sleeve",
    pos = { x = 0, y = 0 },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_unus_unus" then
            key = self.key .. "_alt"
            self.config = { unus_real = true }
        else
            if self.get_current_deck_key() == "b_erratic" then
                self.config = { hand_size = -1, unus_erratic = true }
            else
                self.config = { hand_size = -1 }
            end

            key = self.key
        end
        return { key = key, vars = { self.config.hand_size } }
    end,
    apply = function(self, back)
        G.GAME.starting_params.enable_unus = true

        -- Add to starting deck
        setPoolRankFlagEnable('unus_skip', true);
        setPoolRankFlagEnable('unus_reverse', true);
        setPoolRankFlagEnable('unus_draw2', true);

        if self.config.unus_real then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Duplicate deck
                    local og_size = #G.playing_cards
                    for i = 1, og_size do -- playing_card in ipairs(G.playing_cards)
                        local rank = SMODS.Ranks[G.playing_cards[i].base.value].key
                        local suit = SMODS.Suits[G.playing_cards[i].base.suit].key
                        if rank ~= 'unus_0' and rank ~= 'unus_wildcard' and rank ~= 'unus_draw4' then
                            SMODS.add_card({ set = "Base", rank = rank, suit = suit, area = G.deck, immediate = true })
                        end
                    end

                    --Manually add in wild cards, 4 and 4 total
                    SMODS.add_card({ set = "Base", rank = 'unus_wildcard', suit = 'unus_Wilds', area = G.deck, immediate = true })
                    for i = 1, 3 do
                        SMODS.add_card({ set = "Base", rank = 'unus_draw4', suit = 'unus_Wilds', area = G.deck, immediate = true })
                    end
                    
                    G.GAME.starting_deck_size = #G.playing_cards

                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.GAME.starting_params.erratic_suits_and_ranks then
                        --Manually add in wild cards
                        for i = 1, 3 do
                            SMODS.add_card({ set = "Base", rank = 'unus_wildcard', suit = 'unus_Wilds', area = G.deck, immediate = true })
                        end
                        SMODS.add_card({ set = "Base", rank = 'unus_draw4', suit = 'unus_Wilds', area = G.deck, immediate = true })
                    else
                        --For Erratic Deck
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
                    setPoolRankFlagEnable('unus_0', true);
                    setPoolRankFlagEnable('unus_1', true);
                    setPoolRankFlagEnable('unus_wildcard', true);
                    setPoolRankFlagEnable('unus_draw4', true);

                    return true
                end,
                
            }))
        end

        CardSleeves.Sleeve.apply(self, sleeve)
    end,
}