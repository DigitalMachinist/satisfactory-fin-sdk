if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Filesystem then
    FINSDK.Filesystem = {}
end

---
--- RunFile
--- 
--- Execute a Lua file as code.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#runfile
---
--- @param filepath string
--- @param isCritical boolean
--- @param description string
--- @return nil
FINSDK.Filesystem.RunFile = function (filepath, isCritical, description)
    if (description == nil) then
        description = ""
    else
        description = description.." at "
    end

    if (isCritical and (not filesystem.exists(filepath) or not filesystem.isFile(filepath))) then
        computer.panic("Unable to find "..description..filepath..".")
    end

    print("Running "..description..filepath.."...")
    filesystem.doFile(filepath)
end