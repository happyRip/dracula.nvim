local M = {}

local palette = require("dracula.palette")
local theme = require("dracula.theme")

-- Default configuration
M.config = {
	variant = "default", -- "default", "alucard", "blade", "buffy", "lincoln", "morbius", "van_helsing"
	bold = true,
	italic = true,
	strikethrough = true,
	underline = true,
	undercurl = true,
	inverse = true,
	high_contrast_diff = false,
}

-- Setup function
function M.setup(opts)
	opts = opts or {}
	M.config = vim.tbl_deep_extend("force", M.config, opts)
end

-- Load the colorscheme
function M.load(variant)
	variant = variant or M.config.variant

	-- Clear existing highlights
	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set background
	if variant == "alucard" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end

	-- Set colorscheme name
	vim.g.colors_name = "dracula"

	-- Get the palette for the variant
	local colors = palette[variant] or palette.default

	-- Apply the theme
	theme.setup(colors, M.config)
end

-- Convenience function to load a specific variant
function M.default()
	M.load("default")
end

function M.alucard()
	M.load("alucard")
end

function M.blade()
	M.load("blade")
end

function M.buffy()
	M.load("buffy")
end

function M.lincoln()
	M.load("lincoln")
end

function M.morbius()
	M.load("morbius")
end

function M.van_helsing()
	M.load("van_helsing")
end

return M
