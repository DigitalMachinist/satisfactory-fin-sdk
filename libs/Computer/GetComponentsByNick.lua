if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Computer then
    FINSDK.Computer = {}
end

---
--- GetComponentsByNick
--- 
--- Get all components on the network with the given nickname (or as a term in their nicknames).
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#getcomponentsbynick
---
--- @param nickname string
--- @param isCritical boolean
--- @return Table (Array of Components)
FINSDK.Computer.GetComponentsByNick = function (nickname, isCritical)
    if (isCritical == nil) then
        isCritical = true
    end
    local cComponents = component.findComponent(nickname)
    if (cComponents == nil) then
        if (isCritical) then
            computer.panic("No components matching "..nickname.." were found.")
        else
            return {}
        end
    end

    return component.proxy(cComponents)
end
