--装备相关表单

PetSkillSystem = {}

function PetSkillSystem.GetData(player, pet_guid)
	--告知召唤兽可学技能上限和已解锁技能栏数
	if not PetSkillSystem.PetSkillStudyMax then
		PetSkillSystem.GetMaxSkill()
	end
	local str = [[if not PET_DATA then PET_DATA = {} end
	]]
	local pet = PetContainer:GetPetByGUID(tonumber(pet_guid))
	if PetSkillSystem.PetChecking(player, pet_guid) == false then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	return ""
end

function PetSkillSystem.StudySkill(player, pet_guid, item_id)
	
end

function PetSkillSystem.PetChecking(player, pet)
	
	return false
end

function PetSkillSystem.UnlockSkillBar(pet)
	if pet then
		if not PetSkillSystem.PetSkillStudyMax then
			PetSkillSystem.GetMaxSkill()
		end
		local Now = pet:GetInt("PET_UnlockSkillBar")
		if Now < PetSkillSystem.PetSkillStudyMax then
			pet:SetInt("PET_UnlockSkillBar", Now + 1)
		end
	end
end

function PetSkillSystem.GetMaxSkill()
	if not PetSkillSystem.PetSkillStudyMax then
		PetSkillSystem.PetSkillStudyMax = GlobalConfig.GetById(1)['PetSkillStudy']
	end
end