if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Computer then
    FINSDK.Computer = {}
end

---
--- GetNIC
--- 
--- Get the Network Interface Card (NIC) installed in the computer, if one is installed.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#getnic
---
--- @param isCritical boolean
--- @return Component or nil
FINSDK.Computer.GetNIC = function (isCritical)
    if (isCritical == nil) then
        isCritical = true
    end
    local cNIC = component.findComponent(findClass("NetworkCard_C"))[1]
    if (cNIC == nil) then
        if (isCritical) then
            computer.panic("NIC not found.")
        else
            return nil
        end
    end

    return component.proxy(cNIC)
end
