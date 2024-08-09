M = {}

M.init = function()
	local map = vim.keymap.set

	map("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- Move selection up and down
	map("v", "J", ":m '>+1<CR>gv=gv")
	map("v", "K", ":m '<-2<CR>gv=gv")

	-- Escape from insert mode with home row
	map("i", "jj", "<Esc>")

	-- Keep cursor in the middle while moving page up and page down.
	map("n", "<C-d>", "<C-d>zz")
	map("n", "<C-u>", "<C-u>zz")

	-- Tmux mappings
	map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

	-- cnext and cprev bindings
	-- map("n", "<C-j>", "<cmd>cnext<CR>")
	-- map("n", "<C-k>", "<cmd>cprev<CR>")

	-- Run project via makefile
	map("n", "<F5>", "<cmd>!make<CR>")

	-- Diagnostic keymaps
	map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
	map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
	map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
	map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

	-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
	-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
	-- is not what someone will guess without a bit more experience.
	--
	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode
	map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- TIP: Disable arrow keys in normal mode
	map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	-- Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--
	--  See `:help wincmd` for a list of all window commands
	-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	--map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	--map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- Keybinding to open explorer view.
	map("n", "-", "<cmd>:Explore<CR>")
end

M.buf_lsp = function(_, buffer)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = buffer, desc = "LSP: " .. desc })
	end

	-- Jump to the definition of the word under your cursor.
	--  This is where a variable was first declared, or where a function is defined, etc.
	--  To jump back, press <C-t>.
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

	-- Find references for the word under your cursor.
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

	-- Jump to the implementation of the word under your cursor.
	--  Useful when your language has ways of declaring types without an actual implementation.
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

	-- Jump to the type of the word under your cursor.
	--  Useful when you're not sure what type a variable is and you want to see
	--  the definition of its *type*, not where it was *defined*.
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

	-- Fuzzy find all the symbols in your current document.
	--  Symbols are things like variables, functions, types, etc.
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- Fuzzy find all the symbols in your current workspace.
	--  Similar to document symbols, except searches over your entire project.
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- Rename the variable under your cursor.
	--  Most Language Servers support renaming across files, etc.
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	-- Opens a popup that displays documentation about the word under your cursor
	--  See `:help K` for why this keymap.
	map("K", vim.lsp.buf.hover, "Hover Documentation")

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

M.telescope = function(builtin)
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
	vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

	vim.keymap.set("n", "<leader>ps", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end, { desc = "[P]roject [S]earch" })

	-- Slightly advanced example of overriding default behavior and theme
	vim.keymap.set("n", "<leader>/", function()
		-- You can pass additional configuration to Telescope to change the theme, layout, etc.
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })

	-- It's also possible to pass additional configuration options.
	--  See `:help telescope.builtin.live_grep()` for information about particular keys
	vim.keymap.set("n", "<leader>s/", function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = "Live Grep in Open Files",
		})
	end, { desc = "[S]earch [/] in Open Files" })

	-- Shortcut for searching your Neovim configuration files
	vim.keymap.set("n", "<leader>sn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })
end

M.harpoon = function(mark, ui)
	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<C-h>", function()
		ui.nav_file(1)
	end)
	vim.keymap.set("n", "<C-j>", function()
		ui.nav_file(2)
	end)
	vim.keymap.set("n", "<C-k>", function()
		ui.nav_file(3)
	end)
	vim.keymap.set("n", "<C-l>", function()
		ui.nav_file(4)
	end)
end

M.dap = function(dap, dapui)
	vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
	vim.keymap.set("n", "<leader>dc", dap.continue, {})
	vim.keymap.set("n", "<leader>djj", dapui.close, {})
end

return M
