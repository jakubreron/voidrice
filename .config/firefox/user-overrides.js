/* 5003: disable saving passwords
 * [NOTE] This does not clear any passwords already saved
 * [SETTING] Privacy & Security>Logins and Passwords>Ask to save logins and passwords for websites ***/
user_pref("signon.rememberSignons", false);

/* APPEARANCE ***/
user_pref("browser.download.autohideButton", true); // [FF57+]

/* UX BEHAVIOR ***/
user_pref("ui.key.menuAccessKey", 0); // disable alt key toggling the menu bar [RESTART]

/* UX FEATURES ***/
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
user_pref("xpinstall.signatures.required", false);

/* WARNINGS ***/
user_pref("full-screen-api.warning.timeout", 0); // disable "... is now fullscreen" warning

// 0=blank, 1=home, 2=last visited page, 3=resume previous session
user_pref("browser.startup.page", 3); // default 0

// PREF: use native title bar buttons [LINUX]
// [1] https://github.com/yokoffing/Betterfox/issues/320
user_pref("widget.gtk.non-native-titlebar-buttons.enabled", true);

// PREF: default permission for Location Requests
// 0=always ask (default), 1=allow, 2=block
user_pref("permissions.default.geo", 0);

// PREF: default permission for Web Notifications
// To add site exceptions: Page Info>Permissions>Receive Notifications
// To manage site exceptions: Options>Privacy & Security>Permissions>Notifications>Settings
// 0=always ask (default), 1=allow, 2=block
// [1] https://easylinuxtipsproject.blogspot.com/p/security.html#ID5
// [2] https://github.com/yokoffing/Betterfox/wiki/Common-Overrides#site-notifications
user_pref("permissions.default.desktop-notification", 0);

// PREF: show weather on New Tab page
user_pref("browser.newtabpage.activity-stream.showWeather", true);

// PERF: GPU acceleration everywhere
user_pref("gfx.webrender.all", true);
