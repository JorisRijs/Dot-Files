function ColorMyPencils(color)
	-- color = color or "tokyonight-night"
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "float", {bg = "none"})
end

ColorMyPencils()

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

LineNumberColors()

