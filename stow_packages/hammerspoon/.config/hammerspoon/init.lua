

--- To Update the config file location, run the following command:
--- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
--- source: https://github.com/Hammerspoon/hammerspoon/issues/1734

print("Loading Hammerspoon config...")

-- Reload config automatically
local configFileWatcher
function reloadConfig()
print("Reloading Hammerspoon config...")
  configFileWatcher:stop()
  configFileWatcher = nil
  hs.reload()
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig)
configFileWatcher:start()

---------- Load 3rd party Spoons -----------------------------------------------
--------------------------------------------------------------------------------
hs.loadSpoon("Caffeine")


---------- Load Modules --------------------------------------------------------
--------------------------------------------------------------------------------
local hyper = require('hyper')

require('window-management')
require('functions')


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

-- Slack
hyper.bindKey('s', function()
    launchOrFocus("Slack")
end)

-- Signal
hyper.bindKey('i', function()
    launchOrFocus("Signal")
end)

-- iTerm
hyper.bindKey('t', function()
    -- TODO: Make this always go to a specific iTerm window (first, or maybe fullscreen)
    launchOrFocus("iTerm")
end)

-- Zoom
hyper.bindKey('z', function()
    launchOrFocus("zoom.us")
end)

-- Spotify
hyper.bindKey('p', function()
    launchOrFocus("Spotify")
end)

-- Obsidian
hyper.bindKey('o', function()
    launchOrFocus("Obsidian")
end)

-- New iTerm Window
hyper.bindKey('i', function()
    local app = hs.application.get("iTerm")
    if app then
        app:selectMenuItem({"Shell", "New Window"})
    else
        launchOrFocus("iTerm")
    end
end)
