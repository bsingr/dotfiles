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
