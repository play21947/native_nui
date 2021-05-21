_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Main Menu")
_menuPool:Add(mainMenu)

local show = false

function FirstItem(menu)
    local click = NativeUI.CreateItem("Heal")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender, item, index)
        if(item == click) then
            SetEntityHealth(PlayerPedId(), 200)
            print("Healed")
        end
    end
end

function eat(menu)
    local click = NativeUI.CreateItem("Eat")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender, item, index)
        if(item == click) then
            TriggerEvent('esx_status:set', 'hunger', 1000000)
            TriggerEvent('esx_status:set', 'thirst', 1000000)
        end
    end
end

FirstItem(mainMenu)
eat(mainMenu)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if(IsControlJustPressed(0, 38)) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)