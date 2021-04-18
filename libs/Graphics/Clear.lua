if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Graphics then
    FINSDK.Graphics = {}
end

---
--- Clear
--- 
--- Clear a graphic display back to blank.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#clear
---
--- @param gpu Component
--- @param color Table (RBGA Array)
--- @param flush boolean
--- @return nil
FINSDK.Graphics.Clear = function (gpu, color, flush)
    if color == nil then
        color = { 0, 0, 0, 1 }
    end
    
    if flush == nil then
        flush = true
    end

    GPU:setBackground(color[1], color[2], color[3], color[4])
    GPU:fill(0, 0, 119, 30, " ", " ")


    if flush then
        GPU:flush() 
    end
end