-- ~/.wezterm.lua
local wezterm = require("wezterm")

return {
	-- =====================
	-- Tema colori (VS Code Dark)
	-- =====================
	color_scheme = "Vs Code Dark+ (Gogh)",
	-- =====================
	-- Font (simile a VS Code)
	-- =====================
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"Fira Code",
		"Cascadia Code",
		"Noto Color Emoji",
	}),

	-- Abilita legature (come in VS Code)
	-- harfbuzz_features = { "calt", "liga", "clig" },

	-- Dimensione font
	font_size = 12.5,

	-- =====================
	-- Aspetto finestra
	-- =====================
	initial_cols = 120,
	initial_rows = 35,
	window_background_opacity = 1.0,
	text_background_opacity = 1.0,

	-- Margini interni (più “VS Code–like”)
	window_padding = {
		left = 8,
		right = 8,
		top = 6,
		bottom = 6,
	},

	-- Barra del titolo minimal
	-- window_decorations = "RESIZE",

	-- Cursor style
	--	default_cursor_style = "BlinkingBar",

	-- =====================
	-- Comportamento
	-- =====================
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
}
