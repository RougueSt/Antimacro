local control = 0
local fired = false
local timer = nil 
local FreezeTime = 3 -- Tempo em segundos pro jogador ficar congelado no lugar por causa do macro
local commands = { -- lista de comandos que bloqueiam quando ficar freezado
    'previous_weapon',
    'next_weapon',
    'aim_weapon',--Tirar esses dois o cara ainda consegue atirar mesmo estando congelado.
    'fire'--Tirar esses dois o cara ainda consegue atirar mesmo estando congelado.
}

local function nothing()
    fired = false
end

local function unfreeze()
    control = control + 1
    if control >= FreezeTime then 
        for i, comando in pairs(commands) do 
            toggleControl(comando, true)
        end
        setElementFrozen(localPlayer, false)
        fired = false
        control = 0
    end
end

local function firedFunc()
    if source ~= localPlayer then return end --Essa verificação é necessária pra evitar que o anti macro ative caso outro
    fired = true --                            player de tiro.
end

function main(old, current)
    if current == 5 or current == 6 then --slot 5 representa quando o player puxa a armas como M4/AK e slot 6 representa Snipers/CounterSniper
        addEventHandler('onClientPlayerWeaponFire', localPlayer, firedFunc) 
    else
        removeEventHandler('onClientPlayerWeaponFire', localPlayer, firedFunc)
    end
    
    if isTimer(timer) and fired then -- verifica o se o timer da linha 48 já existe. Se existir e o player já atirou quer dizer
        for i, comando in pairs(commands) do -- que ta com o macro ou que o player fez Qbug muito rapido 🤔
            toggleControl(comando, false)
        end
        setElementFrozen(localPlayer, true)
        outputChatBox('Uso de macro detectado. Você foi congelado por 3 segundos.', 255, 0, 0)
        setTimer(unfreeze, 1000, FreezeTime)
    else
        timer = setTimer(nothing, 120, 1)-- 120 é um bom valor, se quiser algo mais restrito diminuir o valor.
    end--                                   120 é recomendado, 80 seria BEM mais restrito

end

addEventHandler("onClientPlayerWeaponSwitch", localPlayer, main)
