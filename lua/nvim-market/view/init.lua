local hl = require("nvim-market.view.highlights")

local ui = {}

function ui:standard()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local opts = {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		border = "solid",
	}

	local win = vim.api.nvim_open_win(buf, true, opts)
	local title = "   Nvim-Market "

	local lines = {
		"",
		title .. "  DASHBOARD  " .. " INSTALL  " .. " UPDATE  " .. " CONFIG FILE ",
		"",
		string.rep("-", width, ""),
	}
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end
-- Step 1: Create the highlight group for the backdrop effect
vim.api.nvim_set_hl(0, "Backdrop", { bg = "#000000", blend = 50 })

-- Step 2: Create a highlight namespace for the window
local ns_id = vim.api.nvim_create_namespace("backdrop_namespace")

-- Step 3: Set the backdrop effect in the specific window
local win_id = vim.api.nvim_get_current_win() -- Or use a specific window ID
vim.api.nvim_win_set_hl_ns(win_id, ns_id)

-- Apply the backdrop effect by setting 'Normal' highlight in the namespace
vim.api.nvim_set_hl(ns_id, "Normal", { link = "Backdrop" })

-- Optionally, apply the effect to specific parts of the buffer content
vim.api.nvim_buf_add_highlight(0, ns_id, "LazyBackdrop", 0, 0, -1)

-- ui:standard()
return ui
