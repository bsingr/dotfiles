-- no 0 = keycode 29
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 29, function()
  hs.mjomatic.go({
    "CCEE",
    "CCEE",
    "TTEE",
    "",
    "C Google Chrome",
    "T iTerm2",
    "E Visual Studio Code"})
end)

-- no 9 = keycode 25
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 24, function()
  hs.mjomatic.go({
    "T",
    "E",
    "E",
    "",
    "T iTerm2",
    "E Visual Studio Code"})
end)
