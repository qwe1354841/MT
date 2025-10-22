--宠物升星表单
FormPetUpStar = {}

function FormPetUpStar.GetData(player)
    if FunctionSwitch.AllFuncitonConfig.PetUpStar ~= "on" then
		return ""
	end
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼","突破") then
        return ""
    end
    if PetUpStar then
       PetUpStar.GetData(player)
    end
    return ""
end

function FormPetUpStar.GetPetData(player, pet_guid)
    if FunctionSwitch.AllFuncitonConfig.PetUpStar ~= "on" then
		return ""
	end
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼","突破") then
        return ""
    end
    if PetUpStar then
       PetUpStar.GetPetData(player, pet_guid)
    end
    return ""
end


function FormPetUpStar.Breach(player, pet_guid, consume_pet_tb_str)
    if FunctionSwitch.AllFuncitonConfig.PetUpStar ~= "on" then
		return ""
	end
    if not MainUISwitch.CheckOpenLevel(player,"宠物","洗炼","突破") then
        return ""
    end
    if PetUpStar then
       PetUpStar.Breach(player, pet_guid, consume_pet_tb_str)
    end
    return ""
end