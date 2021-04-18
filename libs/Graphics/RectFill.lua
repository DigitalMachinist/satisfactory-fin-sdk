if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Graphics then
    FINSDK.Graphics = {}
end

---
--- RectFill
--- 
--- Draw a filled rectangle to a display by colouring the backgrounds of characters on the
--- display's character grid.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#rectfill
---
--- @param gpu Component
--- @param x number
--- @param y number
--- @param w number
--- @param h number
--- @param color Table (RBGA Array)
--- @return nil
FINSDK.Graphics.RectFill = function (gpu, x, y, w, h, color)
    if (color == nil) then
        color = { 1.0, 1.0, 1.0, 1.0 }
    end

    gpu:setBackground(color[1], color[2], color[3], color[4])
    gpu:fill(x, y, w, h, " ", " ")
end