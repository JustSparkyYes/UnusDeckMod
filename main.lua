--Unus playing cards atlas
SMODS.Atlas {
    key = "unus_ranks",
    path = "",
    px = 71,
    py = 95
}


local mod_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src")
--Load all lua files
for _, file in ipairs(mod_src) do
    assert(SMODS.load_file("src/" .. file))()
end