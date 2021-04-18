# Library Functions Reference

[Back to docs index](./README.md)

The libary of functions included with FINSDK is not the main goal of the project at this time, and as such is serves more as a demostration of how to write your own library functions than it is a complete library in itself. Feel free to use and modify these functions to your needs. I'll continue adding to this over time as I write more code that I think is universally valuable.

Library functions are organized by namespace.

## `Computer` Namespace

### [`GetComponentByNick`](#getcomponentbynick)

Get a single component on the network with the given nickname (or as a term in its nickname). This behave nearly the same as [`GetComponentsByNick`](#getcomponentsbynick) function, but returns only a single element. This is convenient when you know you'll only find one.

See [this video](https://www.youtube.com/watch?v=iCQAO7VWu-g) for more info about querying for network components in FIN.

#### Examples

```lua
-- FINSDK.Computer.GetComponentByNick(nickname, isCritical = false)

-- Find a single component that has "panel" in its nickname.
component = FINSDK.Computer.GetComponentByNick("panel")

-- Find a single component that has *both* "kekw" AND "rip" in its nickname.
component = FINSDK.Computer.GetComponentByNick("kekw rip")
```

#### Properties

- `nickname` : The nickname to query for.
- `isCritical` (optional, default = `false`) : When set to true, the `computer.panic()` signal will be sent to halt the computer if no components match the query.

#### Return

Component or `nil`

[Source code](../libs/Computer/GetComponentByNick.lua)

---

### [`GetComponentsByNick`](#getcomponentsbynick)

Get all components on the network with the given nickname (or as a term in their nicknames).

See [this video](https://www.youtube.com/watch?v=iCQAO7VWu-g) for more info about querying for network components in FIN.

#### Examples

```lua
-- FINSDK.Computer.GetComponentsByNick(nickname, isCritical = false)

-- Find components that have "panel" in their nickname.
components = FINSDK.Computer.GetComponentsByNick("panel")

-- Find components that have *both* "kekw" AND "rip" in their nickname.
components = FINSDK.Computer.GetComponentsByNick("kekw rip")
```

#### Properties

- `nickname` : The nickname to query for.
- `isCritical` (optional, default = `false`) : When set to true, the `computer.panic()` signal will be sent to halt the computer if no components match the query.

#### Return

Table of Components or Empty Table

[Source code](../libs/Computer/GetComponentsByNick.lua)

---

### [`GetGPU`](#getgpu)

Get the Graphics Processing Unit (GPU) installed in the computer, if one is installed.

#### Examples

```lua
-- FINSDK.Computer.GetGPU(isCritical = false)

-- Continue even if GPU is missing.
gpu = FINSDK.Computer.GetGPU()

-- Panic if no GPU is installed.
gpu = FINSDK.Computer.GetGPU(true)
```

#### Properties

- `isCritical` (optional, default = `false`) : When set to true, the `computer.panic()` signal will be sent to halt the computer if no GPU is installed in the computer.

#### Return

GPU Component or `nil`

[Source code](../libs/Computer/GetGPU.lua)

---

### [`GetModuleOnPanel`](#getmoduleonpanel)

Get a module installed in a modular control panel by getting the module at the given location in a panel. As long as the given position on the panel is inside the module's shape, it will be returned.

#### Examples

```lua
-- FINSDK.Computer.GetModuleOnPanel(panel, position, panelIndex = 0)

-- Small modular control panel.
smallPanel = FINSDK.Computer.GetComponentByNick("<panel_name>")
pos = { x = 2, y = 4 }
module = FINSDK.Computer.GetModuleOnPanel(smallPanel, pos)

-- Large vertical control panel needs panelIndex set.
largeVerticalPanel = FINSDK.Computer.GetComponentByNick("<panel_name>")
module = FINSDK.Computer.GetModuleOnPanel(largeVerticalPanel, pos, 2) -- Top surface
```

#### Properties

- `panel` : The panel component to search for a module.
- `position` : A table with `x` and `y` properties set to the coordinate position of the module to return from the panel.
- `panelIndex` (optional, default = `0`): If searching a Large Vertical Control Panel (with 3 panel surfaces), this specifies the index of which surface to search within. [0 = Bottom, 1 = Middle, 2 = Top]

#### Return

Module component or `nil`

[Source code](../libs/Computer/GetModuleOnPanel.lua)

---

### [`GetNIC`](#getnic)

Get the Network Interface Card (NIC) installed in the computer, if one is installed.

#### Examples

```lua
-- FINSDK.Computer.GetNIC(isCritical = false)

-- Continue even if NIC is missing.
nic = FINSDK.Computer.GetNIC()

-- Panic if no NIC is installed.
nic = FINSDK.Computer.GetNIC(true)
```

#### Properties

- `isCritical` (optional, default = `false`) : When set to true, the `computer.panic()` signal will be sent to halt the computer if no NIC is installed in the computer.

#### Return

NIC Component or `nil`

[Source code](../libs/Computer/GetNIC.lua)

---

## `Event` Namespace

### [`FlushQueue`](#flushqueue)

Pop all messages from the event queue, ignoring all of them, until none are left. This is useful when starting up a computer to get to a clean state by ignoring any panel input that happened before bootup, for example.

#### Examples

```lua
FINSDK.Event.FlushQueue()
```

#### Parameters

None

#### Return

None

[Source code](../libs/Event/FlushQueue.lua)

---

## `Filesystem` Namespace

### [`RunFile`](#runfile)

Execute a Lua file as code. This allows you to call other Lua files from `app.lua` so you can decompose your app into several files to keep units of code more manageable.

The EEPROM bootloader will automatically mount each drive with the alias "primary", so all file paths must be prefixed with `/primary`, then followed by the path to the file from the root of the built drive folder.

#### Examples

```lua
--FINSDK.Filesystem.RunFile(filepath, isCritical = false, description = "")

-- Basic call to run a file.
FINSDK.Filesystem.RunFile("/primary/drive.lua")

-- Panic if the file doesn't run and include a custom decription to display.
FINSDK.Filesystem.RunFile("/primary/drive.lua", true, "drive config file")
```

#### Parameters

- `filepath` : The filepath to the Lua file to be run.
- `isCritical` (optional, default = `false`) : When set to true, the `computer.panic()` signal will be sent to halt the computer if the file can't be found or otherwise fails to run.
- `description` (optional, default = `""`) : A custom decription of the file that will be used in terminal messages.

#### Return

None

[Source code](../libs/Filesystem/RunFile.lua)

---

### [`ValueFileRead`](#valuefileread)

Read a single-line file and return the contents of the file as a string. This is meant to interact with files that store single values to the `/data` folder to persist values the app should maintain between reboots.

The EEPROM bootloader will automatically mount each drive with the alias "primary", so all file paths must be prefixed with `/primary`, then followed by the path to the file from the root of the built drive folder.

#### Examples

```lua
--FINSDK.Filesystem.ValueFileRead(filepath)

FINSDK.Filesystem.ValueFileRead("/primary/data/NumPartsPassedThisPoint.lua")
```

#### Parameters

- `filepath` : The filepath of the file to be read.

#### Return

`string`

[Source code](../libs/Filesystem/ValueFileRead.lua)

---

### [`ValueFileWrite`](#valuefilewrite)

Write a single-line string to a file. This is meant to interact with files that store single values to the `/data` folder to persist values the app should maintain between reboots.

The EEPROM bootloader will automatically mount each drive with the alias "primary", so all file paths must be prefixed with `/primary`, then followed by the path to the file from the root of the built drive folder.

#### Examples

```lua
--FINSDK.Filesystem.ValueFileWrite(filepath, value)

FINSDK.Filesystem.ValueFileWrite("/primary/data/NumPartsPassedThisPoint.lua", "9001")
```

#### Parameters

- `filepath` : The filepath of file to be written.
- `value` : The value to write to the file.

#### Return

None

[Source code](../libs/Filesystem/ValueFileWrite.lua)

---

## `Graphics` Namespace

### [`Clear`](#clear)

Clear a graphic display back to blank. The colour to fill with can be specified but by default, the display will be filled to black [0,0,0,1].

By default, calling this function does not automatically flush the GPU to draw the display buffer to the screen. You either need to call `gpu::flush()` after this, or set the `flush` paramter to `true` so that the screen redraws as cleared.

#### Examples

```lua
--FINSDK.Graphics.Clear(gpu, color = {0,0,0,1}, flush = false)

gpu = FINSDK.Computer.GetGPU()
panel = FINSDK.Computer.GetComponentByNick("Panel")
screen = FINSDK.Computer.GetModuleOnPanel(panel, { x = 1, y = 1 })
gpu:bindScreen(screen)

-- Fill the screen with black but don't automatically flush.
FINSDK.Graphics.Clear(gpu)
gpu:flush()

-- Fill the screen with neon green and flush (no need to call gpu:flush() here).
FINSDK.Graphics.Clear(gpu, { 0, 1, 0, 1 }, true)
```

#### Parameters

- `gpu` : The GPU to use to draw to the screen.
- `color` (optional, default = `{0,0,0,1}` (black)) : The color to fill the display with.
- `flush` (optinal, default = `false`) : Whether or not to automatically flush the GPU to draw the display buffer to the screen. It can be more performant to avoid unnecessary flushes, so this is disabled by default, but is an option for convenience.

#### Return

None

[Source code](../libs/Graphics/Clear.lua)

---

### [`ProgressBar`](#progressbar)

Draw a progress bar.

**TODO: Image of a progress bar.**

This progress bar can have varying degrees of complexity. An optional border can be included into the call with a custom amount of padding to surround the progress bar itself. Additionally, a "target marker" can be added to the progress bar that can be used for many purposes including setpoint, min/max safe values, or any other way you can find it useful.

#### Examples

```lua
-- FINSDK.Graphics.ProgressBar(
--      gpu, fraction, x, y, w, h, bgColor, fgColor, 
--      borderPadding, borderColor,
--      targetFraction, targetThickness, targetColor
-- )

gpu = FINSDK.Computer.GetGPU()
panel = FINSDK.Computer.GetComponentByNick("Panel")
screen = FINSDK.Computer.GetModuleOnPanel(panel, { x = 1, y = 1 })
gpu:bindScreen(screen)

-- The fraction from 0 to 1 to fill the bar by (this is just percentage divided by 100)
-- Set this to whatever you want to represent. This value will fill the bar 75% of the way.
fraction = 0.75
 
-- The basic progress bar at { x = 2, y = 2 } with width of 80 chars and height of 10 chars.
FINSDK.Graphics.ProgressBar(
    gpu, fraction, 2, 2, 80, 10
)

-- The same progress bar with a black background and red foreground.
FINSDK.Graphics.ProgressBar(
    gpu, fraction, 2, 2, 80, 10 {0,0,0,1}, {1,0,0,1}
)
 
-- The same progress bar with a white border as well.
borderPadding = 2
FINSDK.Graphics.ProgressBar(
    gpu, fraction, 2, 2, 80, 10, {0,0,0,1}, {1,0,0,1},
    borderPadding, {1,1,1,1}
)
 
-- The same progress bar with a green target marker as well.
targetFraction = 0.9
targetThickness = 1
FINSDK.Graphics.ProgressBar(
    gpu, fraction, 2, 2, 80, 10, {0,0,0,1}, {1,0,0,1},
    borderPadding, {1,1,1,1},
    targetFraction, targetThickness, {0,1,0,1}
)
 
-- Don't forget to flush to complete the draw call!
gpu:flush()
```

#### Parameters

- `gpu` : The GPU to draw with (it must be bound to a screen).
- `fraction` : A numeric value between 0 and 1 that defines how much of the progress bar is filled. This is equal to the percent filled divided by 100.
- `x` : The x coordinate on the character grid to start drawing the rectangle from.
- `y` : The y coordinate on the character grid to start drawing the rectangle from.
- `w` : The width of the rectangle on the character grid.
- `h` : The height of the rectangle on the character grid.
- `bgColor` (optional, default = `{0,0,0,1}` (black)) : The color to fill the background of the progress bar with.
- `fgColor` (optional, default = `{1,1,1,1}` (white)) : The color to draw the progress indicator of the progress bar with.
- `borderPadding` (optional, default = `nil`) : The number of characters of padding between the progress bar and the border surrounding it. If this value is set, a border will be drawn.
- `borderColor` (optional, default = `{1,1,1,1}` (white)) : The color to draw the border with.
- `targetFraction` (optional, default = `nil`): A numeric value between 0 and 1 that defines has far through the progress bar the target marker is placed. This is equal to the percent divided by 100. If this value is set, a target marker will be drawn.
- `targetThickness` (optional, default = `1`) : How many characters thick should the target marker be drawn.
- `targetColor` (optional, default = `{1,1,1,1}` (white)) : The color to draw the target marker with.

#### Return

None

[Source code](../libs/Graphics/ProgressBar.lua)

---

### [`RectFill`](#rectfill)

Draw a filled rectangle to a display by colouring the backgrounds of characters on the display's character grid.

**TODO: Include an image of the output**

Each row of the character grid is taller than it is wide, so `h` will be smaller than `w` for a square.

*Note: Modular displays installed in panels are 119 characters wide (`x`/`w`) by 30 characters high (`y`/`h`). You're not crazy, they're just a very weird size.*

#### Examples

```lua
--FINSDK.Graphics.RectFill(gpu, display, x, y, w, h, color = {1,1,1,1})

gpu = FINSDK.Computer.GetGPU()
panel = FINSDK.Computer.GetComponentByNick("Panel")
screen = FINSDK.Computer.GetModuleOnPanel(panel, { x = 1, y = 1 })
gpu:bindScreen(screen)

-- Draw a white filled rectangle from { x = 1, y = 1 } that is 20 chars wide and 5 chars high.
FINSDK.Graphics.RectFill(gpu, screen, 1, 1, 20, 5)
gpu:flush()

-- Draw a blue filled rectangle from { x = 3, y = 2 } that is 10 chars wide and 10 chars high.
FINSDK.Graphics.RectFill(gpu, screen, 3, 2, 10, 10, { 0, 0, 1, 1 })
```

#### Parameters

- `gpu` : The GPU to draw with (it must be bound to a screen).
- `x` : The x coordinate on the character grid to start drawing the rectangle from.
- `y` : The y coordinate on the character grid to start drawing the rectangle from.
- `w` : The width of the rectangle on the character grid.
- `h` : The height of the rectangle on the character grid.
- `color` (optional, default = `{1,1,1,1}` (white)) : The color to fill the display with.

#### Return

None

[Source code](../libs/Graphics/RectFill.lua)

---

### [`RectOutline`](#rectoutline)

Draw the perimeter/outline of a rectangle to a display by colouring the backgrounds of characters on the display's character grid.

**TODO: Include an image of the output**

Each row of the character grid is taller than it is wide, so `h` will be smaller than `w` for a square.

*Note: Modular displays installed in panels are 119 characters wide (`x`/`w`) by 30 characters high (`y`/`h`). You're not crazy, they're just a very weird size.*

#### Examples

```lua
--FINSDK.Graphics.RectOutline(gpu, display, x, y, w, h, color = {1,1,1,1})

gpu = FINSDK.Computer.GetGPU()
panel = FINSDK.Computer.GetComponentByNick("Panel")
screen = FINSDK.Computer.GetModuleOnPanel(panel, { x = 1, y = 1 })
gpu:bindScreen(screen)

-- Draw a white rectangle outline from { x = 1, y = 1 } that is 20 chars wide and 5 chars high.
FINSDK.Graphics.RectOutline(gpu, screen, 1, 1, 20, 5)
gpu:flush()

-- Draw a blue rectangle outline from { x = 3, y = 2 } that is 10 chars wide and 10 chars high.
FINSDK.Graphics.RectOutline(gpu, screen, 3, 2, 10, 10, { 0, 0, 1, 1 })
```

#### Parameters

- `gpu` : The GPU to draw with (it must be bound to a screen).
- `x` : The x coordinate on the character grid to start drawing the rectangle from.
- `y` : The y coordinate on the character grid to start drawing the rectangle from.
- `w` : The width of the rectangle on the character grid.
- `h` : The height of the rectangle on the character grid.
- `color` (optional, default = `{1,1,1,1}` (white)) : The color to fill the display with.

#### Return

None

[Source code](../libs/Graphics/RectOutline.lua)

---

## `Math` Namespace

### [`Clamp`](#clamp)

Ensure that the given value is constrained between the minimum and maximum value. If the value is below the minimum, it will be set to the minimum. If it is above the maximum, it will be set to the maximum.

#### Examples

```lua
-- FINSDK.Math.Clamp(value, min, max) 

clamedValue = FINSDK.Math.Clamp(-5, 1, 10)  -- clampedValue == 1
clamedValue = FINSDK.Math.Clamp(12, 1, 10)  -- clampedValue == 10
```

#### Properties

- `value` : The number value to clamp/constrain.
- `min` : The minimum that `value` can be. Any `value` smaller than this is set to `min`.
- `max` : The maximum that `value` can be. Any `value` larger than this is set to `max`.

#### Return

`number`

[Source code](../libs/Math/Clamp.lua)

---

[Back to docs index](./README.md)
