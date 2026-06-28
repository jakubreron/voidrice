local TERMINAL = os.getenv("TERMINAL") or ""
local BROWSER = os.getenv("BROWSER") or ""
local BACKUP_BROWSER = os.getenv("BACKUP_BROWSER") or ""
local EDITOR = os.getenv("EDITOR") or ""
local VIMWIKI_DIR = os.getenv("VIMWIKI_DIR") or ""
local CLI_MAIL_CLIENT = os.getenv("CLI_MAIL_CLIENT") or ""
local GUI_MAIL_CLIENT = os.getenv("GUI_MAIL_CLIENT") or ""
local CLI_FILE_EXPLORER = os.getenv("CLI_FILE_EXPLORER") or ""
local GUI_FILE_EXPLORER = os.getenv("GUI_FILE_EXPLORER") or ""
local CLI_SOUND_MANAGER = os.getenv("CLI_SOUND_MANAGER") or ""
local CLI_MUSIC_PLAYER = os.getenv("CLI_MUSIC_PLAYER") or ""

local INTERNAL_MONITOR = "desc:Samsung Display Corp. 0x4193"
local EXTERNAL_MONITOR = "desc:LG Electronics LG Monitor 0x01010101"

---@type HL.MonitorSpec
local INTERNAL_MONITOR_SETTINGS = {
	output = INTERNAL_MONITOR,
	mode = "highrr",
	position = "auto-down",
	scale = "1.8",
}
---@type HL.MonitorSpec
local EXTERNAL_MONITOR_SETTINGS = {
	output = EXTERNAL_MONITOR,
	mode = "highres",
	position = "auto-up",
	scale = "1.5",
}

hl.monitor(INTERNAL_MONITOR_SETTINGS)
hl.monitor(EXTERNAL_MONITOR_SETTINGS)

---------------------------
---- DISPLAY MANAGEMENT ---
---------------------------

-- 1. Automatic Display Switching (Handles wake from suspend disconnects)
hl.on("monitor.added", function()
	-- When the external monitor is connected, switch visibility
	hl.dispatch(hl.dsp.dpms({ action = "on", monitor = EXTERNAL_MONITOR }))
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = INTERNAL_MONITOR }))
end)

hl.on("monitor.removed", function()
	-- Force restore internal panel if external monitor vanishes
	hl.dispatch(hl.dsp.dpms({ action = "on", monitor = INTERNAL_MONITOR }))
end)

-- 2. Hardware Lid Switch Bindings
hl.bind("switch:on:Lid Switch", function()
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = INTERNAL_MONITOR }))
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
	hl.dispatch(hl.dsp.dpms({ action = "on", monitor = INTERNAL_MONITOR }))
end, { locked = true })

require("theme")

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 9 do
	hl.workspace_rule({ workspace = tostring(i), default = (i == 1) })
end

--------------------------
---- ENV VARIABLES ----
--------------------------

-- Recommended variables: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#xdg-specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("GSK_RENDERER", "ngl")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("darkman run")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd(os.getenv("INPUT_METHOD") or "")
	hl.exec_cmd("keyd-application-mapper -d")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	hl.exec_cmd("easyeffects --gapplication-service")
	hl.exec_cmd("/usr/bin/kdeconnectd")
	hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("transmission-daemon")
end)

---------------------
---- LOOK & FEEL ----
---------------------

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		layout = "master",
	},

	decoration = {
		shadow = {
			enabled = false,
			range = 10,
			offset = { 1, 2 },
		},
		dim_special = 0.5,
		inactive_opacity = 0.96,
		rounding = 0,
		blur = {
			enabled = false,
		},
	},

	misc = {
		enable_swallow = true,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		swallow_regex = "^(Alacritty)$",
	},

	cursor = {
		inactive_timeout = 3,
		no_hardware_cursors = 0,
	},

	animations = {
		enabled = false,
	},

	input = {
		kb_layout = "pl",
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.4,
		},
		repeat_rate = 50,
		repeat_delay = 250,
	},
})

hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind" })

-------------------
---- GESTURES ----
-------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "fullscreen" })

-----------------
---- DEVICES ----
-----------------

for _, device_name in ipairs({
	"lenovo-trackpoint-keyboard-ii",
	"lenovo-trackpoint-keyboard-ii-mouse",
	"tpps/1-ibm-trackpoint",
	"tpps/2-ibm-trackpoint",
	"tpps/2-elan-trackpoint",
}) do
	hl.device({ name = device_name, sensitivity = -0.45 })
