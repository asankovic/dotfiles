return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)

		keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end)

		keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
		end)

		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)

		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)

		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)

		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)

		keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)

		keymap.set("n", "<leader>fh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- For potential Telescope usage
		-- local conf = require("telescope.config").values
		--
		-- local function toggle_telescope(harpoon_files)
		-- 	local file_paths = {}
		-- 	for _, item in ipairs(harpoon_files.items) do
		-- 		table.insert(file_paths, item.value)
		-- 	end
		--
		-- 	require("telescope.pickers")
		-- 		.new({}, {
		-- 			prompt_title = "Harpoon",
		-- 			finder = require("telescope.finders").new_table({
		-- 				results = file_paths,
		-- 			}),
		-- 			previewer = conf.file_previewer({}),
		-- 			sorter = conf.generic_sorter({}),
		-- 		})
		-- 		:find()
		-- end

		-- keymap.set("n", "<leader>fh", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Open harpoon window" })
	end,
}
