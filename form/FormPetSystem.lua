--宠物系统表单
FormPetSystem = {}

function FormPetSystem.GetLevelUpPetBag(player)
    if PetSystem then
		PetSystem.GetLevelUpPetBag(player)
    end
    return ""
end

function FormPetSystem.LockStatus(player, pet_guid)
    if PetSystem then
		PetSystem.LockStatus(player, pet_guid)
    end
    return ""
end
function FormPetSystem.UnLockStatus(player, pet_guid)
    if PetSystem then
		PetSystem.UnLockStatus(player, pet_guid)
    end
    return ""
end

function FormPetSystem.GetFuncLevel(player)
    if PetSystem then
		PetSystem.GetFuncLevel(player)
    end
    return ""
end