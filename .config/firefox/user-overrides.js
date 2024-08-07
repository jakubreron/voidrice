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
