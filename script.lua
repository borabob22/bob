--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad()
    --[[ print('onLoad!') --]]
end

--[[ The onUpdate event is called once per frame. --]]
function onUpdate()
    --[[ print('onUpdate loop!') --]]
end

function onObjectLeaveContainer(container, object)
    --[[ Assign tags to cards leaving action deck --]]
    if container.getName() == 'Action Deck' then
        object.addTag('Action')

    end

    --[[ Assign tags to cards leaving events deck --]]
    if container.getName() == 'Events Deck' then
        object.addTag('Events')

    end

    --[[ Assign tags to cards leaving needs deck --]]
    if container.getName() == 'Needs Deck' then
        object.addTag('Needs')

    end

    --[[ Assign tags to cards leaving secret deck --]]
    if container.getName() == 'Secret Deck' then
        object.addTag('Secret')

    end

    --[[ Assign tags to resources leaving bags--]]
    if container.getName() == 'Food Bag' then
        object.addTag('Resource')

    end

    if container.getName() == 'Water Bag' then
        object.addTag('Resource')

    end

    if container.getName() == 'Shelter Bag' then
        object.addTag('Resource')

    end

    if container.getName() == 'Leisure Bag' then
        object.addTag('Resource')

    end
end

--[[ Hide resources entering stash area --]]
function onObjectEnterZone(zone, obj)
    if obj.hasTag('Resource') then
        --[[ White  --]]
        if zone.getName() == 'White Stash' then
            obj.setInvisibleTo({"Orange", "Green", "Purple"})
        end

        --[[ Orange --]]
        if zone.getName() == 'Orange Stash' then
            obj.setInvisibleTo({"White", "Green", "Purple"})
        end

        --[[ Green  --]]
        if zone.getName() == 'Green Stash' then
            obj.setInvisibleTo({"Orange", "White", "Purple"})
        end

        --[[ Purple --]]
        if zone.getName() == 'Purple Stash' then
            obj.setInvisibleTo({"Orange", "Green", "White"})
        end
    end
end

--[[ Reveal resources leaving stash area --]]
function onObjectLeaveZone(zone, obj)
    if obj.hasTag('Resource') then
        obj.setInvisibleTo({})
    end
end