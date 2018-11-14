require "app-switch"
require "app-layout"
require "window-move"
require "window-expand"
require "window-grid"

-- load plugins
hs.loadSpoon("DeepLTranslate")
spoon.DeepLTranslate:bindHotkeys({
  translate = {{"cmd", "alt", "ctrl", "shift"}, "L" },
})

-- setup defaults
hs.window.animationDuration = 0
hs.grid.setMargins("0 0")
hs.grid.setGrid("6x6")
hs.grid.ui.textSize = 100
hs.grid.ui.showExtraKeys = true
