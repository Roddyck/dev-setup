---------------------
---- KEYBINDINGS ----
---------------------

---Prefix keys with mainMod
---@param keys string key to prefix
---@return string key prefixed with mainMod
local function leader(keys)
  return MAIN_MOD .. " + " .. keys
end

---Return full path to script based on scriptDir
---@param filename string filename of script
---@param args string[]? args to pass to script
---@return string fullpath fullpath to script with args appended
local function script(filename, args)
  args = args or {}
  return string.format("%s/%s %s", SCRIPT_DIR, filename, table.concat(args, " "))
end

hl.bind(leader("Return"), hl.dsp.exec_cmd(TERMINAL))
hl.bind(leader("q"), hl.dsp.window.close())
hl.bind(leader("d"), hl.dsp.exec_cmd(MENU))
hl.bind(leader("v"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(leader("SHIFT + V"), hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(leader("P"), hl.dsp.window.pseudo())
hl.bind(leader("Y"), hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))
hl.bind(leader("m"), hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(leader("f"), hl.dsp.window.fullscreen())

-- Move focus
hl.bind(leader("h"), hl.dsp.focus({ direction = "left" }))
hl.bind(leader("l"), hl.dsp.focus({ direction = "right" }))
hl.bind(leader("k"), hl.dsp.focus({ direction = "up" }))
hl.bind(leader("j"), hl.dsp.focus({ direction = "down" }))

-- Swap windows
hl.bind(leader("SHIFT + h"), hl.dsp.window.swap({ direction = "left" }))
hl.bind(leader("SHIFT + l"), hl.dsp.window.swap({ direction = "right" }))
hl.bind(leader("SHIFT + k"), hl.dsp.window.swap({ direction = "up" }))
hl.bind(leader("SHIFT + j"), hl.dsp.window.swap({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(leader(tostring(key)), hl.dsp.focus({ workspace = i }))
  hl.bind(leader("SHIFT + " .. key), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(leader("S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(leader("SHIFT + S"), hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(leader("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(leader("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(leader("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(leader("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Switch to a submap called `resize`.
hl.bind(leader("r"), hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
  -- Set repeating binds for resizing the active window.
  hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

  -- Use `reset` to go back to the global submap
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
  hl.dsp.exec_cmd(script("brightness-change", { "--inc" })),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd(script("brightness-change", { "--dec" })),
  { locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Execute wallpaper selector
hl.bind(leader("W"), hl.dsp.exec_cmd(script("WallpaperSelect.sh")))

-- Web search
hl.bind(leader("SHIFT + B"), hl.dsp.exec_cmd(script("rofi-search")))
hl.bind(leader("B"), hl.dsp.exec_cmd("zen-browser"))

-- wlogout
hl.bind(leader("SHIFT + P"), hl.dsp.exec_cmd(script("Wlogout.sh")))

-- Screenshots
hl.bind(
  "Print",
  hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"')
)

-- hl.bind("Print", hl.dsp.exec_cmd(script("screenshot", {})))
-- hl.bind("SHIFT + Print", hl.dsp.exec_cmd(script("screenshot", { "-r" })))
-- hl.bind(leader("Print"), hl.dsp.exec_cmd(script("screenshot", { "-w" })))
--
-- Clipboard screenshots
-- hl.bind("CTRL + Print", hl.dsp.exec_cmd(script("screenshot", { "-c" })))
-- hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd(script("screenshot", { "-cr" })))
-- hl.bind(leader("CTRL + Print"), hl.dsp.exec_cmd(script("screenshot", { "-wc" })))

-- toggle pretty stuff
hl.bind(leader("SHIFT + A"), function()
  local game_mode = (hl.get_config("animations.enabled") == false)

  if game_mode then
    hl.exec_cmd("hyprctl reload")
    return
  end

  hl.config({
    animations = { enabled = false },
    general = {
      gaps_in = 0,
      gaps_out = 0,
      border_size = 0,
    },
    decoration = {
      shadow = { enabled = false },
      blur = { enabled = false },
      rounding = 0,
    },
  })
end)

-- toggle enable laptop keyboard
local keyboard_on = true
local keyboard_name = "at-translated-set-2-keyboard"

hl.bind(leader("SHIFT + C"), function()
  if keyboard_on then
    hl.device({
      name = keyboard_name,
      enabled = false,
    })
    hl.exec_cmd('notify-send -e "Keyboard disabled"')
  else
    hl.device({
      name = keyboard_name,
      enabled = true,
    })

    hl.exec_cmd('notify-send -e "Keyboard enabled"')
  end

  keyboard_on = not keyboard_on
end)

local MAX_ZOOM = 5
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

local function zoom(offset)
  local current = hl.get_config("cursor.zoom_factor")

  if offset ~= nil then
    current = current + offset
  elseif current ~= MIN_ZOOM then
    current = MIN_ZOOM
  else
    current = ZOOM_TOGGLE_FACTOR
  end

  current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
  hl.config({ cursor = { zoom_factor = current } })
end

hl.bind(leader("Z"), zoom)
hl.bind(leader("SHIFT + equal"), function()
  zoom(0.5)
end)
hl.bind(leader("minus"), function()
  zoom(-0.5)
end)

hl.bind(leader("mouse_up"), function()
  zoom(-0.5)
end)
hl.bind(leader("mouse_down"), function()
  zoom(0.5)
end)
