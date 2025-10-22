--宠物装备修理表单
FormPetEquipRepair = {}

function FormPetEquipRepair.GetData(player)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","属性","装备培养") then
	  	return ""
	  end
    if PetEquipRepair then
		PetEquipRepair.GetData(player)
    end
    return ""
end

function FormPetEquipRepair.RepairOnce(player, item_guid)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","属性","装备培养") then
	  	return ""
	  end
    if PetEquipRepair then
		PetEquipRepair.RepairOnce(player, item_guid, 2)
    end
    return ""
end

function FormPetEquipRepair.RepairAll(player)
    if not MainUISwitch.CheckOpenLevel(player,"宠物","属性","装备培养") then
	  	return ""
	  end
    if PetEquipRepair then
		PetEquipRepair.RepairAll(player, 0)
    end
    return ""
end