local wezterm = require("wezterm")

local config = wezterm.config_builder()

wezterm.on("format-tab-title", function(tab)
  return string.format(" %d: %s ", tab.tab_index + 1, tab.active_pane.title)
end)

config.automatically_reload_config = true

-- Configuração de cores e cursor
 -- config.colors = {
 -- 	foreground = "#CBE0F0",
 -- 	background = "#011423",
 --   cursor_bg = "#de10d0", -- Cursor pink no modo normal
 --   cursor_border = "#00FF00", -- Borda verde
 --   cursor_fg = "#000000", -- Texto preto no cursor
 -- 	selection_bg = "#033259",
 -- 	selection_fg = "#CBE0F0",
 -- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
 -- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
 -- }

--config.color_scheme = 'Dracula'
--config.color_scheme = 'Solarized (dark) (terminal.sexy)'
--config.color_scheme = 'Github Dark'
--config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Grayscale (dark) (terminal.sexy)'
--config.color_scheme = 'Belge (terminal.sexy)'
--config.color_scheme = 'Black Metal (Venom) (base16)'
--config.color_scheme = 'nightfox'
--config.color_scheme = 'One Dark'
--config.color_scheme = 'Operator Mono Dark'
--config.color_scheme = 'Orangish (terminal.sexy)'
--config.color_scheme = 'Rosé Pine Moon (Gogh)'
--config.color_scheme = 'Rosé Pine Moon (base16)'
--config.color_scheme = 'GruvboxDark'
--config.color_scheme = 'Gruvbox dark, hard (base16)'
--config.color_scheme = 'GruvboxDarkHard'
--config.color_scheme = 'Kanagawa Dragon (Gogh)'
--config.color_scheme = 'Royal'
--config.color_scheme = 'Blue Matrix'
config.color_scheme = 'Night Owl (Gogh)'
--config.color_scheme = 'Neon'




config.default_cursor_style = "BlinkingBar" -- Bloco fixo no modo normal
config.hide_mouse_cursor_when_typing = true
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}

--config.animation_fps = 30
--config.cursor_blink_rate = 800
config.animation_fps = 10
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.text_blink_rate_rapid = 250


-- Fontes
--config.font = wezterm.font_with_fallback({
--  "FiraCode Nerd Font",      -- Fonte principal
--  "Noto Sans Symbols",       -- Fonte alternativa para símbolos
--  "Unifont",                 -- Fonte com ampla cobertura de glifos
--})
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
--config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 9
--wezterm.font("Fira Code", {weight="Light", stretch="Normal", italic=false})

config.enable_tab_bar = false
--config.window_decorations = "RESIZE"
-- Manter a janela sem decorações
config.window_decorations = "NONE"

window_frame = {
    border_left_width = "5px",
    border_right_width = "5px",
    border_bottom_width = "5px",
    border_top_width = "5px",
    border_color = "#214969", -- Altere para a cor que desejar
  }


--config.window_background_opacity = 1
config.window_background_opacity = 0.95
--config.window_background_opacity = 0.55

config.initial_cols = 166
config.initial_rows = 45

window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  }

-- Configurar comportamento de alinhamento
config.default_workspace = "centralizado"

-- Destaque do split ativo (ajuste do brilho e saturação dos splits inativos)
config.inactive_pane_hsb = {
  saturation = 0.7, -- Reduz a saturação dos splits inativos
  brightness = 0.5, -- Reduz o brilho dos splits inativos
}

-- Blur
config.macos_window_background_blur = 20

-- Mapeamentos de teclas para SPLITS e navegação
config.keys = {
  -- Split vertical (janela à direita)
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  -- Split horizontal (janela abaixo)
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  -- Alternar para split à esquerda
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  -- Alternar para split à direita
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  -- Alternar para split acima
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  -- Alternar para split abaixo
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  -- Fechar  split ativo
  {
    key = "q",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  -- Reativar painel fechado recentemente
  {
   key = "r",
   mods = "CTRL|SHIFT",
   action = wezterm.action.PaneSelect { mode = "Activate" },
  },

  -- ABAS
   -- Criar uma nova aba
    { key = "t", mods = "CTRL|SHIFT", action = wezterm.action{SpawnTab="DefaultDomain"} },
    -- Fechar a aba atual
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action{CloseCurrentTab={confirm=true}} },
    -- Alternar para a próxima aba
    { key = "Tab", mods = "CTRL", action = wezterm.action{ActivateTabRelative=1} },
    -- Alternar para a aba anterior
    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action{ActivateTabRelative=-1} },
}

return config
