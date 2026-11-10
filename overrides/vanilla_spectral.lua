SMODS.Consumable:take_ownership('incantation', {

	config = { extra = { destroy = 1, cards = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards } }
    end,
    use = function(self, card, area, copier)
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'incantation_random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local numbers = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank_key ~= 'Ace' and not rank.face and not rank.is_symbol then table.insert(numbers, rank) end
                    end
                    local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center.key
                        end
                    end
                    local enhancement = SMODS.poll_enhancement { guaranteed = true, options = cen_pool, key = "spe_card" }
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement, key_append = "incantation_card" }
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
}, true)