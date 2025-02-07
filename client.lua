-- Add chat suggestion for /facebay
TriggerEvent('chat:addSuggestion', '/facebay', 'Post a FaceBay Marketplace listing', {
    { name = "category", help = "ForSale | LookingFor | Trade | Services" },
    { name = "message", help = "Your listing details" }
})

RegisterCommand("facebay", function(source, args, rawCommand)
    if #args < 2 then
        TriggerEvent("chat:addMessage", {
            color = { 255, 255, 255 },
            multiline = true,
            args = { "[FaceBay Marketplace]", "Usage: /facebay [category] [your listing]" }
        })
        TriggerEvent("chat:addMessage", {
            color = { 0, 255, 255 },
            multiline = true,
            args = { "[Categories]", "ForSale, LookingFor, Trade, Services" }
        })
        return
    end

    local category = args[1]:lower()
    local validCategories = {
        forsale = "For Sale",
        lookingfor = "Looking For",
        trade = "Trade",
        services = "Services"
    }

    if not validCategories[category] then
        TriggerEvent("chat:addMessage", {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "[Error]", "Invalid category! Use: ForSale, LookingFor, Trade, Services" }
        })
        return
    end

    local message = table.concat(args, " ", 2)
    TriggerServerEvent("facebay:sendMessage", validCategories[category], message)
end, false)
