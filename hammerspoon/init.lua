-- Hammerspoon Config for Hyper-Capslock-Key
-- (Karabiner-Elements required)
-- (c) 2014-2021 bsingr

-- disable slowish animations
hs.window.animationDuration = 0

-- define hyper
HYPER_KEY = {"cmd", "alt", "ctrl", "shift"}

-- [Use-case] Expand focused window to full-screen
hs.hotkey.bind(HYPER_KEY, "Return", function()
  hs.window.focusedWindow():setFrame(hs.window.focusedWindow():screen():frame())
end)
hs.hotkey.bind(HYPER_KEY, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

-- [Use-case] Move focused window to specific screen
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind(HYPER_KEY, 18, function() -- screen key 1 = keycode 18
  hs.window.focusedWindow():move(hs.screen.allScreens()[1]:frame(), screen)
end)
hs.hotkey.bind(HYPER_KEY, 19, function() -- screen key 2 = keycode 19
  hs.window.focusedWindow():move(hs.screen.allScreens()[2]:frame(), screen)
end)
hs.hotkey.bind(HYPER_KEY, 20, function() -- screen key 3 = keycode 20
  hs.window.focusedWindow():move(hs.screen.allScreens()[3]:frame(), screen)
end)

-- [Use-case] Move focused window within current screen
hs.hotkey.bind(HYPER_KEY, "Up", function()
  local f = hs.window.focusedWindow():screen():frame()
  f.h = f.h / 2
  hs.window.focusedWindow():setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Down", function()
  local f = hs.window.focusedWindow():screen():frame()
  f.y = f.h / 2 + f.y
  f.h = f.h / 2
  hs.window.focusedWindow():setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Left", function()
  local f = hs.window.focusedWindow():screen():frame()
  f.w = f.w / 2
  hs.window.focusedWindow():setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Right", function()
  local f = hs.window.focusedWindow():screen():frame()
  f.x = f.w / 2
  f.w = f.w / 2
  hs.window.focusedWindow():setFrame(f)
end)

-- [Use-case] Launch or focus specific Application
local function bindAppSwitch(key, appName)
  hs.hotkey.bind(HYPER_KEY, key, function()
    hs.application.launchOrFocus(appName)
  end)  
end
bindAppSwitch("G", "Tower")
bindAppSwitch("T", "iTerm")
bindAppSwitch("R", "Terminal")
bindAppSwitch("F", "Firefox")
bindAppSwitch("C", "Microsoft Teams")
bindAppSwitch("X", "Xcode")
bindAppSwitch("E", "Visual Studio Code")
bindAppSwitch("B", "Google Chrome")
bindAppSwitch("N", "Messages")
bindAppSwitch("M", "Mail")

-- [Use-case] Cycle through all windows of focused application
-- note: focused window is always at position #1
hs.hotkey.bind(HYPER_KEY, "space", function()
  local app = hs.application.frontmostApplication()
  local max = #app:allWindows()
  app:allWindows()[max]:focus()
end)

-- [Use-case] Cycle back 1 window of focused application
-- note: not easy to implement a proper cycle back all
-- note: focused window is always at position #1
hs.hotkey.bind(HYPER_KEY, "delete", function()
  local app = hs.application.frontmostApplication()
  local max = #app:allWindows()
  if max > 1 then -- only cycle back if more than 1 window available
    app:allWindows()[2]:focus()
  end
end)
