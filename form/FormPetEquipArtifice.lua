--宠物装备洗炼表单
FormPetEquipArtifice = {}

function FormPetEquipArtifice.GetData(player)
	if FunctionSwitch.AllFuncitonConfig.PetEquipArtifice ~= "on" then
		return ""
	end
    if PetEquipArtifice then
		PetEquipArtifice.GetData(player)
    end
    return ""
end

function FormPetEquipArtifice.Artificing(player, item_guid)
    if FunctionSwitch.AllFuncitonConfig.PetEquipArtifice ~= "on" then
		return ""
	end
    if PetEquipArtifice then
		PetEquipArtifice.Artificing(player, item_guid)
    end
    return ""
end

function FormPetEquipArtifice.SaveAttrChange(player, item_guid)
	if FunctionSwitch.AllFuncitonConfig.PetEquipArtifice ~= "on" then
		return ""
	end
    if PetEquipArtifice then
		PetEquipArtifice.SaveAttrChange(player, item_guid)
    end
    return ""
end