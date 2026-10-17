SMODS.Rank {
    key = '1',
    lc_atlas = "unus_ranks",
    hc_atlas = "unus_ranks",
    card_key = '1',
    shorthand = "1",
    pos = { x = 0 },
    nominal = 1,
    next = { '2' },
    loc_txt = {
        name = "1",
    },
}

SMODS.Rank {
    key = '0',
    lc_atlas = "unus_ranks",
    hc_atlas = "unus_ranks",
    card_key = '0',
    shorthand = "0",
    pos = { x = 1 },
    nominal = 0,
    face_nominal = 0.4,
    next = { 'unus_1' },
    loc_txt = {
        name = "0",
    },
}

SMODS.Rank {
    key = 'Skip',
    lc_atlas = "unus_ranks",
    hc_atlas = "unus_ranks",
    card_key = 'S',
    shorthand = "Skip",
    pos = { x = 2 },
    nominal = 0,
    face_nominal = 0.3,
    next = { 'Ace' },
    loc_txt = {
        name = "Skip",
        text = {
            "If scoring or shares a suit with a scoring card:",
            "Immediately discard",
            "without scoring or",
            "spending a hand."
        }
    },
}

SMODS.Rank {
    key = 'Reverse',
    lc_atlas = "unus_ranks",
    hc_atlas = "unus_ranks",
    card_key = 'R',
    shorthand = "Rev",
    pos = { x = 3 },
    nominal = 0,
    face_nominal = 0.2,
    next = { 'Ace' },
    loc_txt = {
        name = "Reverse",
        text = {
            "If scoring or shares a suit with a scoring card:",
            "Swap Chips and Mult"
        }
    },
}

SMODS.Rank {
    key = 'Draw2',
    lc_atlas = "unus_ranks",
    hc_atlas = "unus_ranks",
    card_key = 'D',
    shorthand = "+2",
    pos = { x = 4 },
    nominal = 0,
    face_nominal = 0.1,
    next = { 'Ace' },
    loc_txt = {
        name = "Draw 2",
        text = {
            "If scoring or shares a suit with a scoring card:",
            "+2 hand size next turn"
        }
    },
}