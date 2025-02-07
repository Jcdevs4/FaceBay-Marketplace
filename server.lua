RegisterNetEvent("facebay:sendMessage")
AddEventHandler("facebay:sendMessage", function(category, message)
    local _source = source
    local playerName = GetPlayerName(_source)

    if not message or message:gsub("%s+", "") == "" then return end

    local colors = {
        ["For Sale"] = { 0, 255, 0 },
        ["Looking For"] = { 255, 255, 0 },
        ["Trade"] = { 0, 191, 255 },
        ["Services"] = { 255, 165, 0 }
    }

    TriggerClientEvent("chat:addMessage", -1, {
        color = colors[category] or { 66, 103, 178 },
        multiline = true,
        args = { "[FaceBay Marketplace - " .. category .. "]", playerName .. ": " .. message }
    })
end)
