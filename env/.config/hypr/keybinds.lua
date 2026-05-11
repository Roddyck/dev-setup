---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "rofi -show drun -modi drun,filebrowser,run,window"
local scriptDir = "$HOME/.local/scripts/"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- local function mainModMap(key)
-- 	return mainMod .. " + " .. key
-- end
--
-- local function scriptMap(script)
-- 	return scriptDir .. script
-- end

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + q", hl.dsp.window.kill())
hl.bind(mainMod .. " + d", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + v", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))
hl.bind(mainMod .. " + m", hl.dsp.exec_cmd(fileManager))

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relavive = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relavive = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relavive = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relavive = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))

	hl.bind("escape", hl.dsp.submap("reset"))
end)

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
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(scriptDir .. "brightness-change --inc"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(scriptDir .. "brightness-change --dec"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Execute wallpaper selector
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scriptDir .. "WallpaperSelect.sh"))

-- Web search
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(scriptDir .. "rofi-search"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))

-- wlogout
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(scriptDir .. "Wlogout.sh"))

-- Screenshots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot -r"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot -w"))

-- Clipboard screenshots
hl.bind("CTRL + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot -c"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot -cr"))
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(scriptDir .. "screenshot -wc"))

-- toggle pretty stuff
hl.bind("WIN + F1", hl.dsp.exec_cmd(scriptDir .. "toggleDecorations"))

-- toggle enable laptop keyboard
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(scriptDir .. "keyboard-enable-toggle"))
