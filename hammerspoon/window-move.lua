hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 18, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[1]
  win:move(screen:frame(), screen)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 19, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[2]
  win:move(screen:frame(), screen)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 20, function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.allScreens()[3]
  win:move(screen:frame(), screen)
end)

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
