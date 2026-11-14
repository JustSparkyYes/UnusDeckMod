local unus = SMODS.current_mod
local unus_config = unus.config

--Global Table
unus_global = {}
unus_global.config = unus.config


--Config
function unus.save_config(self)
    SMODS.save_mod_config(self)
end

local unus_config_tab = function()
	return{--[[ Extra tab for any future settings
		{
		label = "Style",
		chosen = true,
		tab_definition_function = function()
		return {
			n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 7,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = {
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = "Nothing's here...", colour = G.C.ORANGE, scale = 0.5}}}},
                    {n=G.UIT.R, config={align = "cl"}, nodes={
						create_toggle({label = "useless toggle"})
					}}
				}
            }
		end
		},]]
        {
		label = localize("unus_config_tab_options"),
		chosen = true,
		tab_definition_function = function()
		return {
			n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 8,
					r = 0.1,
					minw = 7,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = {
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_header_1"), colour = G.C.ORANGE, scale = 0.5}}}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_header_2"), colour = G.C.ORANGE, scale = 0.5}}}},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
						create_toggle({label = localize("unus_config_joker"), ref_table = unus.config, ref_value = 'joker', callback = function() unus:save_config() end}),
					}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_joker_desc"), colour = G.C.WHITE, scale = 0.25}}}},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
						create_toggle({label = localize("unus_config_reverse"), ref_table = unus.config, ref_value = 'reverse', callback = function() unus:save_config() end}),
					}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_reverse_desc"), colour = G.C.WHITE, scale = 0.25}}}},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
						create_toggle({label = localize("unus_config_j_num"), ref_table = unus.config, ref_value = 'j_num', callback = function() unus:save_config() end}),
					}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_j_num_desc_1"), colour = G.C.WHITE, scale = 0.25}}}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_j_num_desc_2"), colour = G.C.WHITE, scale = 0.25}}}},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
						create_toggle({label = localize("unus_config_j_rand"), ref_table = unus.config, ref_value = 'j_rand', callback = function() unus:save_config() end}),
					}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_j_rand_desc"), colour = G.C.WHITE, scale = 0.25}}}},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
						create_toggle({label = localize("unus_config_spec_incant"), ref_table = unus.config, ref_value = 'spec_incant', callback = function() unus:save_config() end}),
					}},
					{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unus_config_spec_incant_desc"), colour = G.C.WHITE, scale = 0.25}}}},
				}
            }
		end
		}
	}
end

unus.extra_tabs = unus_config_tab
unus.config_tab = true

--Map config value with a single string keyword
local config_value = {
    ["joker"] = unus_config.joker,
    ["reverse"] = unus_config.reverse,
    ["j_num"] = unus_config.j_num,
    ["j_rand"] = unus_config.j_rand,
    ["spec_incant"] = unus_config.spec_incant,
    ["loaded"] = unus_config.loaded,
}
-- Initiate default settings
if not unus_config.loaded then
    unus_config.joker = true
    unus_config.reverse = false
    unus_config.j_num = true
    unus_config.j_rand = true
    unus_config.spec_incant = true
    unus_config.loaded = true
end
unus_global.reverse = unus_config.reverse

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
SMODS.Atlas {
    key = "unus_ui_lc",
    path = "ui_lc.png",
    px = 18,
    py = 18
}
SMODS.Atlas {
    key = "unus_ui_hc",
    path = "ui_hc.png",
    px = 18,
    py = 18
}

--SFX
SMODS.Sound({
	key = "reverse",
	path = "reverse.ogg",
})

--Load all lua files
assert(SMODS.load_file("src/ranks.lua"))()
assert(SMODS.load_file("src/deck.lua"))()

if unus_config.joker then
    assert(SMODS.load_file("src/joker.lua"))()
end
if unus_config.j_num then
    assert(SMODS.load_file("overrides/vanilla_joker_num.lua"))()
end
if unus_config.j_rand then
    assert(SMODS.load_file("overrides/vanilla_joker_idol.lua"))()
end
if unus_config.spec_incant then
    assert(SMODS.load_file("overrides/vanilla_spectral.lua"))()
end


-- Check if area contains at least 1 playing card with "skip" config
local check_skip = function(area)
    for _, playing_card in ipairs(area) do
        if SMODS.Ranks[playing_card.base.value].config and SMODS.Ranks[playing_card.base.value].config.extras 
        and SMODS.Ranks[playing_card.base.value].config.extras.skip and not playing_card.debuff then
            do return playing_card end
        end
    end
end

