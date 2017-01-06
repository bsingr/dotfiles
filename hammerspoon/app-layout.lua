-- no 0 = keycode 29
-- http://macbiblioblog.blogspot.de/2014/12/key-codes-for-function-and-special-keys.html
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, 29, function()
  hs.mjomatic.go({
    "CCAA",
    "CCAA",
    "TTAA",
    "",
    "C Google Chrome",
    "T iTerm2",
    "A Atom"})
end)
