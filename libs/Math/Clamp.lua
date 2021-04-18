if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Math then
    FINSDK.Math = {}
end

---
--- Clamp
--- 
--- Ensure that the given value is constrained between the minimum and maximum value.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#progressbar
---
--- @param value number
--- @param min number
--- @param max number
--- @return nil
FINSDK.Math.Clamp = function (value, min, max)
    return math.max(min, math.min(max, value))
end
