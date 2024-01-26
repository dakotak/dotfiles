

function openApp(appName)
    app = hs.application.open(appName, 10, true)
    windowFilter = hs.window.filter.new(appName)
    print("Opened " .. appName)
    windows = windowFilter:getWindows()
    print(hs.inspect.inspect(windows))
end

function foo()
    -- local screen = hs.screen{x=0, y=1}
    -- local filter = hs.window.filter.new(false):setAppFilter('Slack', {allowScreens={{x=0, y=1}}})
    local filter = hs.window.filter.new(false):setAppFilter('Slack')
    local windows = filter:getWindows()
    
    -- local filter = hs.window.filter.new('Slack')
    local vals = hs.fnutils.map(windows, function(w)
        print(hs.inspect.inspect(w))
        return {
            title = w:title(),
            subText = w:application():title(),
            role = w:role(),
            subrole = w:subrole(),
            tabcount = w:tabCount(),
            screenName = w:screen():name(),

        }
    end)
    print(hs.inspect.inspect(vals))
end


-- 1. Open Slack
-- 2. Find the bottom screen
-- 3. Move Slack to the bottom screen and fullscreen application