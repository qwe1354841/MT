--宠物洗炼表单
FormPetRefining = {}

function FormPetRefining.GetData(player)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼") then
        return ""
    end
    if PetRefining then
        PetRefining.GetData(player)
    end
    return ""
end

function FormPetRefining.GetAttrChange(player, pet_guid)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼") then
        return ""
    end
    if PetRefining then
		PetRefining.GetAttrChange(player, pet_guid)
    end
    return ""
end

function FormPetRefining.StartRefining(player, pet_guid, is_major, lock_str)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼") then
        return ""
    end
    if PetRefining then
        PetRefining.StartRefining(player, pet_guid, is_major, lock_str)
    end
    return ""
end

function FormPetRefining.SeveAttr(player, pet_guid)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼") then
        return ""
    end
    if PetRefining then
        PetRefining.SeveAttr(player, pet_guid)
    end
    return ""
end