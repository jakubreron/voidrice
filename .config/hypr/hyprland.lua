local INTERNAL_MONITOR = "desc:Samsung Display Corp. 0x4193"
local EXTERNAL_MONITOR = "desc:LG Electronics LG Monitor 0x01010101"

local INTERNAL_MONITOR_SETTINGS = {
	output = INTERNAL_MONITOR,
	mode = "highrr",
	position = "auto-down",
	scale = "1.8",
}
local EXTERNAL_MONITOR_SETTINGS = {
	output = EXTERNAL_MONITOR,
	mode = "highres",
	position = "auto-up",
	scale = "1.5",
}

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor(INTERNAL_MONITOR_SETTINGS)
hl.monitor(EXTERNAL_MONITOR_SETTINGS)

local function set_monitor(s)
	return hl.dsp.exec_cmd(
		string.format(
			'hyprctl eval \'hl.monitor({ output = "%s", mode = "%s", position = "%s", scale = "%s" })\'',
			s.output,
			s.mode,
			s.position,
			s.scale
		)
	)
end

local function disable_monitor(output)
	return hl.dsp.exec_cmd(string.format("hyprctl eval 'hl.monitor({ output = \"%s\", disabled = true })'", output))
end

-- hl.bind("switch:on:Lid Switch", disable_monitor(INTERNAL_MONITOR), { locked = true })
-- hl.bind("switch:off:Lid Switch", set_monitor(INTERNAL_MONITOR_SETTINGS), { locked = true })

require("theme")

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 8 do
	hl.workspace_rule({ workspace = tostring(i), monitor = EXTERNAL_MONITOR, default = (i == 1) })
end
hl.workspace_rule({ workspace = "9", monitor = INTERNAL_MONITOR, default = true })

--------------------------
---- ENV VARIABLES ----
--------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GSK_RENDERER", "ngl")
hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("darkman run")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd(os.getenv("INPUT_METHOD"))
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
		gaps_in = 2,
		gaps_out = 4,
		layout = "master",
	},

	decoration = {
		shadow = {
			enabled = false,
			range = 10,
			offset = "1 2",
		},
		dim_special = 0.5,
		inactive_opacity = 0.96,
		rounding = 4,
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
-- NOTE: $GUI_MAIL_CLIENT is resolved at runtime; read from env
hl.window_rule({
	name = "gui-mail-ws",
	match = { class = "^(.*)(" .. (os.getenv("GUI_MAIL_CLIENT") or "") .. ")(.*)$" },
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
	move = "70% 72%",
	size = "30% 28%",
	no_initial_focus = true,
})

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = { class = "xwaylandvideobridge" },
	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = "1 1",
	opacity = 0.0,
})

---------------------
---- KEYBINDINGS ----
---------------------

local MOD = "SUPER"
local MODS = "SUPER + SHIFT"

local function mod(key)
	return MOD .. " + " .. key
end
local function mods(key)
	return MODS .. " + " .. key
end

local TERMINAL = os.getenv("TERMINAL")
local BROWSER = os.getenv("BROWSER")
local BACKUP_BROWSER = os.getenv("BACKUP_BROWSER")
local EDITOR = os.getenv("EDITOR")
local VIMWIKI_DIR = os.getenv("VIMWIKI_DIR")
local CLI_MAIL_CLIENT = os.getenv("CLI_MAIL_CLIENT")
local GUI_MAIL_CLIENT = os.getenv("GUI_MAIL_CLIENT")
local CLI_FILE_EXPLORER = os.getenv("CLI_FILE_EXPLORER")
local GUI_FILE_EXPLORER = os.getenv("GUI_FILE_EXPLORER")
local CLI_SOUND_MANAGER = os.getenv("CLI_SOUND_MANAGER")
local CLI_MUSIC_PLAYER = os.getenv("CLI_MUSIC_PLAYER")

hl.bind(mod("grave"), hl.dsp.exec_cmd("mute-audio"))
hl.bind(mods("grave"), hl.dsp.exec_cmd("mute-microphone"))

hl.bind(mod("j"), hl.dsp.layout("cyclenext"))
hl.bind(mods("j"), hl.dsp.layout("swapnext"))
hl.bind(mod("k"), hl.dsp.layout("cycleprev"))
hl.bind(mods("k"), hl.dsp.layout("swapprev"))

hl.bind(mod("a"), hl.dsp.layout("addmaster"))
hl.bind(mods("a"), hl.dsp.layout("removemaster"))

hl.bind(mod("h"), hl.dsp.layout("mfact -0.04"), { repeating = true })
hl.bind(mods("h"), hl.dsp.layout("mfact -0.08"), { repeating = true })
hl.bind(mod("l"), hl.dsp.layout("mfact +0.04"), { repeating = true })
hl.bind(mods("l"), hl.dsp.layout("mfact +0.08"), { repeating = true })

hl.bind(mod("q"), hl.dsp.window.close())
hl.bind(mods("q"), hl.dsp.exec_cmd("rofi-killall"))

hl.bind(mod("comma"), hl.dsp.focus({ monitor = "+1" }))
hl.bind(mods("comma"), hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mod("period"), hl.dsp.focus({ monitor = "-1" }))
hl.bind(mods("period"), hl.dsp.window.move({ monitor = "-1" }))

