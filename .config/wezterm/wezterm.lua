local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_rows = 80
config.initial_cols = 192
config.font = wezterm.font_with_fallback({
	-- "JetBrains Mono",
    "Monaspace Neon",
	{ family = "Symbols Nerd Font Mono", scale = 0.7 },
	-- "JetBrainsMono Nerd Font Mono",
	"Liga Ubuntu Mono",
	"UbuntuMono Nerd Font Mono",
	"UbuntuMono Nerd Font",
})
config.harfbuzz_features = { "zero", "clig", "calt", "liga", "kern", "mark", "mkmk" }
config.font_size = 16.0
config.line_height = 1.6
config.color_scheme = "h7nOS Dark"
config.window_background_opacity = 0.90
config.window_padding = {
	left = 0,
	right = 1,
	top = 0,
	bottom = 0,
}
config.use_fancy_tab_bar = false
config.tab_max_width = 128
config.window_decorations = "RESIZE"
config.enable_wayland = false
config.show_update_window = false
config.check_for_updates = false
config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_thickness = "200%"
config.cursor_blink_rate = 1000

-- local gpus = wezterm.gui.enumerate_gpus()

-- config.webgpu_preferred_adapter = gpus[1]
config.front_end = 'OpenGL'
config.freetype_load_flags = 'FORCE_AUTOHINT|MONOCHROME'
config.freetype_load_target = 'Normal'
config.freetype_render_target = 'HorizontalLcd'

config.default_workspace = "home"

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.enable_scroll_bar = not pane:is_alt_screen_active()
	window:set_config_overrides(overrides)
end)

return config