end

----------------------
---- WINDOW RULES ----
----------------------

-- Browser
hl.window_rule({ name = "browser-ws", match = { class = "^(.*)(firefox)(.*)$" }, workspace = "1" })
hl.window_rule({ name = "chromium-ws", match = { class = "^(.*)(chromium)(.*)$" }, workspace = "1" })

-- Terminal & CLI Explorer
hl.window_rule({ name = "terminal-ws", match = { class = "^(.*)(Alacritty)(.*)$" }, workspace = "2" })
hl.window_rule({ name = "cli-files-ws", match = { title = "^(.*)(cli_file_explorer)(.*)$" }, workspace = "2" })

-- Mail Clients
hl.window_rule({ name = "cli-mail-ws", match = { title = "^(.*)(cli_mail_client)(.*)$" }, workspace = "3" })
hl.window_rule({
	name = "gui-mail-ws",
	match = { class = "^(.*)(" .. GUI_MAIL_CLIENT .. ")(.*)$" },
	workspace = "3",
})

-- Social
hl.window_rule({
	name = "discord-ws",
	match = { class = "^(.*)(discord)(.*)$" },
	workspace = "4",
})
hl.window_rule({
	name = "line-ws",
	match = { class = "^(.*)(chrome-ophjlpahpchlmihnnnihgmmeilfjmjjc-Default)(.*)$" },
	workspace = "4",
})

-- Learning & Media
hl.window_rule({ name = "anki-ws", match = { class = "^(.*)(anki)(.*)$" }, workspace = "5" })
hl.window_rule({ name = "mpv-ws", match = { class = "^(.*)(mpv)(.*)$" }, workspace = "5" })

-- Games
hl.window_rule({ name = "nostale-ws", match = { title = "^(.*)(NosTale)(.*)$" }, workspace = "6", float = true })
hl.window_rule({ name = "steam-ws", match = { title = "^(.*)(Steam)(.*)$" }, workspace = "6", float = true })

-- Audio
hl.window_rule({ name = "easyeffects-ws", match = { class = "^(.*)(easyeffects)(.*)$" }, workspace = "9" })
hl.window_rule({ name = "calculator", match = { title = "^(.*)(Calculator)(.*)$" }, float = true, size = "20% 50%" })

hl.window_rule({
	name = "pic-in-pic-fixes",
	match = { title = "Picture-in-Picture" },
	float = true,
	pin = true,
	size = { 360, 220 },
	move = { 50, 50 },
	no_initial_focus = true,
})

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = { class = "xwaylandvideobridge" },
	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = { 1, 1 },
	opacity = 0.0,
})

---------------------
---- KEYBINDINGS ----
---------------------

local MOD = "SUPER"
local MODS = "SUPER + SHIFT"

local function small_keymap(key)
	return MOD .. " + " .. key
end
local function combo_keymap(key)
	return MODS .. " + " .. key
end

hl.bind(small_keymap("grave"), hl.dsp.exec_cmd("mute-audio"))
hl.bind(combo_keymap("grave"), hl.dsp.exec_cmd("mute-microphone"))

hl.bind(small_keymap("j"), hl.dsp.layout("cyclenext"))
hl.bind(combo_keymap("j"), hl.dsp.layout("swapnext"))
hl.bind(small_keymap("k"), hl.dsp.layout("cycleprev"))
hl.bind(combo_keymap("k"), hl.dsp.layout("swapprev"))

hl.bind(small_keymap("a"), hl.dsp.layout("addmaster"))
hl.bind(combo_keymap("a"), hl.dsp.layout("removemaster"))

hl.bind(small_keymap("h"), hl.dsp.layout("mfact -0.04"), { repeating = true })
hl.bind(combo_keymap("h"), hl.dsp.layout("mfact -0.08"), { repeating = true })
hl.bind(small_keymap("l"), hl.dsp.layout("mfact +0.04"), { repeating = true })
hl.bind(combo_keymap("l"), hl.dsp.layout("mfact +0.08"), { repeating = true })

hl.bind(small_keymap("q"), hl.dsp.window.close())
hl.bind(combo_keymap("q"), hl.dsp.exec_cmd("rofi-killall"))

