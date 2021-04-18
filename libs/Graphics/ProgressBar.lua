if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Graphics then
    FINSDK.Graphics = {}
end

---
--- ProgressBar
--- 
--- Draw a progress bar.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#progressbar
---
--- @param gpu Component
--- @param fraction number
--- @param x number
--- @param y number
--- @param w number
--- @param h number
--- @param bgColor Table (RBGA Array)
--- @param fgColor Table (RBGA Array)
--- @param borderPadding number
--- @param borderColor Table (RBGA Array)
--- @param targetFraction number
--- @param targetThickness number
--- @param targetColor Table (RBGA Array)
--- @return nil
FINSDK.Graphics.ProgressBar = function (gpu, fraction, x, y, w, h, bgColor, fgColor, borderPadding, borderColor, targetFraction, targetThickness, targetColor)
    if (bgColor == nil) then
        bgColor = { 0, 0, 0, 1 }
    end

    if (fgColor == nil) then
        fgColor = { 1, 1, 1, 1 }
    end

    local hasBorder = borderPadding ~= nil
    if not hasBorder then
        borderPadding = 0
    end

    -- Compute inner dimensions (inside border after apdding is applied).
    local ix = x + (2 * borderPadding)
    local iy = y + borderPadding
    local iw = w - (4 * borderPadding)
    local ih = h - (2 * borderPadding);

    -- Draw background.
    FINSDK.Graphics.RectFill(gpu, ix, iy, iw, ih, bgColor)

    -- Draw foreground (progress).
    FINSDK.Graphics.RectFill(gpu, ix, iy, math.ceil(iw * fraction), ih, fgColor)

    -- Draw target marker.
    if (targetFraction ~= nil) then
        if (targetThickness == nil) then
            targetThickness = 1
        end

        if (targetColor == nil) then
            targetColor = { 1, 1, 1, 1 }
        end

        local xTarget = ix + math.ceil(iw * targetFraction)
        local xClampedTarget = FINSDK.Math.Clamp(xTarget, 0, iw - targetThickness + 1)
        gpu:setBackground(targetColor[1], targetColor[2], targetColor[3], targetColor[4])
        gpu:fill(xClampedTarget, iy, targetThickness, ih, " ", " ")
    end

    -- Draw border.
    if hasBorder then
        if (borderColor == nil) then
            borderColor = { 1, 1, 1, 1 }
        end

        FINSDK.Graphics.RectStroke(gpu, x, y, w, h, borderColor)
    end
end