ESX = exports.es_extended:getSharedObject()

local ox_inventory = exports.ox_inventory

RegisterServerEvent('DX-Teleporter:RemoveMoney')
AddEventHandler('DX-Teleporter:RemoveMoney', function(money, count)
    local src = source
    ox_inventory:RemoveItem(src, money, count)
end)