hl.bind(small_keymap("comma"), hl.dsp.focus({ monitor = "+1" }))
hl.bind(combo_keymap("comma"), hl.dsp.window.move({ monitor = "+1" }))
hl.bind(small_keymap("period"), hl.dsp.focus({ monitor = "-1" }))
hl.bind(combo_keymap("period"), hl.dsp.window.move({ monitor = "-1" }))

hl.bind(small_keymap("minus"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind(combo_keymap("minus"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%-"), { repeating = true })
hl.bind(small_keymap("equal"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind(combo_keymap("equal"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%+"), { repeating = true })

hl.bind(small_keymap("backspace"), hl.dsp.exec_cmd("rofi-power-menu"))
hl.bind(combo_keymap("backspace"), hl.dsp.exec_cmd("systemctl suspend -i"))

hl.bind(small_keymap("Return"), hl.dsp.exec_cmd(TERMINAL))

hl.bind(small_keymap("w"), hl.dsp.exec_cmd(BROWSER))
hl.bind(combo_keymap("w"), hl.dsp.exec_cmd(BACKUP_BROWSER))

hl.bind(small_keymap("t"), hl.dsp.layout("orientationleft"))
hl.bind(combo_keymap("t"), hl.dsp.layout("orientationright"))

hl.bind(small_keymap("y"), hl.dsp.layout("orientationtop"))
hl.bind(combo_keymap("y"), hl.dsp.layout("orientationbottom"))

hl.bind(small_keymap("u"), hl.dsp.layout("orientationcenter"))
hl.bind(combo_keymap("u"), hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))

hl.bind(small_keymap("i"), hl.dsp.exec_cmd("light -A 10; ddcutil --display 1 setvcp 10 + 15"), { repeating = true })
hl.bind(combo_keymap("i"), hl.dsp.exec_cmd("light -U 10; ddcutil --display 1 setvcp 10 - 15"), { repeating = true })

hl.bind(small_keymap("e"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_mail_client --command " .. CLI_MAIL_CLIENT))
hl.bind(combo_keymap("e"), hl.dsp.exec_cmd(GUI_MAIL_CLIENT))

hl.bind(small_keymap("o"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_file_explorer --command " .. CLI_FILE_EXPLORER))
hl.bind(combo_keymap("o"), hl.dsp.exec_cmd(GUI_FILE_EXPLORER))

hl.bind(small_keymap("p"), hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(combo_keymap("p"), hl.dsp.exec_cmd("mpc toggle"))

hl.bind(small_keymap("bracketleft"), hl.dsp.exec_cmd("mpc seek -10"), { repeating = true })
hl.bind(combo_keymap("bracketleft"), hl.dsp.exec_cmd("mpc seek -60"), { repeating = true })
hl.bind(small_keymap("bracketright"), hl.dsp.exec_cmd("mpc seek +10"), { repeating = true })
hl.bind(combo_keymap("bracketright"), hl.dsp.exec_cmd("mpc seek +60"), { repeating = true })

hl.bind(small_keymap("backslash"), hl.dsp.exec_cmd("dunstctl close"))
hl.bind(combo_keymap("backslash"), hl.dsp.exec_cmd("dunstctl history-pop"))

hl.bind(small_keymap("slash"), hl.dsp.exec_cmd("rofi-website-bookmarks"))
hl.bind(combo_keymap("slash"), hl.dsp.exec_cmd("rofi-websearch"))

-- TODO: Add recordings to this script
hl.bind(small_keymap("s"), hl.dsp.exec_cmd("rofi-screenshot"))
hl.bind(combo_keymap("s"), hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(small_keymap("r"), hl.dsp.exec_cmd('rofi -show combi -modes combi -combi-modes "window,drun,run"'))
hl.bind(combo_keymap("r"), hl.dsp.exec_cmd("rofi-restart"))

hl.bind(small_keymap("d"), function()
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = EXTERNAL_MONITOR }))
	hl.dispatch(hl.dsp.dpms({ action = "on", monitor = INTERNAL_MONITOR }))
end)

hl.bind(combo_keymap("d"), function()
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = INTERNAL_MONITOR }))
	hl.dispatch(hl.dsp.dpms({ action = "on", monitor = EXTERNAL_MONITOR }))
end)

hl.bind(small_keymap("f"), hl.dsp.window.fullscreen())

hl.bind(small_keymap("apostrophe"), hl.dsp.workspace.toggle_special())
hl.bind(combo_keymap("apostrophe"), hl.dsp.window.move({ workspace = "special" }))

hl.bind(small_keymap("z"), hl.dsp.exec_cmd("playerctl previous"))
hl.bind(combo_keymap("z"), hl.dsp.exec_cmd("mpc prev"))
hl.bind(small_keymap("x"), hl.dsp.exec_cmd("playerctl next"))
hl.bind(combo_keymap("x"), hl.dsp.exec_cmd("mpc next"))

hl.bind(
	small_keymap("c"),
	hl.dsp.exec_cmd('cliphist list | rofi -dmenu -p "Clipboard history" | cliphist decode | wl-copy')
)
hl.bind(combo_keymap("c"), hl.dsp.exec_cmd("gnome-calculator"))

hl.bind(small_keymap("b"), hl.dsp.exec_cmd("rofi-bluetooth"))
hl.bind(combo_keymap("b"), hl.dsp.exec_cmd("blueberry"))

hl.bind(small_keymap("n"), hl.dsp.exec_cmd(TERMINAL .. " --command " .. EDITOR .. " -c VimwikiIndex"))
hl.bind(
	combo_keymap("n"),
	hl.dsp.exec_cmd(TERMINAL .. " --command " .. EDITOR .. " " .. VIMWIKI_DIR .. "/Scratchpad.md")
)

hl.bind(small_keymap("m"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_sound_manager --command " .. CLI_SOUND_MANAGER))
hl.bind(combo_keymap("m"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_music_player --command " .. CLI_MUSIC_PLAYER))

hl.bind(small_keymap("space"), hl.dsp.layout("swapwithmaster"))
hl.bind(combo_keymap("space"), hl.dsp.window.float())

hl.bind(small_keymap("v"), hl.dsp.layout("focusmaster master"))
hl.bind(combo_keymap("v"), hl.dsp.window.float())
hl.bind(combo_keymap("v"), hl.dsp.window.pin())

hl.bind(small_keymap("tab"), hl.dsp.focus({ urgent_or_last = true })) -- focuscurrentorlast

hl.bind("print", hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/pic-full-$(date '+%y%m%d-%H%M-%S').png"))

-- Switch workspaces
for i = 1, 9 do
	hl.bind(small_keymap(i), hl.dsp.focus({ workspace = i }))
	hl.bind(combo_keymap(i), hl.dsp.window.move({ workspace = i }))
end

hl.bind(small_keymap("g"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(combo_keymap("g"), hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(small_keymap("semicolon"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(combo_keymap("semicolon"), hl.dsp.window.move({ workspace = "e+1" }))

-- Move/resize windows with mouse
hl.bind(small_keymap("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(small_keymap("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Media / function keys
hl.bind("xf86audiomicmute", hl.dsp.exec_cmd("mute-microphone"), { locked = true })
hl.bind("xf86audiomute", hl.dsp.exec_cmd("mute-audio"), { locked = true })
hl.bind(
	"xf86audioraisevolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"xf86audiolowervolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("xf86audioprev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("xf86audionext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("xf86audiopause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("xf86audioplay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("xf86audiostop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
hl.bind("xf86audiorewind", hl.dsp.exec_cmd("playerctl position -10"), { locked = true, repeating = true })
hl.bind("xf86audioforward", hl.dsp.exec_cmd("playerctl position +10"), { locked = true, repeating = true })
hl.bind("xf86poweroff", hl.dsp.exec_cmd("rofi-power-menu"), { locked = true })
hl.bind("xf86calculator", hl.dsp.exec_cmd("gnome-calculator"), { locked = true })
hl.bind("xf86sleep", hl.dsp.exec_cmd("sudo -A zzz"), { locked = true })
hl.bind("xf86mail", hl.dsp.exec_cmd(GUI_MAIL_CLIENT), { locked = true })
hl.bind(
	"xf86mycomputer",
	hl.dsp.exec_cmd(TERMINAL .. " --title cli_file_explorer --command " .. CLI_FILE_EXPLORER),
	{ locked = true }
)
hl.bind(
	"xf86monbrightnessup",
	hl.dsp.exec_cmd("light -A 10; ddcutil --display 1 setvcp 10 + 15"),
	{ locked = true, repeating = true }
)
hl.bind(
	"xf86monbrightnessdown",
	hl.dsp.exec_cmd("light -U 10; ddcutil --display 1 setvcp 10 - 15"),
	{ locked = true, repeating = true }
)
