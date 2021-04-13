--
-- Hammerspoon Config for Hyper-Capslock-Key
-- (Karabiner-Elements required)
-- (c) 2014-2021 bsingr
--

--
-- setup defaults
--

-- disable slowish animations
hs.window.animationDuration = 0

--
-- expand/collapse active iTerm pane
--

local function pressFn(mods, key)
  if key == nil then
    key = mods
    mods = {}
  end
  return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remap(mods, key, pressFn)
  hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

remap({"cmd", "alt", "ctrl", "shift"}, "delete", pressFn({"cmd", "shift"}, "Return"))

--
-- window expand
--

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

-- cycle through all windows of the current application
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "space", function()
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
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 18, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[1]:frame(), screen)
end)
-- no 2 = keycode 19
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 19, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[2]:frame(), screen)
end)
-- no 3 = keycode 20
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 20, function()
  hs.window.focusedWindow():move(hs.screen.allScreens()[3]:frame(), screen)
end)

--
-- window move onscreen position
--

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.h / 2 + max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

--
-- application switcher
--

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "G", function()
  hs.application.launchOrFocus("Tower")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "C", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "X", function()
  hs.application.launchOrFocus("Xcode")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "E", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "B", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "N", function()
  hs.application.launchOrFocus("Messages")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "M", function()
  hs.application.launchOrFocus("Mail")
end)