hl.bind(mod("minus"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind(mods("minus"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%-"), { repeating = true })
hl.bind(mod("equal"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind(mods("equal"), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%+"), { repeating = true })

hl.bind(mod("backspace"), hl.dsp.exec_cmd("rofi-power-menu"))
hl.bind(mods("backspace"), hl.dsp.exec_cmd("systemctl suspend -i"))

hl.bind(mod("Return"), hl.dsp.exec_cmd(TERMINAL))

hl.bind(mod("w"), hl.dsp.exec_cmd(BROWSER))
hl.bind(mods("w"), hl.dsp.exec_cmd(BACKUP_BROWSER))

hl.bind(mod("t"), hl.dsp.layout("orientationleft"))
hl.bind(mods("t"), hl.dsp.layout("orientationright"))

hl.bind(mod("y"), hl.dsp.layout("orientationtop"))
hl.bind(mods("y"), hl.dsp.layout("orientationbottom"))

hl.bind(mod("u"), hl.dsp.layout("orientationcenter"))
hl.bind(mods("u"), hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))

hl.bind(mod("i"), hl.dsp.exec_cmd("light -A 10; ddcutil --display 1 setvcp 10 + 15"), { repeating = true })
hl.bind(mods("i"), hl.dsp.exec_cmd("light -U 10; ddcutil --display 1 setvcp 10 - 15"), { repeating = true })

hl.bind(mod("e"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_mail_client --command " .. CLI_MAIL_CLIENT))
hl.bind(mods("e"), hl.dsp.exec_cmd(GUI_MAIL_CLIENT))

hl.bind(mod("o"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_file_explorer --command " .. CLI_FILE_EXPLORER))
hl.bind(mods("o"), hl.dsp.exec_cmd(GUI_FILE_EXPLORER))

hl.bind(mod("p"), hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mods("p"), hl.dsp.exec_cmd("mpc toggle"))

hl.bind(mod("bracketleft"), hl.dsp.exec_cmd("mpc seek -10"), { repeating = true })
hl.bind(mods("bracketleft"), hl.dsp.exec_cmd("mpc seek -60"), { repeating = true })
hl.bind(mod("bracketright"), hl.dsp.exec_cmd("mpc seek +10"), { repeating = true })
hl.bind(mods("bracketright"), hl.dsp.exec_cmd("mpc seek +60"), { repeating = true })

hl.bind(mod("backslash"), hl.dsp.exec_cmd("dunstctl close"))
hl.bind(mods("backslash"), hl.dsp.exec_cmd("dunstctl history-pop"))

hl.bind(mod("slash"), hl.dsp.exec_cmd("rofi-website-bookmarks"))
hl.bind(mods("slash"), hl.dsp.exec_cmd("rofi-websearch"))

-- TODO: Add recordings to this script
hl.bind(mod("s"), hl.dsp.exec_cmd("rofi-screenshot"))
hl.bind(mods("s"), hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(mod("r"), hl.dsp.exec_cmd('rofi -show combi -modes combi -combi-modes "window,drun,run"'))
hl.bind(mods("r"), hl.dsp.exec_cmd("rofi-restart"))

hl.bind(mod("d"), disable_monitor(EXTERNAL_MONITOR))
hl.bind(mod("d"), set_monitor(INTERNAL_MONITOR_SETTINGS))
hl.bind(mods("d"), set_monitor(EXTERNAL_MONITOR_SETTINGS))
hl.bind(mods("d"), disable_monitor(INTERNAL_MONITOR))

hl.bind(mod("f"), hl.dsp.window.fullscreen())

hl.bind(mod("apostrophe"), hl.dsp.workspace.toggle_special())
hl.bind(mods("apostrophe"), hl.dsp.window.move({ workspace = "special" }))

hl.bind(mod("z"), hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mods("z"), hl.dsp.exec_cmd("mpc prev"))
hl.bind(mod("x"), hl.dsp.exec_cmd("playerctl next"))
hl.bind(mods("x"), hl.dsp.exec_cmd("mpc next"))

hl.bind(mod("c"), hl.dsp.exec_cmd('cliphist list | rofi -dmenu -p "Clipboard history" | cliphist decode | wl-copy'))
hl.bind(mods("c"), hl.dsp.exec_cmd("gnome-calculator"))

hl.bind(mod("b"), hl.dsp.exec_cmd("rofi-bluetooth"))
hl.bind(mods("b"), hl.dsp.exec_cmd("blueberry"))

hl.bind(mod("n"), hl.dsp.exec_cmd(TERMINAL .. " --command " .. EDITOR .. " -c VimwikiIndex"))
hl.bind(mods("n"), hl.dsp.exec_cmd(TERMINAL .. " --command " .. EDITOR .. " " .. VIMWIKI_DIR .. "/Scratchpad.md"))

hl.bind(mod("m"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_sound_manager --command " .. CLI_SOUND_MANAGER))
hl.bind(mods("m"), hl.dsp.exec_cmd(TERMINAL .. " --title cli_music_player --command " .. CLI_MUSIC_PLAYER))

hl.bind(mod("space"), hl.dsp.layout("swapwithmaster"))
hl.bind(mods("space"), hl.dsp.window.float())

hl.bind(mod("v"), hl.dsp.layout("focusmaster master"))
hl.bind(mods("v"), hl.dsp.window.float())
hl.bind(mods("v"), hl.dsp.window.pin())

hl.bind(mod("tab"), hl.dsp.focus({ urgent_or_last = true })) -- focuscurrentorlast

hl.bind("print", hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/pic-full-$(date '+%y%m%d-%H%M-%S').png"))

-- Switch workspaces
for i = 1, 9 do
	hl.bind(mod(i), hl.dsp.focus({ workspace = i }))
	hl.bind(mods(i), hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod("g"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mods("g"), hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod("semicolon"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mods("semicolon"), hl.dsp.window.move({ workspace = "e+1" }))

-- Move/resize windows with mouse
hl.bind(mod("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(mod("mouse:273"), hl.dsp.window.resize(), { mouse = true })

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
