# Install

## Requirements

- [Neovim](https://neovim.io/) 0.8.0+

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following configuration to your LazyVim setup:

```lua
{
  "happyRip/dracula.nvim",
  priority = 1000,
  config = function()
    require("dracula").setup({
      variant = "default", -- "default", "alucard", "blade", "buffy", "lincoln", "morbius", "van_helsing"
    })
    vim.cmd.colorscheme("dracula")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "happyRip/dracula.nvim",
  config = function()
    require("dracula").setup()
    vim.cmd.colorscheme("dracula")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'happyRip/dracula.nvim'
```

Then in your `init.lua`:

```lua
require("dracula").setup()
vim.cmd.colorscheme("dracula")
```

## Configuration

The theme comes with sensible defaults, but you can customize it:

```lua
require("dracula").setup({
  variant = "default",        -- Theme variant: "default", "alucard", "blade", "buffy", "lincoln", "morbius", "van_helsing"
  bold = true,                -- Enable bold text
  italic = true,              -- Enable italic text
  strikethrough = true,       -- Enable strikethrough
  underline = true,           -- Enable underline
  undercurl = true,           -- Enable undercurl
  inverse = true,             -- Enable inverse highlighting
  high_contrast_diff = false, -- Use high contrast for diffs
})
```

## Variants

This theme includes multiple variants inspired by Dracula Pro:

- **default** - The classic Dracula theme
- **alucard** - Light theme variant
- **blade** - Cyan-tinted variant
- **buffy** - Purple-tinted variant
- **lincoln** - Yellow-tinted variant
- **morbius** - Red-tinted variant
- **van_helsing** - Blue-tinted variant

### Loading a specific variant

```lua
-- Using the setup function
require("dracula").setup({ variant = "alucard" })
vim.cmd.colorscheme("dracula")

-- Or load directly
require("dracula").alucard()

-- Or use vim colorscheme command
vim.cmd.colorscheme("dracula-alucard")
```

### Switching variants dynamically

```lua
-- Switch to light theme
require("dracula").load("alucard")

-- Switch to blade variant
require("dracula").load("blade")

-- Switch back to default
require("dracula").load("default")
```

## Automatic System Theme Switching (macOS)

You can configure the theme to automatically switch between light and dark variants based on your macOS system theme:

```lua
-- Auto-detect system theme on startup
local function set_theme_based_on_system()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if not handle then
    vim.notify("Failed to check system theme", vim.log.levels.WARN)
    return
  end

  local result = handle:read("*a") or ""
  handle:close()

  local ok, dracula = pcall(require, "dracula")
  if not ok then
    vim.notify("Dracula theme not found", vim.log.levels.ERROR)
    return
  end

  if result:match("Light") then -- Default to light theme, fallback to dark
    dracula.load("alucard") -- light variant
  else
    dracula.load("default") -- or any dark variant like "blade", "buffy", etc.
  end
end

set_theme_based_on_system()

-- Create a command to manually sync with system theme
vim.api.nvim_create_user_command("DraculaSyncTheme", set_theme_based_on_system, {
  desc = "Synchronize the Dracula theme with the current system appearance",
})
```

Then you can use `:DraculaSyncTheme` to manually sync with your system theme, or it will automatically set the correct theme when Neovim starts.

## Activating theme

### Lua

```lua
vim.cmd.colorscheme("dracula")
```

### Vimscript

```vim
colorscheme dracula
```
