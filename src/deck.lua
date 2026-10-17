SMODS.Back {
    key = "unus",
    pos = { x = 0, y = 4 },
    config = { hand_size = -1, no_faces = true },
    loc_txt = {
        name = "Unus Deck",
        text = {
            "Alternate starting deck",
            "Unus cards may appear",
            "in Standard Packs",
            "{C:red}#1#{} hand size"
        }
    },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hand_size } }
    end
}