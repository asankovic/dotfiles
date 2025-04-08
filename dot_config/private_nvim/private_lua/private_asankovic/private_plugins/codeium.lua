return {
	"Exafunction/codeium.vim",
	config = function()
		local keymap = vim.keymap

		keymap.set("i", "<C-e>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Codeium accept" })

		keymap.set("i", "<c-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true, desc = "Codeium cycle to next completion" })

		keymap.set("i", "<c-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true, desc = "Codeium cycle to previous completion" })

		keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true, desc = "Codeium clear completion prompt" })

		vim.g.codeium_no_map_tab = true
	end,
}
