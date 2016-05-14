hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "G", function()
  hs.application.launchOrFocus("Tower")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "E", function()
  hs.application.launchOrFocus("Atom")
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

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 18, function()
  hs.mjomatic.go({
    "CCi",
    "AAM",
    "",
    "C Google Chrome",
    "i iTerm",
    "M Mail",
    "A Atom"})
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 19, function()
  hs.mjomatic.go({
    "CCCCCCCCCCCCCCCCCCCCCCCC",
    "CCCCCCCCCCCCCCCCCCCCCCCC",
    "CCCCCCCCCCCCCCCCCCCCCCCC",
    "AAAAAAAAAAAAAMMMMMMMMMMM",
    "AAAAAAAAAAAAAMMMMMMMMMMM",
    "",
    "C Google Chrome",
    "M Mail",
    "A Atom"})
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.h / 2 + max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
