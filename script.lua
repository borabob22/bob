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
    if container.getName() == 'ActionDeck' then
        object.addTag('DiscardPile')
        object.addTag('PassiveCards')
    end
end

function onObjectEnterZone(zone, object)
    --[[ Red Player Hand --]]
    if zone.getName() == 'RedPlayerHand' then
        object.addTag('RedPlayerCard1')
        object.addTag('RedPlayerCard2')
    end

    --[[ White Player Hand --]]
    if zone.getName() == 'WhitePlayerHand' then
        object.addTag('WhitePlayerCard1')
        object.addTag('WhitePlayerCard2')
    end

    --[[ Purple Player Hand --]]
    if zone.getName() == 'PurplePlayerHand' then
        object.addTag('PurplePlayerCard1')
        object.addTag('PurplePlayerCard2')
    end

    --[[ Pink Player Hand --]]
    if zone.getName() == 'PinkPlayerHand' then
        object.addTag('PinkPlayerCard1')
        object.addTag('PinkPlayerCard2')
    end
end

function onObjectDrop(playerColor, object)
    --[[ Red Player Drop Card --]]
    if playerColor == 'Red' and object.type == 'Card' then
        object.removeTag('RedPlayerCard1')
        object.removeTag('RedPlayerCard2')
    end

    --[[ White Player Drop Card --]]
    if playerColor == 'White' and object.type == 'Card' then
        object.removeTag('WhitePlayerCard1')
        object.removeTag('WhitePlayerCard2')
    end

    --[[ Purple Player Drop Card --]]
    if playerColor == 'Purple' and object.type == 'Card' then
        object.removeTag('PurplePlayerCard1')
        object.removeTag('PurplePlayerCard2')
    end

    --[[ Pink Player Drop Card --]]
    if playerColor == 'Pink' and object.type == 'Card' then
        object.removeTag('PinkPlayerCard1')
        object.removeTag('PinkPlayerCard2')
    end
end