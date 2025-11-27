Config = Config or {}

-- Identifiers allowed to use command
Config.AllowedIdentifiers = {
    "discord:1234",
    "license:1234"
}

-- Discord webhook URL
Config.WebhookURL = ""

-- Webhook embed settings
Config.WebhookSettings = {
    username = "QBOX Admin Items", 
    avatar_url = "https://i.imgur.com/yourimage.png",
    color = 16753920 -- gold color
}

-- Check permission and send item list
RegisterNetEvent('qbx_adminitems:checkPermission', function()
    local src = source
    if not isAllowed(src) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            description = 'You are not authorized to use this menu.',
            type = 'error'
        })
        return
    end

    local items = exports.ox_inventory:Items() -- fetch all ox_inventory items
    TriggerClientEvent('qbx_adminitems:openMenu', src, items)
end)

-- Give item to a player
RegisterNetEvent('qbx_adminitems:giveItem', function(itemName, amount, target)
    local src = source
    if not isAllowed(src) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            type = 'error'
        })
        return
    end

    local targetId = (target == 0 or target == nil) and src or target
    exports.ox_inventory:AddItem(targetId, itemName, amount)

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item Given',
        description = ('Gave %sx %s to player %s'):format(amount, itemName, targetId),
        type = 'success'
    })

    sendDiscordLog(src, itemName, amount, targetId)
end)

-- Permission check for any identifier type
function isAllowed(src)
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in pairs(identifiers) do
        for _, allowed in pairs(Config.AllowedIdentifiers) do
            if id == allowed then
                return true
            end
        end
    end
    return false
end

-- Discord logging function
function sendDiscordLog(src, itemName, amount, targetId)
    local playerName = GetPlayerName(src) or "Unknown"
    local targetName = GetPlayerName(targetId) or "Unknown"
    local identifiers = GetPlayerIdentifiers(src)
    local discordTag = "N/A"

    for _, id in pairs(identifiers) do
        if string.sub(id, 1, 8) == "discord:" then
            discordTag = "<@" .. string.sub(id, 9) .. ">"
            break
        end
    end

    local embed = {
        {
            ["title"] = "Admin Item Given",
            ["color"] = Config.WebhookSettings.color,
            ["fields"] = {
                { ["name"] = "Admin", ["value"] = ("%s (%s)"):format(playerName, discordTag), ["inline"] = false },
                { ["name"] = "Item", ["value"] = itemName, ["inline"] = true },
                { ["name"] = "Amount", ["value"] = tostring(amount), ["inline"] = true },
                { ["name"] = "Target Player", ["value"] = ("%s (ID: %s)"):format(targetName, targetId), ["inline"] = false }
            },
            ["footer"] = {
                ["text"] = "QBOX Admin Item Log • " .. os.date("%Y-%m-%d %H:%M:%S")
            }
        }
    }

    PerformHttpRequest(Config.WebhookURL, function() end, 'POST', json.encode({
        username = Config.WebhookSettings.username,
        avatar_url = Config.WebhookSettings.avatar_url,
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end



