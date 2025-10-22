--称号系统
TitleSystem = {}
-- 神兽ID
TitleSystem.GodAnimals = {50026, 50055, 50053, 50023, 50056, 50057, 50054}
-- 集齐所有神兽奖励称号ID
TitleSystem.GodAnimalsTitle = 1001
-- 宠物终极技能数量对应称号
TitleSystem.UltimateSkillTitle = {
	[1] = 1002,
	[3] = 1003,
	[5] = 1004,
	[10] = 1005,
	[15] = 1006,
	[20] = 1007
}

function TitleSystem.HasAllGodAnimals(player)
	if player == nil then
		return false
	end

	local container1 = player:GetPetContainer(PET_CONTAINER_PANEL)
	local container2 = player:GetPetContainer(PET_CONTAINER_WAREHOUSE_PETS)
	if container1 == nil or container2 == nil then
		return false
	end

	for k,v in pairs(TitleSystem.GodAnimals) do
		local count = container1:GetPetCountById(v) + container2:GetPetCountById(v)
		if count == 0 then
			return false
		end
	end

	return true
end

function TitleSystem.GetPetSkillCount(pet)
	if pet == nil then
		return 0
	end

	local skill_container = pet:GetSkillContainer()
	if skill_container == nil then
		return 0
	end

	local count = 0
	local skills = skill_container:GetSkills()
	for i = 1, #skills do
		local skill = skills[i]
		local skill_id = skill:GetId()
		local row = SkillConfig.GetById(skill_id)
		if row ~= nil and row.SubType == 3 then
			count = count + 1 
		end
	end

	return count
end

function TitleSystem.GetPetContainerSkillCount(pet_container)
	if pet_container == nil then
		return 0
	end

	local count = 0
	local pets = pet_container:GetPetList()
	for i =1, #pets do
		local pet = pets[i]
		count = count + TitleSystem.GetPetSkillCount(pet)
	end

	return count
end

function TitleSystem.GetUltimateSkillCount(player)
	if player == nil then
		return 0
	end
	local container1 = player:GetPetContainer(PET_CONTAINER_PANEL)
	local container2 = player:GetPetContainer(PET_CONTAINER_WAREHOUSE_PETS)
	local count1 = TitleSystem.GetPetContainerSkillCount(container1)
	local count2 = TitleSystem.GetPetContainerSkillCount(container2)
	return count1 + count2
end

function TitleSystem.on_get_pet(player, pet)
	if pet == nil then
		return
	end

	local pet_container = pet:GetPetContainer()
	if pet_container == nil then
		return
	end

	if pet_container:GetContainerType() ~= PET_CONTAINER_PANEL then
		return
	end

	if not TitleSystem.HasAllGodAnimals(player) then
		return
	end

	if not sTitleSystem:HasTitle(player, TitleSystem.GodAnimalsTitle) then
		-- sLuaApp:NotifyTipsMsgEx(player, "获得称号")
		sTitleSystem:AddTitleEx( player, TitleSystem.GodAnimalsTitle, 0)
	end
end

function TitleSystem.on_add_skill(skill)
	if skill == nil then
		return
	end

	local skill_container = skill:GetSkillContainer()
	if skill_container == nil then
		return
	end

	local owner = skill_container:GetOwner()
	if owner == nil then
		return
	end

	if owner:GetType() ~= GUID_PET then
		return
	end

	local skill_id = skill:GetId()
	local row = SkillConfig.GetById(skill_id)
	if row == nil then
		return 
	end

	if row.SubType ~= 3 then
		return
	end

	local player = owner:GetOwner()
	if player == nil then
		return
	end

	local title_id = 0
	local count = TitleSystem.GetUltimateSkillCount(player)
	-- sLuaApp:NotifyTipsMsgEx(player, "count = " .. count)
	for k,v in pairs(TitleSystem.UltimateSkillTitle) do
		if count == k then
			title_id = v
		end
	end 

	if title_id == 0 then
		return
	end

	if not sTitleSystem:HasTitle(player, title_id) then
		-- sLuaApp:NotifyTipsMsgEx(player, "获得称号")
		sTitleSystem:AddTitleEx( player, title_id, 0)
	end
end
