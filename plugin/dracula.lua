-- Dracula theme for Neovim
-- This file ensures the plugin is properly loaded

if vim.g.loaded_dracula then
	return
end

vim.g.loaded_dracula = 1

-- List of available variants for cycling
local variants = {
	"default",
	"alucard",
	"blade",
	"buffy",
	"lincoln",
	"morbius",
	"van_helsing",
}

-- Current variant index for cycling
local current_variant_index = 1

-- Command to load a specific variant or default if no argument
vim.api.nvim_create_user_command("DraculaVariant", function(opts)
	local variant = opts.args and opts.args ~= "" and opts.args or "default"

	-- Validate variant
	local valid_variant = false
	for _, v in ipairs(variants) do
		if v == variant then
			valid_variant = true
			current_variant_index = _
			break
		end
	end

	if not valid_variant then
		vim.notify(
			"Invalid variant: " .. variant .. ". Available variants: " .. table.concat(variants, ", "),
			vim.log.levels.ERROR
		)
		return
	end

	-- Load the variant using the specific function
	local dracula = require("dracula")
	if variant == "default" then
		dracula.default()
	elseif variant == "alucard" then
		dracula.alucard()
	elseif variant == "blade" then
		dracula.blade()
	elseif variant == "buffy" then
		dracula.buffy()
	elseif variant == "lincoln" then
		dracula.lincoln()
	elseif variant == "morbius" then
		dracula.morbius()
	elseif variant == "van_helsing" then
		dracula.van_helsing()
	end

	vim.notify("Loaded Dracula " .. variant .. " variant")
end, {
	desc = "Load Dracula variant (default if no argument)",
	nargs = "?",
	complete = function()
		return variants
	end,
})

-- Command to cycle through variants
vim.api.nvim_create_user_command("DraculaCycle", function()
	current_variant_index = current_variant_index + 1
	if current_variant_index > #variants then
		current_variant_index = 1
	end

	local variant = variants[current_variant_index]
	vim.cmd("DraculaVariant " .. variant)
end, { desc = "Cycle through Dracula variants" })
