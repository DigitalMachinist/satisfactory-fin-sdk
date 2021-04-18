if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Filesystem then
    FINSDK.Filesystem = {}
end

---
--- ValueFileRead
--- 
--- Read a single-line file and return the contents of the file as a string.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#valuefileread
---
--- @param filepath string
--- @return nil
FINSDK.Filesystem.ValueFileRead = function (filepath)
    if (filesystem.exists(filepath) and filesystem.isFile(filepath)) then
        local f = filesystem.open(filepath, "r")
        local value = f:read("*all")
        f:close()

        return value
    end

    return nil
end
