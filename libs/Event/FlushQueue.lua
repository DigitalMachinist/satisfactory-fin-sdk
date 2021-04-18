if not FINSDK then
    FINSDK = {}
end

if not FINSDK.Event then
    FINSDK.Event = {}
end

---
--- FlushQueue
--- 
--- Pop all messages from the event queue, ignoring all of them, until none are left.
--- @see https://github.com/DigitalMachinist/satisfactory-fin-sdk/blob/main/docs/library.md#flushqueue
---
--- @return nil
FINSDK.Event.FlushQueue = function (maxEventsPerTick)
    while true do
        for i = 1, maxEventsPerTick do
            if (event.pull(0) == nil) then
                return
            end
        end
    end
end