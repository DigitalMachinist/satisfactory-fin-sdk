if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Computer then
    FINSDK.Computer = {}
end

---
--- GetGPU
--- 
--- Get the Graphics Processing Unit (GPU) installed in the computer, if one is installed.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#getgpu
---
--- @param isCritical boolean
--- @return Component or nil
FINSDK.Computer.GetGPU = function (isCritical)
    if (isCritical == nil) then
        isCritical = true
    end
    local gpu = computer.getGPUs()[1]
    if (gpu == nil) then
        if (isCritical) then
            computer.panic("GPU not found.")
        else
            return nil
        end
    end

    return gpu
end
