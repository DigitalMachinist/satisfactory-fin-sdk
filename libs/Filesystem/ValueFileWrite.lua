if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Filesystem then
    FINSDK.Filesystem = {}
end

---
--- ValueFileWrite
--- 
--- Read a single-line file and return the contents of the file as a string.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#valuefilewrite
---
--- @param filepath string
--- @param value string
--- @return nil
FINSDK.Filesystem.ValueFileWrite = function (filepath, value)
    local exists = filesystem.exists(filepath)
    if (not exists or (exists and filesystem.isFile(filepath))) then
        local f = filesystem.open(filepath, "w")
        f:write(tostring(value))
        f:close()
    end
end
