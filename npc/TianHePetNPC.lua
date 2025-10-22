--天河牧场宠物NPC
TianHePetNPC = {}

function TianHePetNPC.main(npc, player)
    if npc:GetKeyName() == "天河牧场宠物" then
        local PasturePet = sPastureSystem:GetPasturePetByNpc(npc)
        TianHeMuChang.MapPetClick(player,PasturePet:GetPetGUID())
    end
    return ""
end