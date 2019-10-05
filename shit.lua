-----------------------------------------------------
-- Ah shit, here we go again made in MTA:SA
-- Haxardous
-----------------------------------------------------

function startAhShit()
    local timehour, timeminute = getTime()

    -- set CJ's skin model.
    if not (getElementModel(localPlayer) == 0) then
        setElementModel(localPlayer, 0)
        print("skin model set to 0 (CJ Skin)")
    end

    -- set CJ's clothes.
    addPedClothes(localPlayer, "vest", "vest", 0)
    print("CJ's vest set to 0 (Clothes)")

    -- set weather
    if not (getWeather() == 0) then
        setWeather(0)
        print("weather set to 0")
    elseif not (timerhour == 12) then
        setTime(12, 0)
        print("time set to 12:0")
    end
    -- playing sound
    sound = playSound("ahshitherewegoagain.mp3")
    setSoundVolume(sound, 100)
    print("playing sound")

    -- hiding HUD & chat
    local components = { "ammo", "area_name" ,"armour", "breath", "clock", "health", "money",
        "radar", "vehicle_name", "weapon", "radio", "wanted", "crosshair" }
        
        for _,component in ipairs(components) do
            if isPlayerHudComponentVisible(component) then
                setPlayerHudComponentVisible("all", false)
                print("hud has been hidden successfully")
                if (isChatVisible() == true) then
                    showChat(false)
                    print("chat has been hidden successfully")
                end
            end
        end

    function drawText()
        dxDrawText("Ah shit, here we go again.", 859 + 1, 919 + 1, 1061 + 1, 938 + 1, tocolor(1, 0, 0, 255), 1.30, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Ah shit, here we go again.", 859, 919, 1061, 938, tocolor(255, 255, 255, 255), 1.30, "default-bold", "left", "top", false, false, false, false, false)
    end
    addEventHandler("onClientRender", root, drawText)

    -- position & camera
    setElementPosition(localPlayer, 2208.33276, -1262.66333, 23.88005)
    setElementRotation(localPlayer, 0, 0, -90)
    setPedCameraRotation(localPlayer, -90)
    fadeCamera(true)
    setCameraShakeLevel(30)

    -- movement
    setControlState(localPlayer, "forwards", true)
    setControlState(localPlayer, "walk", true)

    -- restore stuff
    setTimer(function()
        -- display HUD
        setPlayerHudComponentVisible("all", true)
        showChat(true)

        -- remove text
        removeEventHandler("onClientRender", root, drawText)

        -- camera
        setCameraShakeLevel(0)

        -- restore movement
        setControlState(localPlayer, "forwards", false)
        setControlState(localPlayer, "walk", false)
    end, 3500, 1)
end
addCommandHandler("ahshit", startAhShit, false, false)