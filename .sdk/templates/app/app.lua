---------------------------------------------------------------------------------------------------
-- app.lua
---------------------------------------------------------------------------------------------------
-- This is the entrypoint of your FIN computer code. It gets called from eeprom.lua after the 
-- filesystem boots and the drive this code is on gets mounted.
--
-- You cannot rename this file. If you do, your computer won't run this code.
---------------------------------------------------------------------------------------------------

function PrintTest()
    print("App code ran!")
end

function App()
    -- Write your computer code in here!
    -- For now we'll just print to the terminal so we can see that the app starts up!
    PrintTest()
end

-- Call App() so the app code actually executes.
App()
