function setPoolRankFlagEnable(rank, isEnable)
	if not G.GAME or G.GAME.pool_flags[rank] == isEnable then return end
	G.GAME.pool_flags[rank] = isEnable
end

function getPoolRankFlagEnable(rank)
	return (G.GAME and G.GAME.pool_flags[rank] or false)
end
local function unus_rankCheck(self, args)
	return getPoolRankFlagEnable(self.key)
end

-- Wild suit for wild cards
SMODS.Suit {
    key = 'Wilds',
    card_key = 'W',
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",
    pos = { y = 3 },
    lc_ui_atlas = 'unus_ui_lc',
    hc_ui_atlas = 'unus_ui_hc',
    ui_pos = { x = 0, y = 1 },
    lc_colour = HEX('7276CF'),
    hc_colour = HEX('7276CF'),
    no_mod_badges = true,

    in_pool = function () return false end
}

-- Zero
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    key = '0',
    card_key = '0',
    shorthand = "0",
    pos = { x = 0 },
    nominal = 0,
    face_nominal = 0.99,
    strength_effect = { fixed = 2, random = false },
    next = { 'Ace', 'unus_1' },
    no_mod_badges = true,

    straight_edge = true,
    loc_desc = true,

    in_pool = unus_rankCheck,
}
-- One
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    key = '1',
    card_key = '1',
    shorthand = "1",
    pos = { x = 1 },
    nominal = 1,
    next = { '2' },
    no_mod_badges = true,

    in_pool = unus_rankCheck,
}
-- Skip
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",
    
    config = {
        extras = { skip = true }
    },
    
    key = 'skip',
    card_key = 'S',
    shorthand = "Sk",
    pos = { x = 2 },
    nominal = 0,
    face_nominal = 0.3,
    strength_effect = { ignore = true },
    next = {},
    no_mod_badges = true,

    loc_desc = true,
    unus_play = true,
    is_symbol = true,
    idol_ban = true,

    in_pool = unus_rankCheck,
}
-- Reverse
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    config = {
        extras = { reverse = 8 }
    },

    key = 'reverse',
    card_key = 'R',
    shorthand = "Rv",
    pos = { x = 3 },
    nominal = 0,
    face_nominal = 0.2,
    strength_effect = { ignore = true },
    next = {},
    no_mod_badges = true,

    loc_desc = true,
    unus_play = true,
    is_symbol = true,

    in_pool = unus_rankCheck,
}
-- Draw 2
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    config = {
        extras = { card_draw = 2 }
    },

    key = 'draw2',
    card_key = 'D',
    shorthand = "+2",
    pos = { x = 4 },
    nominal = 0,
    face_nominal = 0.1,
    strength_effect = { ignore = true },
    next = {},
    no_mod_badges = true,

    loc_desc = true,
    unus_play = true,
    is_symbol = true,

    in_pool = unus_rankCheck,
}
-- Wild Card
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    key = 'wildcard',
    card_key = 'W',
    shorthand = "W",
    pos = { x = 0 },
    suit_map = { Hearts = 4, Clubs = 4, Diamonds = 4, Spades = 4, unus_Wilds = 4 },
    nominal = 0,
    face_nominal = 0.02,
    strength_effect = { ignore = true },
    next = {},
    no_mod_badges = true,

    loc_desc = true,
    is_wild = true,
    always_scored = true,
    is_symbol = true,
    suit_first_loc = true,

    in_pool = unus_rankCheck,
}
-- Wild Draw 4
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    config = {
        extras = { card_draw = 4 }
    },

    key = 'draw4',
    card_key = 'F',
    shorthand = "+4",
    pos = { x = 1 },
    suit_map = { Hearts = 4, Clubs = 4, Diamonds = 4, Spades = 4, unus_Wilds = 4 },
    nominal = 0,
    face_nominal = 0.01,
    strength_effect = { ignore = true },
    next = {},
    no_mod_badges = true,

    loc_desc = true,
    is_wild = true,
    always_scored = true,
    is_symbol = true,
    suit_first_loc = true,

    in_pool = unus_rankCheck,
}