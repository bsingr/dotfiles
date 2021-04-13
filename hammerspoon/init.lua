--
-- setup defaults
--

hs.window.animationDuration = 0
hs.grid.setMargins("0 0")
hs.grid.setGrid("6x6")
hs.grid.ui.textSize = 100
hs.grid.ui.showExtraKeys = true

--
-- window expand
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
  local win = hs.window.focusedWindow()
  win:toggleFullScreen()
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

-- no 1 = keycode 18
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 18, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[1]
  win:move(screen:frame(), screen)
end)

-- no 2 = keycode 19
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 19, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[2]
  win:move(screen:frame(), screen)
end)

-- no 3 = keycode 20
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 20, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[3]
  win:move(screen:frame(), screen)
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

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "S", function()
  hs.application.launchOrFocus("Slack")
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

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "V", function()
  hs.application.launchOrFocus("BlueJeans")
end)
