

--- To Update the config file location, run the following command:
--- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
--- source: https://github.com/Hammerspoon/hammerspoon/issues/1734

print("Loading Hammerspoon config... YAYAYAYAYAYAYA")


---------- Load 3rd party Spoons -----------------------------------------------
--------------------------------------------------------------------------------
hs.loadSpoon("Caffeine")


---------- Load Modules --------------------------------------------------------
--------------------------------------------------------------------------------
local hyper = require('hyper')

require('window-management')


---------- Hypermode hotkeys ---------------------------------------------------
--------------------------------------------------------------------------------
-- Hammerspoon reload
hyper.bindKey('r', function()
    hs.reload()
    hs.alert.show("Config Reloaded")
end)

-- Grid window management
hyper.bindKey('space', hs.grid.toggleShow)
hyper.bindKey('h', hs.grid.pushWindowLeft)
hyper.bindKey('j', hs.grid.pushWindowDown)
hyper.bindKey('k', hs.grid.pushWindowUp)
hyper.bindKey('l', hs.grid.pushWindowRight)


---------- GOTO Application Hotkeys --------------------------------------------
--------------------------------------------------------------------------------

hyper.bindKey('s', function()
    hs.application.launchOrFocus("Slack")
end)

hyper.bindKey('i', function()
    hs.application.launchOrFocus("Signal")
end)

hyper.bindKey('t', function()
    hs.application.launchOrFocus("iTerm")
end)

hyper.bindKey('z', function()
    hs.application.launchOrFocus("zoom.us")
end)

hyper.bindKey('p', function()
    hs.application.launchOrFocus("Spotify")
end)