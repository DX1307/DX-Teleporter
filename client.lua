ESX = exports.es_extended:getSharedObject()

-- ox inventory
local ox_inventory = exports.ox_inventory

--[[ -- อัพเดทเช็คหน่วยงาน
local PlayerData              = {}

CreateThread(function()
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
]]

CreateThread(function()
    -- body
    for k, v in pairs(Config.TeleportList) do
        local modelHash = GetHashKey(v.Ped.Model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
        local ped = CreatePed(4, modelHash, v.Ped.Coords, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, v.Ped.Task, true, true)
        exports['ox_target']:addLocalEntity(ped, {
            {
                name = k,
                icon = 'fa-solid fa-comment',
                label = v.Ped.Label,
                distance = 2.0,
                onSelect = function(data)
                    local PlayerPed = GetPlayerPed(-1)
                    if not IsPedInAnyVehicle(PlayerPed, true) and not v.Ped.EnableVehicle then
                        if v.Ped.Bypass.enable then
                            local count = ox_inventory:Search('count', v.Ped.Bypass.items)
                            if count >= v.Ped.Bypass.count then
                                FreezeEntityPosition(PlayerPed, true)
                                SetEntityCoords(PlayerPed, v.Ped.Goto)
                                local alert = lib.alertDialog({
                                    header = 'ล็อคขา กันตกแมพ',
                                    content = 'ยืนยันเพื่อยกเลิกล็อคขา',
                                    centered = true,
                                    cancel = false
                                })
                                if alert == 'confirm' then
                                    FreezeEntityPosition(PlayerPed, false)
                                    -- revmove money
                                    TriggerServerEvent('DX-Teleporter:RemoveMoney', v.Ped.Bypass.items, v.Ped.Bypass.count)
                                end
                            else
                                local Getmonet = v.Ped.Bypass.count-count
                                Config.Notification('แจ้งเตือน', 'คุณมี เงินไม่พอ ขาดอีก '..Getmonet..' บาท', 5000, 'error')
                            end
                        else
                            FreezeEntityPosition(PlayerPed, true)
                            SetEntityCoords(PlayerPed, v.Ped.Goto)
                            local alert = lib.alertDialog({
                                header = 'ล็อคขา กันตกแมพ',
                                content = 'ยืนยันเพื่อยกเลิกล็อคขา',
                                centered = true,
                                cancel = false
                            })
                            if alert == 'confirm' then
                                FreezeEntityPosition(PlayerPed, false)
                            end
                        end
                    else
                        Config.Notification('แจ้งเตือน', 'ไม่อนุญาติให้นำรถไป', 5000, 'error')
                    end
                end,
            },
        })
    end
end)