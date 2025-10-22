--宠物相关表单

FormPet = {}

function FormPet.Artifice_GetData(player, pet_guid)
	sLuaApp:LuaDbg("FormPetGet!")
	--EquipBuild.Initialization(0)
	
	if PetSkillSystem then
		PetSkillSystem.GetData(player, pet_guid)
	end
	return ""
end

function FormPet.Artifice_GetConfig(player)
	sLuaApp:LuaDbg("Artifice_GetConfig!")
	if PetArtifice then
		PetArtifice.GetConfig(player)
	end
	return ""
end

function FormPet.Artifice_GetData(player, pet_guid)
	if PetArtifice then
		PetArtifice.GetData(player, pet_guid)
	end
	return ""
end

function FormPet.Artifice_Strat(player, pet_guid, item_guid)
	if PetArtifice then
		PetArtifice.Artifice(player, pet_guid, item_guid)
	end
	return ""
end

function FormPet.Skill_BookStudy(player, pet_guid, item_guid)
	if PetSkillBook then
		PetSkillBook.BookStudy(player, pet_guid, item_guid)
	end
	return ""
end

function FormPet.Skill_Extract(player, pet_guid, index)
	if PetSkillBook then	
		PetSkillBook.Jupodan_Extract(player, pet_guid, index)
	end
	return ""
end

function FormPet.Skill_Delet(player, pet_guid, index)
	if PetSkillBook then	
		PetSkillBook.ForgetPetSkill(player, pet_guid, index)
	end
	return ""
end

function FormPet.GetSkillFuncData(player)
	if PetSkillBook then	
		PetSkillBook.GetSkillFuncData(player)
	end
	return ""
end

function FormPet.Skill_UnlockSkillFields(player, pet_guid)
	if PetSkillBook then	
		PetSkillBook.UnlockSkillFields_Request(player, pet_guid)
	end
	return ""
end

function FormPet.Neidan_Extract(player, pet_guid, index)
	if PetNeidan then		
		PetNeidan.Extract(player, pet_guid, index)
	end
	return ""
end

function FormPet.Neidan_Upgrade(player, pet_guid, index)
	if PetNeidan then		
		PetNeidan.Neidan_Upgrade(player, pet_guid, index)
	end
	return ""
end

function FormPet.Upgrade_OneKey(player, pet_guid, index)
	if PetNeidan then		
		PetNeidan.Upgrade_OneKey(player, pet_guid, index)
	end
	return ""
end

function FormPet.Neidan_GetFunction(player)
	if PetNeidan then		
		PetNeidan.GetFunction(player)
	end
	return ""
end

function FormPet.ChooseItem(player, pet_guid, item_guid)
	if PetItem then
		PetItem.ChooseItem(player, pet_guid, item_guid)
	end
	return ""
end

function FormPet.UseItem(player, pet_guid, item_guid)
	if PetItem then
		PetItem.UseItem(player, pet_guid, item_guid)
	end
	return ""
end

function FormPet.UnlockPetField(player)
	if PetItem then
		PetItem.UnlockPetField(player)
	end
	return ""
end

function FormPet.QueryPet(player, pet_guid)
	if player == nil then
		return ""
	end

	local code = sPetSystem:QueryPet(player, pet_guid)
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "查询宠物不存在")
	end
	return ""
end

function FormPet.query_offline_pet_by_player_name(player, player_name, pet_guid)
	if not (player_name and pet_guid) then
		sLuaApp:NotifyTipsMsg(player,'无法获取此宠物信息')
		sLuaApp:LuaErr("FormPet.query_offline_pet 传入参数为空")
		return ''
	end

	pet_guid = tonumber(pet_guid)
	if not pet_guid then
		sLuaApp:NotifyTipsMsg(player,'无法获取此宠物信息')
		sLuaApp:LuaErr("FormPet.query_offline_pet, pet_guid参数异常")
		return ''
	end

	local target_guid = sContactSystem:GetContactGUID(player_name)
	if not target_guid or target_guid == 0 then
		sLuaApp:NotifyTipsMsg(player,'无法获取此宠物信息')
		sLuaApp:LuaErr("FormPet.query_offline_pet 无法通过名称"..tostring(player_name).."获取离线玩家的guid")
		return''
	end

	if sContactSystem:LoadOfflinePet(player, target_guid, pet_guid) ~= 0 then
		sLuaApp:NotifyTipsMsg(player,'无法获取此宠物信息')
		sLuaApp:LuaErr("FormPet.query_offline_pet 查询离线宠物失败")
	end

	return ''

end

function FormPet.QueryPetByKeyName(player, pet_key)
	if player == nil then
		return ""
	end
	sLuaApp:LuaDbg('QueryPetByKeyName ' .. pet_key)
	local pet_guid = Data.QueryPets[''..pet_key]
	
	if pet_guid then
		local code = sPetSystem:QueryPet(player, pet_guid)
		if code ~= 0 then
			sLuaApp:NotifyTipsMsgEx(player, "查询宠物不存在")
		end
		return ""
	end
	return "查询宠物不合法"
end

function FormPet.GetManualConfig(player)
	if player == nil then
		return ""
	end

	if PetManual then
		PetManual.GetConfig(player)
	end
	return ""
end

function FormPet.ManualPurchase(player, petKey)
	if player == nil then
		return ""
	end

	if PetManual then
		PetManual.Purchase(player, petKey)
	end
	return ""
end

function FormPet.PetArtiSyn_GetConfig(player)
	if PetArtiSynthesis then
		PetArtiSynthesis.GetConfig(player)
	end
	return ""	
end

function FormPet.PetArtiSyn_Start(player, item_1, item_2)
	if PetArtiSynthesis then
		PetArtiSynthesis.Start(player, item_1, item_2)
	end
	return ""	
end

--设置宠物是否可见
function FormPet.SetOtherPetCanSee(player,set)
	if player == nil then
		return ""
	end

	set = tonumber(set)
	if set == nil then
		-- sLuaApp:NotifyTipsMsg(player,"设置宠物是否可见，传入参数错误")
		return ''
	end

	-- sLuaApp:NotifyTipsMsg(player,"传入参数:  "..set)
	-- sLuaApp:NotifyTipsMsg(player,"当前存入的值:  "..player:GetInt('PET_OtherPetCanSee'))

	if set ~= 0 then
		-- sLuaApp:NotifyTipsMsg(player,"关闭宠物可见")
		player:SetInt("PET_OtherPetCanSee", 1)
		player:OtherPetCanSee(false)
	else
		-- sLuaApp:NotifyTipsMsg(player,"开启宠物可见")
		player:SetInt("PET_OtherPetCanSee", 0)
		player:OtherPetCanSee(true)
	end

	sCustomVarSystem:SetBroadcastScope(0,"PET_OtherPetCanSee",1)

	return ""
end

--获得宠物的可见状态
function FormPet.GetPetCanSeeOnLogin(player)
	if player == nil then
		return ""
	end

	if player:GetInt('PET_OtherPetCanSee') ~= 0 then
		--player:SetInt("PET_OtherPetCanSee", 1)
		player:OtherPetCanSee(false)
	else
		player:SetInt("PET_OtherPetCanSee", 0)
		player:OtherPetCanSee(true)
	end

	sCustomVarSystem:SetBroadcastScope(0,"PET_OtherPetCanSee",1)

end