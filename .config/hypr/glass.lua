hl.plugin.load("/var/cache/hyprpm/fedi41/HyprGlass/hyprglass.so")

if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		default_theme = "dark",
		default_preset = "clear",
		tint_color = 0x8899aa00,

		brightness = 0.9,
		dark = { brightness = 0.82 },
		light = { adaptive_boost = 0.5 },

		layers = { enabled = true },
	})

	-- Layer surfaces: each call whitelists the namespace and configures it
	hg.layer("waybar", { preset = "subtle", mask_threshold = 0.05 })
	hg.layer("swaync")
	hg.layer("quickshell:bezel", { preset = "ui", mask_threshold = 0.3 })
	hg.layer("debug-panel", { exclude = true })

	-- Presets
	hg.preset("clear", {
		glass_opacity = 0.95,
		blur_strength = 4,
		dark = { brightness = 0.7 },
		light = { brightness = 1.2 },
	})

	hg.preset("contrasted", {
		inherits = "high_contrast",
		contrast = 1,
		adaptive_dim = 1,
		dark = { tint_color = 0x02142aa9 },
	})
end
