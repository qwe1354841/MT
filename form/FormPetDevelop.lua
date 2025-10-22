--宠物养成表单
FormPetDevelop = {}
function FormPetDevelop.MedicineGetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.MedicineGetData(player)
    end
    return ""
end

function FormPetDevelop.SkillStudyGetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillStudyGetData(player)
    end
    return ""
end

function FormPetDevelop.RestoreGetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.RestoreGetData(player)
    end
    return ""
end

function FormPetDevelop.SkillExtractGetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillExtractGetData(player)
    end
    return ""
end

function FormPetDevelop.SkillBindGetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillBindGetData(player)
    end
    return ""
end

function FormPetDevelop.MedicineUseItem(player, pet_guid, item_keyname, use_num, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.MedicineUseItem(player, pet_guid, item_keyname, use_num, version, 0)
    end
    return ""
end

function FormPetDevelop.SkillStudy(player, pet_guid, item_guid, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillStudy(player, pet_guid, item_guid, version, 0)
    end
    return ""
end

function FormPetDevelop.Restore(player, pet_guid, item_keyname, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.Restore(player, pet_guid, item_keyname, version)
    end
    return ""
end

function FormPetDevelop.SkillExtract(player, pet_guid, item_guid, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillExtract(player, pet_guid, item_guid, version, 0)
    end
    return ""
end

function FormPetDevelop.SkillBind(player, pet_guid, skill_id, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillBind(player, pet_guid, skill_id, version, 0)
    end
    return ""
end

function FormPetDevelop.SkillUnbind(player, pet_guid, skill_id, version)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","养成") then
		return ""
	end
    if PetDevelop then
		PetDevelop.SkillUnbind(player, pet_guid, skill_id, version, 0)
    end
    return ""
end
