if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Computer then
    FINSDK.Computer = {}
end

---
--- GetComponentByNick
--- 
--- Get a single component on the network with the given nickname (or as a term in its nickname).
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#getcomponentbynick
---
--- @param nickname string
--- @param isCritical boolean
--- @return Component or nil
FINSDK.Computer.GetComponentByNick = function (nickname, isCritical)
    return FINSDK.Computer.GetComponentsByNick(nickname, isCritical)[1]
end
