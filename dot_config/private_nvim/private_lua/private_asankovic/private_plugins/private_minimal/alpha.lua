return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local current_date = os.date("%A, %B %d, %Y")

		dashboard.section.header.val = {
			[[                                                                              ]],
			[[                                                                              ]],
			[[                                                                              ]],
			[[                                                                              ]],
			[[                                                                              ]],
			[[                                    ██████                                    ]],
			[[                                ████▒▒▒▒▒▒████                                ]],
			[[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
			[[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
			[[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
			[[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
			[[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
			[[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
			[[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
			[[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
			[[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
			[[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
			[[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
			[[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
			[[                        ██      ██      ████      ████                        ]],
			[[                                                                              ]],
			[[                                                                              ]],
			[[                              Welcome to Neovim!                              ]],
			[[                     Today is    ]] .. current_date,
			[[                                                                              ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("l", "  > LazyVim", "<cmd>Lazy<CR>"),
			dashboard.button("u", "󱡡  > Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		vim.api.nvim_create_autocmd("User", {
					pattern = "LazyVimStarted",
					desc = "Add Alpha dashboard footer",
					once = true,
					callback = function()
						local stats = require("lazy").stats()
						local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
						dashboard.section.footer.val =
							{ " ", " ", " ", " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms " }
						dashboard.section.header.opts.hl = "DashboardFooter"
						pcall(vim.cmd.AlphaRedraw)
					end,
				})

		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
