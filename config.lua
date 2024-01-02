Config                            = {}

Config.TeleportList = {
    [1] = {
        Ped = {
            Label = 'เข้าคาสิโน',
            Model = 's_m_y_doorman_01',
            Task = 'WORLD_HUMAN_CLIPBOARD',
            Bypass = { 
                enable = true, 
                items = 'money', 
                count = 1 
            },
            EnableVehicle = false,
            Coords = vector4(930.3915, 37.2187, 81.0957 -0.95, 5.9943),
            Goto = vector4(1121.3738, 264.6888, -45.8410, 88.2722)
        },
    },
    [2] = {
        Ped = {
            Label = 'ออกคาสิโน',
            Model = 's_m_y_doorman_01',
            Task = 'WORLD_HUMAN_CLIPBOARD',
            Bypass = { 
                enable = true, 
                items = 'money', 
                count = 1 
            },
            EnableVehicle = false,
            Coords = vector4(1121.3738, 264.6888, -45.8410 -0.99, 88.2722),
            Goto = vector4(930.3915, 37.2187, 81.0957, 5.9943)
        },
    },
}

Config.Notification = function(title, text, time, type)
    exports['okokNotify']:Alert(title, text, time, type)
end
