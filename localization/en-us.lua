return {
    descriptions = {
        Back = {
            b_unus_unus = {
                name = "Unus Deck",
                text = {
                    "Alternate deck",
                    "{C:red}Unus{} cards may appear",
                    "in {C:attention}Standard Packs{}",
                    "{C:red}#1#{} hand size"
                }
            }
        },
        Joker = {
            j_unus_unusjoker = {
                name = "Unus Rules Card",
                text = {
                    "{C:red}Unus{} cards may appear",
                    "in {C:attention}Standard Packs{}.",
                    "Get a {C:attention}Standard Tag{} when",
                    "{C:attention}Boss Blind{} is defeated",
                }
            },

            -- Vanilla jokers
            j_fibonacci_ex = {
				name = "Fibonacci",
				text = {
					"Each played {C:attention}Ace{}, {C:attention}0{}, {C:attention}1{},",
					"{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{} gives",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
            j_even_steven_ex = {
                name = "Even Steven",
                text = {
                    "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored",
                    "{C:inactive}(10, 8, 6, 4, 2, 0)",
                },
            },
            j_odd_todd_ex = {
                name = "Odd Todd",
                text = {
                    "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored",
                    "{C:inactive}(A, 9, 7, 5, 3, 1)",
                },
            },
            j_hack_ex = {
                name = "Hack",
                text = {
                    "Retrigger",
                    "each played",
                    "{C:attention}0{}, {C:attention}1{}, {C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{}",
                },
            }
        },
        Other = {
            unus_skip_ability = {
                text = {
                    "Cancel and discard hand",
                    "without scoring.",
                    "Gain {C:blue}+1{} Hand back.",
                    "{s:0.8}Also plays if a scoring{}",
                    "{s:0.8}card has same suit.{}",
                }
            },
            unus_reverse_ability = {
                text = {
                    "{C:red}-8{} Chips and {C:mult}+8{} Mult",
                    "{s:0.8}Also plays if a scoring{}",
                    "{s:0.8}card has same suit.{}",
                }
            },
            unus_draw2_ability = {
                text = {
                    "Draw {C:attention}+2{} cards",
                    "{s:0.8}Also plays if a scoring{}",
                    "{s:0.8}card has same suit.{}",
                }
            },
            unus_0_ability = {
                text = {
                    "Scores no chips"
                }
            },
            unus_wildcard_ability = {
                text = {
                    "Can be used",
                    "as any suit",
                    "Always scores",
                }
            },
            unus_draw4_ability = {
                text = {
                    "Can be used",
                    "as any suit",
                    "Always scores",
                    "Draw {C:attention}+4{} cards"
                }
            },
            playing_card_ex = {
                text={
                    "{V:1}#2# {C:light_black}#1#",
                },
            }
        }
    },
    misc = {
        ranks = {
            unus_0 = "0",
            unus_1 = "1",
            unus_skip = "Skip",
            unus_reverse = "Reverse",
            unus_draw2 = "Draw 2",
            unus_wildcard = "Card",
            unus_draw4 = "Draw 4",
        },
        suits_plural = {
            unus_Wilds = "Wilds",
        },
        suits_singular = {
            unus_Wilds = "Wild",
        },
        dictionary = {
            k_unus_draw2 = "Draw +2!",
            k_unus_draw4 = "Draw +4!",
            k_unus_reverse = "Reverse!",
            k_unus_skip = "Skipped!",
            k_unus_skip_text = "Skip will trigger!",
        }
    },
}