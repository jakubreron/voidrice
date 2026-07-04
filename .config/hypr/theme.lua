-- Gruvbox Dark Medium
local yellowA = "0xeefabd2f"
-- local orangeA = "0xeefe8019"
local bg1A = "0xee3c3836"

hl.config({
	general = {
		col = {
			-- NOTE: was animating for some reason
			-- active_border = { colors = { yellowA, orangeA }, angle = 90 },
			active_border = { colors = { yellowA }, angle = 90 },
			inactive_border = bg1A,
		},
	},
})
