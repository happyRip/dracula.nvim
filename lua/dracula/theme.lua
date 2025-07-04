local M = {}

local function setup_highlights(palette, opts)
	local colors = palette
	local none = "NONE"

	local highlights = {}

	-- Helper function to set highlight groups
	local function hi(group, spec)
		highlights[group] = spec
	end

	-- Terminal colors
	if vim.fn.has("nvim") == 1 then
		for i = 0, 15 do
			vim.g["terminal_color_" .. i] = colors["color_" .. i]
		end
	end

	if vim.fn.has("terminal") == 1 then
		vim.g.terminal_ansi_colors = {}
		for i = 0, 15 do
			table.insert(vim.g.terminal_ansi_colors, colors["color_" .. i])
		end
	end

	-- Base highlight groups
	hi("Normal", { fg = colors.fg, bg = colors.bg })
	hi("NormalFloat", { link = "Pmenu" })

	-- UI elements
	hi("ColorColumn", { bg = colors.bgdark })
	hi("Cursor", { fg = colors.bg, bg = colors.fg })
	hi("CursorLine", { bg = colors.subtle })
	hi("CursorColumn", { link = "CursorLine" })
	hi("CursorLineNr", { fg = colors.yellow })
	hi("LineNr", { fg = colors.comment })
	hi("SignColumn", { fg = colors.comment })

	-- Status line
	hi("StatusLine", { bg = colors.bglighter, bold = opts.bold })
	hi("StatusLineNC", { bg = colors.bglight })
	hi("StatusLineTerm", { bg = colors.bglighter, bold = opts.bold })
	hi("StatusLineTermNC", { bg = colors.bglight })

	-- Tabs
	hi("TabLine", { fg = colors.comment, bg = colors.bgdark })
	hi("TabLineFill", { bg = colors.bgdark })
	hi("TabLineSel", { link = "Normal" })

	-- Windows
	hi("WinSeparator", { fg = colors.comment, bg = colors.bgdark })
	hi("VertSplit", { link = "WinSeparator" })

	-- Popup menu
	hi("Pmenu", { bg = colors.bgdark })
	hi("PmenuSbar", { bg = colors.bgdark })
	hi("PmenuSel", { bg = colors.selection })
	hi("PmenuThumb", { bg = colors.selection })
	hi("PmenuMatch", { fg = colors.cyan, bg = colors.bgdark })
	hi("PmenuMatchSel", { fg = colors.cyan, bg = colors.selection })

	-- Search
	hi("Search", { fg = colors.green, reverse = opts.inverse })
	hi("IncSearch", { fg = colors.bg, bg = colors.orange })

	-- Visual
	hi("Visual", { bg = colors.selection })
	hi("VisualNOS", { link = "Visual" })

	-- Diff
	if opts.high_contrast_diff then
		hi("DiffAdd", { fg = colors.green, bg = colors.purple })
		hi("DiffChange", { fg = colors.yellow, bg = colors.purple })
		hi("DiffDelete", { fg = colors.bgdark, bg = colors.red })
	else
		hi("DiffAdd", { fg = colors.green })
		hi("DiffChange", { fg = colors.orange })
		hi("DiffDelete", { fg = colors.red, bg = colors.bgdark })
	end
	hi("DiffText", { fg = colors.bg, bg = colors.orange })

	-- Folds
	hi("Folded", { fg = colors.comment, bg = colors.bgdark })
	hi("FoldColumn", { fg = colors.subtle })

	-- Messages
	hi("ErrorMsg", { fg = colors.fg, bg = colors.red })
	hi("WarningMsg", { fg = colors.bg, bg = colors.orange })
	hi("MoreMsg", { fg = colors.fg, bold = opts.bold })
	hi("Question", { fg = colors.fg, bold = opts.bold })
	hi("Title", { fg = colors.green, bold = opts.bold })

	-- Misc
	hi("Directory", { fg = colors.purple, bold = opts.bold })
	hi("NonText", { fg = colors.subtle })
	hi("SpecialKey", { fg = colors.red })
	hi("WildMenu", { fg = colors.bg, bg = colors.purple, bold = opts.bold })
	hi("MatchParen", { fg = colors.green, underline = opts.underline })
	hi("Conceal", { fg = colors.cyan })

	-- Syntax highlighting
	hi("Comment", { fg = colors.comment, italic = opts.italic })
	hi("Constant", { fg = colors.purple })
	hi("String", { fg = colors.yellow })
	hi("Character", { fg = colors.pink })
	hi("Number", { link = "Constant" })
	hi("Boolean", { link = "Constant" })
	hi("Float", { link = "Constant" })

	hi("Identifier", { fg = colors.fg })
	hi("Function", { fg = colors.green })

	hi("Statement", { fg = colors.pink })
	hi("Conditional", { fg = colors.pink })
	hi("Repeat", { fg = colors.pink })
	hi("Label", { fg = colors.pink })
	hi("Operator", { fg = colors.pink })
	hi("Keyword", { fg = colors.pink })
	hi("Exception", { fg = colors.pink })

	hi("PreProc", { fg = colors.pink })
	hi("Include", { fg = colors.pink })
	hi("Define", { fg = colors.pink })
	hi("Macro", { fg = colors.pink })
	hi("PreCondit", { fg = colors.pink })
	hi("StorageClass", { fg = colors.pink })
	hi("Structure", { fg = colors.pink })
	hi("Typedef", { fg = colors.pink })

	hi("Type", { fg = colors.cyan, italic = opts.italic })
	hi("Delimiter", { fg = colors.fg })
	hi("Special", { fg = colors.pink })
	hi("SpecialComment", { fg = colors.cyan, italic = opts.italic })
	hi("Tag", { fg = colors.cyan })
	hi("Todo", { fg = colors.cyan, bold = opts.bold, reverse = opts.inverse })
	hi("Error", { fg = colors.red })
	hi("Underlined", { fg = colors.fg, underline = opts.underline })

	-- Spell checking
	hi("SpellBad", { undercurl = opts.undercurl, sp = colors.red })
	hi("SpellLocal", { undercurl = opts.undercurl, sp = colors.orange })
	hi("SpellCap", { undercurl = opts.undercurl, sp = colors.cyan })
	hi("SpellRare", { undercurl = opts.undercurl, sp = colors.cyan })

	-- LSP
	if vim.fn.has("nvim") == 1 then
		hi("LspReferenceText", { bg = colors.selection })
		hi("LspReferenceRead", { bg = colors.selection })
		hi("LspReferenceWrite", { bg = colors.selection })

		hi("DiagnosticError", { fg = colors.red })
		hi("DiagnosticWarn", { fg = colors.orange })
		hi("DiagnosticInfo", { fg = colors.cyan })
		hi("DiagnosticHint", { fg = colors.cyan })

		hi("DiagnosticUnderlineError", { undercurl = opts.undercurl, sp = colors.red })
		hi("DiagnosticUnderlineWarn", { undercurl = opts.undercurl, sp = colors.orange })
		hi("DiagnosticUnderlineInfo", { undercurl = opts.undercurl, sp = colors.cyan })
		hi("DiagnosticUnderlineHint", { undercurl = opts.undercurl, sp = colors.cyan })

		hi("LspInlayHint", { fg = colors.comment, bg = colors.bgdark })
	end

	-- Treesitter
	if vim.fn.has("nvim-0.8") == 1 then
		-- Punctuation
		hi("@punctuation.delimiter", { fg = colors.fg })
		hi("@punctuation.bracket", { fg = colors.fg })
		hi("@punctuation.special", { fg = colors.pink })

		-- Constants
		hi("@constant", { fg = colors.purple })
		hi("@constant.builtin", { fg = colors.purple })
		hi("@constant.macro", { fg = colors.pink })

		-- Strings
		hi("@string", { fg = colors.yellow })
		hi("@string.special", { fg = colors.pink })
		hi("@string.special.symbol", { fg = colors.purple })
		hi("@string.special.url", { fg = colors.cyan, underline = opts.underline })
		hi("@string.regex", { fg = colors.pink })
		hi("@string.escape", { fg = colors.pink })

		-- Functions
		hi("@function", { fg = colors.green })
		hi("@function.builtin", { fg = colors.cyan })
		hi("@function.macro", { fg = colors.green })
		hi("@parameter", { fg = colors.orange, italic = opts.italic })
		hi("@parameter.reference", { fg = colors.orange })
		hi("@field", { fg = colors.orange })
		hi("@property", { fg = colors.fg })
		hi("@constructor", { fg = colors.cyan })

		-- Keywords
		hi("@keyword", { fg = colors.pink })
		hi("@keyword.function", { fg = colors.pink })
		hi("@keyword.operator", { fg = colors.pink })
		hi("@label", { fg = colors.purple, italic = opts.italic })
		hi("@exception", { fg = colors.purple })
		hi("@operator", { fg = colors.pink })

		-- Types
		hi("@type", { fg = colors.cyan, italic = opts.italic })
		hi("@type.builtin", { fg = colors.pink })
		hi("@character", { fg = colors.pink })
		hi("@character.special", { fg = colors.pink })
		hi("@boolean", { fg = colors.purple })
		hi("@number", { fg = colors.purple })
		hi("@number.float", { fg = colors.purple })

		-- Variables
		hi("@variable", { fg = colors.fg })
		hi("@variable.builtin", { fg = colors.purple, italic = opts.italic })
		hi("@variable.parameter", { fg = colors.orange, italic = opts.italic })
		hi("@variable.member", { fg = colors.orange })

		-- Tags
		hi("@tag", { fg = colors.cyan })
		hi("@tag.delimiter", { fg = colors.fg })
		hi("@tag.attribute", { fg = colors.green, italic = opts.italic })

		-- Comments
		hi("@comment", { fg = colors.comment, italic = opts.italic })
		hi("@comment.error", { fg = colors.red })
		hi("@comment.warning", { fg = colors.orange })
		hi("@comment.note", { fg = colors.cyan })
		hi("@comment.todo", { fg = colors.cyan, bold = opts.bold })

		-- Text
		hi("@markup.strong", { fg = colors.fg, bold = opts.bold })
		hi("@markup.italic", { fg = colors.fg, italic = opts.italic })
		hi("@markup.strikethrough", { fg = colors.fg, strikethrough = opts.strikethrough })
		hi("@markup.underline", { fg = colors.fg, underline = opts.underline })
		hi("@markup.heading", { fg = colors.yellow })
		hi("@markup.link", { fg = colors.cyan, underline = opts.underline })
		hi("@markup.link.uri", { fg = colors.yellow })
		hi("@markup.link.label", { fg = colors.pink })
		hi("@markup.raw", { fg = colors.yellow })
		hi("@markup.list", { fg = colors.pink })
	end

	return highlights
end

function M.setup(palette, opts)
	opts = opts or {}

	-- Set default options
	opts.bold = opts.bold ~= false
	opts.italic = opts.italic ~= false
	opts.strikethrough = opts.strikethrough ~= false
	opts.underline = opts.underline ~= false
	opts.undercurl = opts.undercurl ~= false
	opts.inverse = opts.inverse ~= false
	opts.high_contrast_diff = opts.high_contrast_diff or false

	local highlights = setup_highlights(palette, opts)

	-- Apply highlights
	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
