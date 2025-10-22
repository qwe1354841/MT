
Contact = {}
function Contact.on_login(player)
    local set = player:GetInt("CONTACT_AutoRefuseApply")
    if set == 1 then
        sContactSystem:RefuseAllApply(player)
    end
end