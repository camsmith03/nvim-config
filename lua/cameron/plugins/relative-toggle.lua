return {
	"cpea2506/relative-toggle.nvim",
	config = function()
		local reltoggle = require("relative-toggle")

		reltoggle.setup({
			pattern = "*",
			events = {
				on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
				off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
			},
		})
	end,
}
