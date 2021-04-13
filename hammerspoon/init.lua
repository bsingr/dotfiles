--
-- Hammerspoon Config for Hyper-Capslock-Key
-- (Karabiner-Elements required)
-- (c) 2014-2021 bsingr
--

-- disable slowish animations
hs.window.animationDuration = 0

HYPER_KEY = {"cmd", "alt", "ctrl", "shift"}

--
-- window expand
--
hs.hotkey.bind(HYPER_KEY, "Return", function()
  hs.window.focusedWindow():setFrame(hs.window.focusedWindow():screen():frame())
end)
hs.hotkey.bind(HYPER_KEY, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

--
-- cycle through all windows of the current application
--
hs.hotkey.bind(HYPER_KEY, "space", function()
  local app = hs.application.frontmostApplication()
  local current = 1
  local next = current
  for i, window in pairs(app:allWindows()) do
    if app:focusedWindow() == app:allWindows()[i] then
      current = i
    end
    if i > current then
      next = i
    end
  end
  app:allWindows()[next]:focus()
end)

--
-- window move screens
--
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
-- no 1 = keycode 18
hs.hotkey.bind(HYPER_KEY, 18, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[1]:frame(), screen)
end)
-- no 2 = keycode 19
hs.hotkey.bind(HYPER_KEY, 19, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[2]:frame(), screen)
end)
-- no 3 = keycode 20
hs.hotkey.bind(HYPER_KEY, 20, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[3]:frame(), screen)
end)

--
-- window move onscreen position
--
hs.hotkey.bind(HYPER_KEY, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:screen():frame()
  f.h = f.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:screen():frame()
  f.y = f.h / 2 + f.y
  f.h = f.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:screen():frame()
  f.w = f.w / 2
  win:setFrame(f)
end)
hs.hotkey.bind(HYPER_KEY, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:screen():frame()
  f.x = f.w / 2
  f.w = f.w / 2
  win:setFrame(f)
end)

--
-- application switcher
--
local function bindAppSwitch(key, appName)
  hs.hotkey.bind(HYPER_KEY, key, function()
    hs.application.launchOrFocus(appName)
  end)  
end
bindAppSwitch("G", "Tower")
bindAppSwitch("T", "iTerm")
bindAppSwitch("C", "Microsoft Teams")
bindAppSwitch("X", "Xcode")
bindAppSwitch("E", "Visual Studio Code")
bindAppSwitch("B", "Google Chrome")
bindAppSwitch("N", "Messages")
bindAppSwitch("M", "Mail")
