TERMINAL = "ghostty"
FILE_MANAGER = "dolphin"
MENU = "rofi -show drun -modi drun,filebrowser,run,window"
SCRIPT_DIR = "$HOME/.local/scripts"

MAIN_MOD = "SUPER" -- Sets "Windows" key as main modifier

require("modules.monitors")
require("modules.autostart")
require("modules.env")
require("modules.keybinds")
require("modules.decorations")
require("modules.settings")
require("modules.window-rules")
-- require("animations.ml4w-fast")
require("animations.default")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
