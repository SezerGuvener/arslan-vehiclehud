--MPH
local mph = 2.2369
--KMPH
local kmph = 3.6

--Text
function showText(text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.0,1.0)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text .. " MPH")
    DrawText(0.16,0,93) --[(x,y) coord]
end

--Speedometer
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*mph)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            if speed < 1 then
                showText("0")
            else
                showText(math.floor(speed))
            end
        end
    end            
end)
