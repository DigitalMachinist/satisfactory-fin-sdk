if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Graphics then
    FINSDK.Graphics = {}
end

---
--- RectOutline
--- 
--- Draw the perimeter/outline of a rectangle to a display by colouring the backgrounds of
--- characters on the display's character grid.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#rectoutline
---
--- @param gpu Component
--- @param x number
--- @param y number
--- @param w number
--- @param h number
--- @param color Table (RBGA Array)
--- @return nil
FINSDK.Graphics.RectOutline = function (gpu, x, y, w, h, color)
    if (color == nil) then
        color = { 1.0, 1.0, 1.0, 1.0 }
    end

    gpu:setBackground(color[1], color[2], color[3], color[4])
    gpu:fill(x,   y,     w, 1,   " ", " ") -- Top
    gpu:fill(x,   y+h-1, w, 1,   " ", " ") -- Bottom
    gpu:fill(x,   y+1,   1, h-2, " ", " ") -- Left
    gpu:fill(w-1, y+1,   1, h-2, " ", " ") -- Right
end