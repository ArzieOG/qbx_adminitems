local isOpen = false

-- Open menu command change to what you want
RegisterCommand('adminitem', function()
    TriggerServerEvent('qbx_adminitems:checkPermission')
end)

-- Receive items from server and open UI
RegisterNetEvent('qbx_adminitems:openMenu', function(items)
    if not items then return end
    isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        items = items
    })
end)

-- NUI callback to close
RegisterNUICallback('close', function(_, cb)
    if isOpen then
        isOpen = false
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'close' })
    end
    cb('ok')
end)

-- NUI callback to give item
RegisterNUICallback('giveItem', function(data, cb)
    TriggerServerEvent('qbx_adminitems:giveItem', data.item, data.amount, data.target)
    cb('ok')
end)

-- Close UI
CreateThread(function()
    while true do
        Wait(0)
        if isOpen and IsControlJustReleased(0, 177) then -- ESC
            isOpen = false
            SetNuiFocus(false, false)
            SendNUIMessage({ action = 'close' })
        end
    end
end)

