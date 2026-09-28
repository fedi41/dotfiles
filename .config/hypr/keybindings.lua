local terminal = "ghostty"
local fileManager = "nautilus"
local appLauncher = "rofi -show drun -show-icons"
local runner = "rofi -show run"
local browser = "zen-browser"
local wallpaperMenu = "python ~/Documents/wallfliper/main.py"
local toggleShowDesktop = ".config/hypr/toggle-hide-windows.sh"
local screenshotArea = "grimblast save area ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
local screenshotFull = "grimblast save screen ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
local lockscreen = "swaylock"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER + SHIFT"

-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(lockscreen))

--- APPS ---
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(appLauncher))
hl.bind(secondMod .. " + D", hl.dsp.exec_cmd(runner))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

--- UTILS ---
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(toggleShowDesktop))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(screenshotFull))
hl.bind(secondMod .. " + C", hl.dsp.exec_cmd(screenshotArea))

--- WALLPAPER ---
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaperMenu))

-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(secondMod .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ enabled = true }))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind(secondMod .. " + Escape", hl.dsp.exec_cmd("shutdown now"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(secondMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- hl.bind(secondMod .. " + H", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind(secondMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(secondMod .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
