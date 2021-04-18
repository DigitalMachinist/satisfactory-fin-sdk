if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Computer then
    FINSDK.Computer = {}
end

---
--- GetNIC
--- 
--- Get a module installed in a modular control panel by getting the module at the given location
--- in a panel.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#getmoduleonpanel
---
--- @param isCritical boolean
--- @return Component or nil
FINSDK.Computer.GetModuleOnPanel = function (panel, position, panelIndex)
    if (panelIndex == null) then
        panelIndex = 0
    end

    if (string.find(panel.internalName, "^LargeVerticalControlPanel") ~= nil) then
        return panel:getModule(position["x"], position["y"], panelIndex)
    else
        return panel:getModule(position["x"], position["y"])
    end
end
