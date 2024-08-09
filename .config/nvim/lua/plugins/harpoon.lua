return {
	"ThePrimeagen/harpoon",
	config = function()
		local keymaps = require("config.keymaps")

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymaps.harpoon(mark, ui)
	end,
}
