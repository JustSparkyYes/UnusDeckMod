SMODS.Joker {
    name = "Unus Rules Card",
    key = "unusjoker",
    atlas = 'unus',
    pos = { x = 1, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    attributes = { "booster", "generation", "tag", "boss_blind" },
    add_to_deck = function(self, card, from_debuff)
        if not G.GAME.starting_params.enable_unus then
            setPoolRankFlagEnable('unus_0', true);
            setPoolRankFlagEnable('unus_1', true);
            setPoolRankFlagEnable('unus_skip', true);
            setPoolRankFlagEnable('unus_reverse', true);
            setPoolRankFlagEnable('unus_draw2', true);
            setPoolRankFlagEnable('unus_wildcard', true);
            setPoolRankFlagEnable('unus_draw4', true);
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not G.GAME.starting_params.enable_unus then
            setPoolRankFlagEnable('unus_0', false);
            setPoolRankFlagEnable('unus_1', false);
            setPoolRankFlagEnable('unus_skip', false);
            setPoolRankFlagEnable('unus_reverse', false);
            setPoolRankFlagEnable('unus_draw2', false);
            setPoolRankFlagEnable('unus_wildcard', false);
            setPoolRankFlagEnable('unus_draw4', false);
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    card:juice_up(0.8, 0.8)
                    add_tag({ key = 'tag_standard' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
        end
    end,
}