-- Manage HyperKey (Keyboard shortcut layers)

-- NOTE: Caps Lock is mapped to f18 via Karabiner-Elements


local This={}

-- Hyper mode needs to be bound to a key. Here we are binding it to F17,
-- because this is yet another key that's unused.
-- Why not F18? We will use key-events from F18 to turn hyper
-- mode on and off. Using F17 as both the modal and source of key
-- events will result in a very jittery Hyper mode.

-- Hyper mode state will be stored in another (unused) function key (f17)
-- that will be toggled on and off with the hyperkey (f18)

This.hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when Hyper-key is pressed
function enterHyperMode()
    print("Entering Hyper mode")
    This.hyperMode:enter()
end

-- Leave Hyper Mode when Hyper-key is pressed
function exitHyperMode()
    print("Exiting Hyper mode")
   This.hyperMode:exit()
end

-- Bind the hyper key
hyperKey = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

-- Function to regiser hyper shortcuts
function This.bindKey(key, handler)
    This.hyperMode:bind({}, key, handler)
end

-- Function to bind with modifiers
function This.bindKeyWithModifiers(modifiers, key, handler)
    This.hyperMode:bind(modifiers, key, handler)
end

return This
