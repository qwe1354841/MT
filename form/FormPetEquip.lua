--宠物装备表单
FormPetEquip = {}

--宠物穿装备
function FormPetEquip.PetPutOnEquip(player,pet_guid,equip_guid)
    if FunctionSwitch.AllFuncitonConfig.PetEquip ~= "on" then
		return ""
	end
    if PetEquip then
        PetEquip.PutOnEquip(player,pet_guid,equip_guid)
    end
    return ""
end

--宠物脱装备
function FormPetEquip.PetTakeOffEquip(player,pet_guid,equip_site)
    if FunctionSwitch.AllFuncitonConfig.PetEquip ~= "on" then
		return ""
	end
    if PetEquip then
        PetEquip.TakeOffEquip(player,pet_guid,equip_site)
    end
    return ""
end