-- Unus Play condition
local check_unusPlay = function(card, scoring_hand, full_hand)
    if SMODS.Ranks[card.base.value].unus_play and not card.debuff then
        for _, playing_card in ipairs(scoring_hand) do
            if (playing_card:is_suit(card.base.suit) or card:is_suit(playing_card.base.suit)) then
                do return true end
            end
        end
        -- Check for wild cards
        for _, playing_card in ipairs(full_hand) do
            if (playing_card.config.center.key == "m_wild" or SMODS.Ranks[playing_card.base.value].is_wild) and (SMODS.Ranks[playing_card.base.value].always_scored or SMODS.Ranks[playing_card.base.value].unus_play) then
                do return true end
            end
        end
    else return false
    end
end


-- Calculate function handles Unus card effects.
unus.drawcounter = 0
unus.skipCheck = false
unus.calculate = function (self, context)

    if context.modify_scoring_hand then
        -- Always scored tag
        if SMODS.Ranks[context.other_card.base.value].always_scored then
            return {
                add_to_hand = true
            }
        end
        -- Unus Play condition
        if SMODS.Ranks[context.other_card.base.value].unus_play and check_unusPlay(context.other_card, context.scoring_hand, context.full_hand) then
            return {
                add_to_hand = true
            }
        end
    end

    if context.individual and context.cardarea == G.play then
        -- Draws
        if SMODS.Ranks[context.other_card.base.value].config and SMODS.Ranks[context.other_card.base.value].config.extras and SMODS.Ranks[context.other_card.base.value].config.extras.card_draw then
            local draws = SMODS.Ranks[context.other_card.base.value].config.extras.card_draw
            unus.drawcounter = unus.drawcounter + draws
            return {
                message = localize({type = "variable", key = "k_unus_draw", vars = { draws } }),
            }
        end
        -- Reverse
        if SMODS.Ranks[context.other_card.base.value].config and SMODS.Ranks[context.other_card.base.value].config.extras and SMODS.Ranks[context.other_card.base.value].config.extras.reverse then
            if unus_config.reverse then
                return {
                    swap = true,

                    message = localize("k_unus_reverse"),
                    colour = G.C.PURPLE,
                    remove_default_message = true,
                    sound = 'unus_reverse',
                    pitch = 1.64,
                }
            else
                local reverses = SMODS.Ranks[context.other_card.base.value].config.extras.reverse
                return {
                    mult = reverses,
                    chips = -reverses,

                    message = localize("k_unus_reverse"),
                    colour = G.C.PURPLE,
                    remove_default_message = true,
                    sound = 'unus_reverse',
                    pitch = 1.64,
                }
            end
        end
    end

    -- Debuffs hand when Skip is in scoring hand
    if context.debuff_hand then
        if not G.GAME.blind.triggered then
            if check_skip(context.scoring_hand) then
                if not unus.skipCheck then
                    play_sound('timpani')
                    unus.skipCheck = true
                    check_skip(context.scoring_hand):juice_up()
                end
                return {
                    debuff = true,
                    debuff_text = localize("k_unus_skip_text"),
                }
            else
                unus.skipCheck = false
                return {
                    debuff = false
                }
            end
        else
            unus.skipCheck = false
        end
    end

    -- Handle extra draws, reset counter
    if context.drawing_cards and unus.drawcounter ~= 0 and (G.GAME.current_round.hands_played ~= 0) then
        local new_draw = context.amount + unus.drawcounter
        unus.drawcounter = 0
        return {
            cards_to_draw = new_draw
        }
    end

    -- Reset draw counter at end of round
    if context.end_of_round and unus.drawcounter ~= 0 then
        unus.drawcounter = 0
    end

    -- Force wild suit on wildcards when attempting to convert
    if context.change_suit and context.other_card and SMODS.Ranks[context.other_card.base.value].is_wild and context.new_suit ~= 'unus_Wilds' then
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_base(context.other_card, 'unus_Wilds')
                context.other_card:set_sprites(nil, context.other_card.config.card)
                return true
            end
        }))
    end
    -- Force wildcards from standard packs to be wilds suit
    if context.modify_booster_card then
        if context.booster.ability.name:find('Standard') and SMODS.Ranks[context.card.base.value].key then
            if SMODS.Ranks[context.card.base.value].is_wild then
                SMODS.change_base(context.card, 'unus_Wilds')
            end
        end
    end
    -- Force wildcards from Magic Trick to be wilds suit
    if context.modify_shop_card then
        if context.card and context.card.base and context.card.base.value and SMODS.Ranks[context.card.base.value].key and SMODS.Ranks[context.card.base.value].is_wild then
            SMODS.change_base(context.card, 'unus_Wilds')
        end
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