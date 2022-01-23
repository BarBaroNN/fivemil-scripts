RegisterCommand('calc', function() SetNuiFocus(true, true) SendNUIMessage() end)
RegisterNUICallback('nui', function() SetNuiFocus(false, false) end)