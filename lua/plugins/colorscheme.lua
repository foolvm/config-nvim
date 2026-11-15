return { -- Ashen Joker Colorscheme { "LazyVim/LazyVim", opts = { colorscheme = "ashen-joker", }, },

  {
    dir = vim.fn.stdpath("config"),
    name = "ashen-joker",
    lazy = false,
    priority = 1000,

    config = function()
      local colors = {
        bg       = "#202022",
        bg_dark  = "#171719",
        surface  = "#29292D",
        surface2 = "#38383D",
        surface3 = "#48484D",
        gray0    = "#626267",
        gray1    = "#858589",
        gray2    = "#B5B5B8",
        gray3    = "#D8D7D4",
        white    = "#F0EFEC",
        skin     = "#805D55",
        ember    = "#A65B45",
      }

      local groups = {
        -- Editor
        Normal = { fg = colors.gray3, bg = colors.bg },
        NormalNC = { fg = colors.gray3, bg = colors.bg },
        NormalFloat = { fg = colors.gray3, bg = colors.surface },
        FloatBorder = { fg = colors.gray0, bg = colors.surface },
        FloatTitle = { fg = colors.ember, bg = colors.surface },

        CursorLine = { bg = colors.surface },
        LineNr = { fg = colors.gray0 },
        CursorLineNr = { fg = colors.ember, bold = true },
        SignColumn = { bg = colors.bg },

        Visual = { bg = colors.surface3 },
        Search = { fg = colors.bg_dark, bg = colors.skin },
        IncSearch = { fg = colors.bg, bg = colors.ember },

        WinSeparator = { fg = colors.surface2 },

        -- Syntax
        Comment = { fg = colors.gray0, italic = true },
        String = { fg = colors.gray1 },
        Character = { fg = colors.skin },
        Number = { fg = colors.skin },
        Boolean = { fg = colors.ember },
        Constant = { fg = colors.skin },

        Identifier = { fg = colors.gray3 },
        Function = { fg = colors.gray2 },
        Statement = { fg = colors.ember },
        Keyword = { fg = colors.ember, bold = true },
        Operator = { fg = colors.gray2 },
        Type = { fg = colors.gray2 },
        Special = { fg = colors.skin },

        -- Completion
        Pmenu = { fg = colors.gray3, bg = colors.surface },
        PmenuSel = {
          fg = colors.white,
          bg = colors.surface3,
          bold = true,
        },
        PmenuSbar = { bg = colors.surface2 },
        PmenuThumb = { bg = colors.gray0 },

        -- Statusline
        StatusLine = { fg = colors.gray3, bg = colors.surface },
        StatusLineNC = { fg = colors.gray1, bg = colors.bg_dark },

        -- Diagnostics
        DiagnosticError = { fg = "#C47777" },
        DiagnosticWarn = { fg = colors.ember },
        DiagnosticInfo = { fg = colors.gray2 },
        DiagnosticHint = { fg = colors.gray1 },

        -- Git
        GitSignsAdd = { fg = colors.gray2 },
        GitSignsChange = { fg = colors.ember },
        GitSignsDelete = { fg = colors.skin },

        -- Treesitter
        ["@variable"] = { fg = colors.gray3 },
        ["@function"] = { fg = colors.gray2 },
        ["@function.call"] = { fg = colors.gray2 },
        ["@keyword"] = { fg = colors.ember, bold = true },
        ["@string"] = { fg = colors.gray1 },
        ["@type"] = { fg = colors.gray2 },
        ["@comment"] = { fg = colors.gray0, italic = true },
        ["@constant"] = { fg = colors.skin },
        ["@property"] = { fg = colors.gray2 },

        -- Telescope
        TelescopeNormal = {
          fg = colors.gray3,
          bg = colors.surface,
        },
        TelescopeBorder = {
          fg = colors.gray0,
          bg = colors.surface,
        },
        TelescopeSelection = {
          fg = colors.white,
          bg = colors.surface3,
        },
        TelescopeMatching = {
          fg = colors.ember,
          bold = true,
        },

        -- Neo-tree
        NeoTreeNormal = {
          fg = colors.gray3,
          bg = colors.bg_dark,
        },
        NeoTreeNormalNC = {
          fg = colors.gray3,
          bg = colors.bg_dark,
        },
        NeoTreeDirectoryIcon = { fg = colors.skin },
        NeoTreeRootName = {
          fg = colors.ember,
          bold = true,
        },
      }

      vim.o.termguicolors = true
      vim.o.background = "dark"

      vim.api.nvim_create_augroup("AshenJoker", {
        clear = true,
      })

      local function apply_theme()
        for group, opts in pairs(groups) do
          vim.api.nvim_set_hl(0, group, opts)
        end
      end

      apply_theme()

      -- Reapply after plugins load their highlights
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = "AshenJoker",
        callback = apply_theme,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        group = "AshenJoker",
        callback = apply_theme,
      })

      vim.g.colors_name = "ashen-joker"
    end,
  }, }
