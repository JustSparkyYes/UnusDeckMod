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
    strength_effect = { fixed = 2, random = false},
    next = { 'Ace', 'unus_1' },
    straight_edge = true,
    is_unus = true
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
    is_unus = true
}
-- Skip
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",
    
    key = 'skip',
    card_key = 'S',
    shorthand = "Sk",
    pos = { x = 2 },
    nominal = 0,
    face_nominal = 0.3,
    next = { 'unus_0' },
    is_unus = true,
    unus_play = true
}
-- Reverse
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    key = 'reverse',
    card_key = 'R',
    shorthand = "Rv",
    pos = { x = 3 },
    nominal = 0,
    face_nominal = 0.2,
    next = { 'unus_0' },
    is_unus = true,
    unus_play = true
}
-- Draw 2
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_hc",

    key = 'draw2',
    card_key = 'D',
    shorthand = "+2",
    pos = { x = 4 },
    nominal = 0,
    face_nominal = 0.1,
    next = { 'unus_0' },
    is_unus = true,
    unus_play = true
}
-- Wild Card
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_lc",

    key = 'wildcard',
    card_key = 'W',
    shorthand = "W",
    pos = { x = 0 },
    suit_map = { Hearts = 4, Clubs = 4, Diamonds = 4, Spades = 4 },
    nominal = 0,
    face_nominal = 0.02,
    next = { 'unus_0' },
    is_unus = true,
    is_wild = true,
    always_scored = true
}
-- Wild Draw 4
SMODS.Rank {
    lc_atlas = "unus_standard_lc",
    hc_atlas = "unus_standard_lc",

    key = 'draw4',
    card_key = 'F',
    shorthand = "+4",
    pos = { x = 1 },
    suit_map = { Hearts = 4, Clubs = 4, Diamonds = 4, Spades = 4 },
    nominal = 0,
    face_nominal = 0.01,
    next = { 'unus_0' },
    is_unus = true,
    is_wild = true,
    always_scored = true
}