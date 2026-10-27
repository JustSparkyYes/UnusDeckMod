local unus = SMODS.current_mod

--Atlas
SMODS.Atlas {
    key = "unus",
    path = "unus.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "unus_standard_lc",
    path = "unus_standard_lc.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "unus_standard_hc",
    path = "unus_standard_hc.png",
    px = 71,
    py = 95
}

--[[
SMODS.Sound({
	key = "reverse",
	path = "reverse.ogg",
})
]]

--Load all lua files
local mod_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src")
for _, file in ipairs(mod_src) do
    assert(SMODS.load_file("src/" .. file))()
end

-- Check if area contains at least 1 card of a given rank
local check_containsRank = function(rank_key, area)
    for _, playing_card in ipairs(area) do
        local key = SMODS.Ranks[playing_card.base.value].key
        if key == rank_key and not playing_card.debuff then
            do return true end
        end
    end
end

-- Special case for playing unus cards
local check_unusPlay = function(card, scoring_hand)
    if SMODS.Ranks[card.base.value].unus_play and not card.debuff then
        for _, playing_card in ipairs(scoring_hand) do
            if (playing_card:is_suit(card.base.suit) or card:is_suit(playing_card.base.suit)) and not playing_card.debuff then
                do return true end
            end
        end
    else return false
    end
end

-- local vars
local unus_drawcounter = 0

unus.calculate = function (self, context)

    -- Special case for playing unus cards
    if context.modify_scoring_hand then
        if check_unusPlay(context.other_card, context.scoring_hand) then
            return {
                add_to_hand = true
            }
        end
        if SMODS.Ranks[context.other_card.base.value].always_scored then
            return {
                add_to_hand = true
            }
        end

        --Allow aces to form 2-A-0 straights, jank atm
        if SMODS.Ranks[context.other_card.base.value].key == 'Ace' then
            if check_containsRank('unus_0', context.full_hand)
                and not (check_containsRank('King', context.scoring_hand) and SMODS.wrap_around_straight) then
                SMODS.Ranks[context.other_card.base.value].straight_edge = false
            else
                SMODS.Ranks[context.other_card.base.value].straight_edge = true
            end
        end
    end

    if context.individual and context.cardarea == G.play then
        -- Draw
        if SMODS.Ranks[context.other_card.base.value].key == 'unus_draw2' then
            unus_drawcounter = unus_drawcounter + 2
            return {
                message = "Draw +2!"
            }
        end
        if SMODS.Ranks[context.other_card.base.value].key == 'unus_draw4' then
            unus_drawcounter = unus_drawcounter + 4
            return {
                message = "Draw +4!"
            }
        end
        -- Reverse
        if SMODS.Ranks[context.other_card.base.value].key == 'unus_reverse' then
            --play_sound('unus_reverse')
            return {
                message = "Reverse!",
                swap = true,
                no_juice = true
            }
        end
    end

    -- Debuffs hand when skip is selected
    if context.debuff_hand then
        if check_containsRank('unus_skip', context.scoring_hand) then
            --play_sound('timpani')
            return {
                debuff = true,
                debuff_text = "Skip will trigger!",
            }
        end
    end

    -- Gives hand back when skipping
    if context.debuffed_hand and check_containsRank('unus_skip', context.scoring_hand) then
        ease_hands_played(1)
        return{
            message = 'Skipped!',
            colour = G.C.RED
        }
    end

    -- Handle extra draws, reset counter
    if context.drawing_cards and unus_drawcounter ~= 0 and (G.GAME.current_round.hands_played ~= 0) then
        local new_draw = context.amount + unus_drawcounter
        unus_drawcounter = 0
        return {
            cards_to_draw = new_draw
        }
    end
    -- Reset draw counter at end of round
    if context.end_of_round and unus_drawcounter ~= 0 then
        unus_drawcounter = 0
    end
end

-- temporary solution for wild cards
local unus_smeared_hook = SMODS.smeared_check
function SMODS.smeared_check(card, suit, ...)
    if SMODS.Ranks[card.base.value].is_wild then
        return true
    end
    return unus_smeared_hook(card, suit, ...)
end

--[[
SMODS.Joker {
    name = "Unus Rules Card",
    key = "unusjoker",
    atlas = 'unus',
    pos = { x = 0, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    attributes = { "passive", "booster" }
}
]]