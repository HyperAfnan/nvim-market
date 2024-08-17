local highlights = {}

vim.api.nvim_set_hl(0, "MARKETTITLEUNSELECTED", { fg = "#89b4fa", bold = true })
vim.api.nvim_set_hl(0, "MARKETTITLESELECTED", { bg = "#89b4fa", fg = "#000000", bold = true })

highlights.select = function(buf, button)
	local buttons = {
		title = { 1, 2, 17 },
		dashboard = { 1, 19, 30 },
		install = { 1, 31, 40 },
		update = { 1, 41, 49 },
		config = { 1, 50, 63 },
	}

	-- Clear previous highlights
	for name, range in pairs(buttons) do
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLEUNSELECTED", 1, range[2], range[3])
	end

	-- Set highlight for selected button
	if buttons[button] then
		local range = buttons[button]
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLESELECTED", 1, range[2], range[3])
	end
end

highlights.unselect = function(buf, section)
	if section == "dashboard" then
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLEUNSELECTED", 1, 19, 30)
	elseif section == "install" then
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLEUNSELECTED", 1, 31, 40)
	elseif section == "update" then
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLEUNSELECTED", 1, 41, 47)
	elseif section == "config" then
		vim.api.nvim_buf_add_highlight(buf, 1, "MARKETTITLEUNSELECTED", 1, 49, 60)
	end
end

return highlights
