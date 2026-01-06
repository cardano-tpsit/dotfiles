-- ~/.wezterm.lua
local wezterm = require("wezterm")

return {
	-- ==========================================
	-- 1. MOTORE DI RENDERING E DPI
	-- ==========================================
	front_end = "WebGpu", -- Prova "OpenGL" se WebGpu dà problemi
	dpi = 96.0, -- Forza il DPI standard (prova 120.0 se hai un monitor 2K)

	-- ==========================================
	-- 2. CONFIGURAZIONE FONT (Senza blur)
	-- ==========================================
	font = wezterm.font_with_fallback({
		{
			family = "JetBrains Mono",
			weight = "Medium",
			-- In WezTerm, hinting e antialias si controllano spesso
			-- tramite il rasterizzatore di sistema o queste opzioni:
		},
		"Fira Code",
		"Noto Color Emoji",
	}),
	font_size = 11,

	-- Disattiva le legature
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	-- ==========================================
	-- 3. RASTERIZZAZIONE (La chiave per la nitidezza)
	-- ==========================================
	-- Su Linux, FreeType è il rasterizzatore standard.
	-- Queste opzioni aiutano a definire i bordi dei caratteri:

	-- Se i font sono ancora sfocati, prova a forzare questo:
	-- font_rasterizer = "FreeType",

	-- =====================
	-- Resto della configurazione
	-- =====================
	color_scheme = "Vs Code Dark+ (Gogh)",
	initial_cols = 120,
	initial_rows = 35,
	window_background_opacity = 1.0,

	window_padding = {
		left = 8,
		right = 8,
		top = 6,
		bottom = 6,
	},

	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
}
