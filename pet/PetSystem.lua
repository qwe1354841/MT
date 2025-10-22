--宠物系统
PetSystem = {}

--获得宠物弹框的最小type
PetSystem.GetPetShowMinType = 3
--开启子页签功能的等级
PetSystem.OpenFunctionLevel = {
	["养成"] = 30, -- 30级开启宠物养成
	["洗炼"] = 46,
	["突破"] = 46,
	["合成"] = 48,
}
PetSystem.LevelUpStudySkillMax = 8 --升级时领悟最大技能数
--到达x级 解锁一个宠物格子 每级只支持一个
PetSystem.LevelUpGetPetBag = {5,20,35}
--到达x级 解锁一个宠物格子
function PetSystem.OnPlayerLevelUp(player, level)
	local can_unlock_num = player:GetInt("PetBagLevelupUnlock")
	if PetSystem.LevelUpGetPetBag_Tb[level] and can_unlock_num > 0 then
		local petCon = player:GetPetContainer(1)
		local PetBagNow = petCon:GetCapacity()
		petCon:SetCapacity(PetBagNow + 1)
		player:SetInt("PetBagLevelupUnlock", can_unlock_num - 1)
	end
end

function PetSystem.GetLevelUpPetBag(player)
	local can_unlock_num = player:GetInt("PetBagLevelupUnlock")
	local LevelUpPetBag_Tb = {}
	for i = PetSystem.MaxUnLockNum, PetSystem.MaxUnLockNum - can_unlock_num + 1, -1 do
		table.insert(LevelUpPetBag_Tb, PetSystem.LevelUpGetPetBag[i])
	end
	local str = [[
		if PetUI then
			PetUI.LevelUpPetBag_Table = ]]..Lua_tools.serialize(LevelUpPetBag_Tb)..[[
			PetUI.RefreshLevelUpPetBag_Table()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetSystem.GetFuncLevel(player)
	local str = [[
		if PetUI then
			PetUI.OpenFunctionLevel = ]]..PetSystem.OpenFunctionLevelStr..[[
			PetUI.RefreshOpenFunctionLevel()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetSystem.CheckOpenLevel(player, func_name)
	local open_level = PetSystem.OpenFunctionLevel[func_name]
	if open_level then
		local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
		if player_level < open_level then
			sLuaApp:NotifyTipsMsg(player, "您需要达到"..open_level.."级才能开启"..func_name.."功能")
			return false
		end
	end
	return true
end

function PetSystem.OnBorn(pet)
	--出生获得技能
	PetSystem.BornGetSkill(pet)
	--出生 设置自动战斗技能
	PetSystem.BornSetAutoSkill(pet)
	--出生 设置资质最大上限
	PetSystem.BornSetTalentMax(pet)
	--出生设置星级
	PetSystem.BornSetStar(pet)
end

function PetSystem.on_add_pet(pet)
	if not pet then
		return
	end
	--设置初始自动加点
	local player = pet:GetOwner()
	local str = [[
		GlobalProcessing.BornAutoPoint(2, ']]..pet:GetGUID()..[[')
	]]
	sLuaApp:ShowForm(player,"脚本表单",str)
	pet:SetInt("ADDPOINT_Auto",1)

	local pet_id = pet:GetId()
	local pet_type = PetConfig.GetById(pet_id).Type
	if pet_type >= (PetSystem.GetPetShowMinType or 3) then
		local pet_star_level = pet:GetInt("PetStarLevel")
		local str = [[
			GUI.OpenWnd("GetPetOrGuardUI")
			GetPetOrGuardUI.SetPetId(]]..pet_id..[[,]]..pet_star_level..[[)
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function PetSystem.BornSetStar(pet)
	--出生默认 星级 = 1
	local pet_keyname = pet:GetKeyName()
	if PetUpStarConfig.BornStar and PetUpStarConfig.BornStar[pet_keyname] then
		pet:SetInt("PetStarLevel", 1)
		PetUpStar.SetStarLevel(pet, PetUpStarConfig.BornStar[pet_keyname], false)
	else
		pet:SetInt("PetStarLevel", 1)
	end
end

function PetSystem.BornSetTalentMax(pet)
	if PetUpStarConfig and PetUpStarConfig.IntConfig then
		local pet_data = PetConfig.GetById(pet:GetId())
		for _,v in ipairs(PetUpStarConfig.IntConfig) do
			local int_key = v[1]
			if pet_data[int_key] then
				pet:SetInt(int_key, pet_data[int_key])
			end
		end
	end
end

--出生技能 根据pet表SkillGroup字段 SkillGroup表配置
function PetSystem.BornGetSkill(pet)
	local pet_data = PetConfig.GetByKeyName(pet:GetKeyName())
	if not pet_data then
		sLuaApp:LuaErr("缺少 PetConfig 缺少"..pet:GetKeyName())
		return
	end
	-- SkillGroup1	必带绑定技能包 --绑定
	-- SkillGroup2	必带技能包
	-- SkillGroup3	普通技能包
	-- SkillGroup4	额外技能包	--高级孵化才有
	local skill_group_1 = pet_data["SkillGroup1"]
	if skill_group_1 and skill_group_1 ~= 0 then
		PetSystem.StudyFormSkillGroup(pet, skill_group_1, true)
	end
	local skill_group_2 = pet_data["SkillGroup2"]
	if skill_group_2 and skill_group_2 ~= 0 then
		PetSystem.StudyFormSkillGroup(pet, skill_group_2, false)
	end
	local skill_group_3 = pet_data["SkillGroup3"]
	if skill_group_3 and skill_group_3 ~= 0 then
		PetSystem.StudyFormSkillGroup(pet, skill_group_3, false)
	end
	-- if is_high_hatch and is_high_hatch == 1 then
		-- local skill_group_4 = pet_data["SkillGroup4"]
		-- if skill_group_4 and skill_group_4 ~= 0 then
			-- PetSystem.StudyFormSkillGroup(pet, skill_group_4, false)
		-- end
	-- end
end

function PetSystem.HighHatchBornGetSkill(pet)
	local pet_data = PetConfig.GetByKeyName(pet:GetKeyName())
	if not pet_data then
		sLuaApp:LuaErr("缺少 PetConfig 缺少"..pet:GetKeyName())
		return
	end
	local skill_group_4 = pet_data["SkillGroup4"]
	if skill_group_4 and skill_group_4 ~= 0 then
		PetSystem.StudyFormSkillGroup(pet, skill_group_4, false)
	end
end

PetSystem.SkillGroupData = {} --{[skill_group_id] = {["DropWay"] = 1,{skill_id, rate},{skill_id, rate}}}
function PetSystem.InitSkillGroup(skill_group_id)
	PetSystem.SkillGroupData[skill_group_id] = {}
	--sLuaApp:LuaErr("skill_group_id "..skill_group_id)
	local skill_group_data = SkillGroupConfig.GetById(skill_group_id)
	if not skill_group_data then
		sLuaApp:LuaErr("缺少 skill_group_data")
		return
	end
	
	PetSystem.SkillGroupData[skill_group_id]["DropWay"] = skill_group_data.DropWay
	local i = 1
	while skill_group_data["Skill"..i] do
		local skill_id = skill_group_data["Skill"..i]
		local rate = skill_group_data["Rate"..i]
		if skill_id and skill_id ~= 0 and rate and rate ~= 0 then	-- 表数据 中间有空缺
			table.insert(PetSystem.SkillGroupData[skill_group_id], {skill_id, rate})
		end
		i = i + 1
	end
	--sLuaApp:LuaErr("SkillGroupData "..Lua_tools.serialize(PetSystem.SkillGroupData[skill_group_id]))
end
function PetSystem.StudyFormSkillGroup(pet, skill_group_id, is_bind)
	if not PetSystem.SkillGroupData[skill_group_id] then
		PetSystem.InitSkillGroup(skill_group_id)
	end
	
	local skill_id_tb = {}
	local skill_group = PetSystem.SkillGroupData[skill_group_id]
	local drop_way = skill_group["DropWay"]
	if drop_way == 0 then
		local rand = sLuaApp:RandInteger(1,10000)
		local scope = 0
		for _,v in ipairs(skill_group) do
			local skill_id = v[1]
			local rate = v[2]
			scope = scope + rate
			if rand <= scope then
				table.insert(skill_id_tb, skill_id)
				break
			end
		end
	elseif drop_way == 1 then
		for _,v in ipairs(skill_group) do
			local skill_id = v[1]
			local rate = v[2]
			local rand = sLuaApp:RandInteger(1,10000)
			if rand <= rate then
				table.insert(skill_id_tb, skill_id)
			end
		end
	else
		sLuaApp:LuaErr("drop_way错误")
		return
	end
	--sLuaApp:LuaErr("skill_id_tb "..Lua_tools.serialize(skill_id_tb))
	
	if next(skill_id_tb) then
		for _,v in ipairs(skill_id_tb) do
			local skill_con = pet:GetSkillContainer()
			local skill = skill_con:CreateSkill(v, 1, 1, true)
			if skill then
				skill:SetBind(is_bind)
			end
		end
	end
end

--出生 设置自动战斗技能
function PetSystem.BornSetAutoSkill(pet)
	local skill_con = pet:GetSkillContainer()
	local skill_tb = skill_con:GetSkills()
	for _,v in ipairs(skill_tb) do
		local skill_id = v:GetId()
		local skill_data = SkillConfig.GetById(skill_id)
		local skill_type = skill_data.Type
		if skill_type == 1 then --主动
			local skill_target = skill_data.TargetChoose
			if skill_target == 1 or skill_target == 14 then
				if not pet:SetAutoSkill(skill_id) then
					sLuaApp:LuaErr("PetSystem.BornSetAutoSkill SetAutoSkill 错误 "..pet:GetGUID())
				end
				break
			end
		end
	end
end

function PetSystem.OnPetLevelUp(pet, level)
	--sLuaApp:LuaErr("OnPetLevelUp "..level)	
	local player = pet:GetOwner()

	--自动加点
	if pet:GetInt("ADDPOINT_Auto") == 1 then		
		AddPoint.Auto_AddPoint(player,pet)
	end
	
	--玩家没有设置过 且到对应等级 关闭自动加点
	if pet:GetInt("AddPoint_IsPlayerSetted") == 0 then
		if level == (AddPoint.StopAutoPetLevel or 50) then
			pet:SetInt("ADDPOINT_Auto",0)
		end
	end
	
	--升级时技能相关
	PetSystem.PetLevelUpSkill(player, pet, level)
	
	--超过X级自动下阵
	if pet:IsLineup() then
		local global_data = GlobalConfig.GetById(1)
		local PetPlayerFightLevel = global_data.PetMaxBattleLvAbove -- 相差X级无法出战
		local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
		local fight_check_level = player_level + PetPlayerFightLevel
		if pet:GetAttr(ROLE_ATTR_LEVEL) > fight_check_level then
			PetLineup.DownLineup(player, pet:GetGUID())
		end
	end
end

-- PetSystem.SkillUp = {} -- {[skill_id] = 升级后技能}
-- PetSystem.SkillNotStudy = {} -- {[skill_id] = {[1] = 不能领悟的技能ID1, [2] = 不能领悟的技能ID2}} -- 有此技能时，领悟时不会领悟此技能
function PetSystem.PetLevelUpSkill(player, pet, level)
	local has_skill_levelup = 0 -- 本次升级 是否有技能升级 没有技能升级需要进入领悟技能
	local savvy = pet:GetAttr(PET_ATTR_SAVVY) --悟性
	--sLuaApp:LuaErr("savvy"..savvy)
	local skill_con = pet:GetSkillContainer()
	--local skill_tb = skill_con:GetSkills()
	local skill_tb = PetMix.GetSkillTb(pet)
	for _,v in pairs(skill_tb) do
		local skill_id = v:GetId()
		local new_skill_id = PetSystem.SkillUp[skill_id]
		if new_skill_id then
			--判断是否已有下一级技能
			local has_new_skill = skill_con:GetSkill(new_skill_id)
			if not has_new_skill then
				--升级检查技能升级 --一级只能升级一个技能
				local rand = sLuaApp:RandInteger(1,10000)
				if rand <= savvy then
					local is_bind = v:IsBind() --原技能是否绑定
					skill_con:DestroySkill(v, true)
					local new_skill = skill_con:CreateSkill(new_skill_id, 1, 1, true)
					if new_skill then
						new_skill:SetBind(is_bind)
						has_skill_levelup = 1
						
						local old_skill_name = SkillConfig.GetById(skill_id).Name
						local new_skill_name = SkillConfig.GetById(new_skill_id).Name
						sLuaApp:NotifyTipsMsg(player, "您的宠物".. pet:GetName() .."在升级时从"..old_skill_name.."中领悟了"..new_skill_name.."！")
						sLogServerSystem:LogPetToServer(0, player, pet, "宠物升级领悟技能", skill_id, new_skill_id, "领悟升级技能", "")
					end
					return
				end
			-- else
				-- sLuaApp:LuaErr(player:GetName().. "  ".. pet:GetName().." 宠物升级领悟时已有已有技能 "..new_skill_id)
			end
		end
	end
	
	--领悟新技能
	if has_skill_levelup == 0 then
		local skill_num = #skill_tb
		if skill_num < PetSystem.LevelUpStudySkillMax then
			--升级时领悟新技能的概率= 5* (0.01+悟性*0.009) *(8-拥有技能数)/(宠物等级+100)  --进入随机获得技能的概率
			local probability = 5 * (0.01 + savvy*0.009) * (PetSystem.LevelUpStudySkillMax - skill_num) / (level + 100)
			--sLuaApp:LuaErr("probability "..probability)
			local rand = sLuaApp:RandInteger(1,10000)
			if rand <= probability * 10000 then
				local cant_study_skill_tb = {} -- 不能学的技能表 {skill_id = true}
				for _,v in ipairs(skill_tb) do
					local skill_id = v:GetId()
					cant_study_skill_tb[skill_id] = true
					if PetSystem.SkillNotStudy[skill_id] then
						for _,b in ipairs(PetSystem.SkillNotStudy[skill_id]) do
							cant_study_skill_tb[b] = true
						end
					end
				end
				--sLuaApp:LuaErr("cant_study_skill_tb "..Lua_tools.serialize(cant_study_skill_tb))
				--从SkillGroup1,2,3 中选随机一个，去掉已有的技能和不可学的技能
				--如果SkillGroup1中的技能 要绑定
				local pet_data = PetConfig.GetByKeyName(pet:GetKeyName())
				for i = 1, 3 do
					local skill_group_id = pet_data["SkillGroup"..i]
					if skill_group_id and skill_group_id ~= 0 then
						if not PetSystem.SkillGroupData[skill_group_id] then
							PetSystem.InitSkillGroup(skill_group_id)
						end
						if PetSystem.SkillGroupData[skill_group_id]["DropWay"] == 1 then --仅概率掉落的技能包
							for _,v in ipairs(PetSystem.SkillGroupData[skill_group_id]) do
								if not cant_study_skill_tb[v[1]] then
									local rand = sLuaApp:RandInteger(1,10000)
									if rand <= v[2] then
										--sLuaApp:LuaErr("CreateSkillid"..v[1])
										local skill = skill_con:CreateSkill(v[1], 1, 1, true)
										if skill then
											skill:SetBind(i == 1) --只有SkillGroup1 需要绑定
											
											local new_skill_name = SkillConfig.GetById(v[1]).Name
											sLuaApp:NotifyTipsMsg(player, "您的宠物".. pet:GetName() .."领悟了新技能"..new_skill_name.."！")
											sLogServerSystem:LogPetToServer(0, player, pet, "宠物升级领悟技能", 0, v[1], "领悟新技能", "")
										end
										
										return
									end
								end
							end
						end
					end
				end

			end
		end
	end
end

function PetSystem.LockStatus(player, pet_guid)
	--sLuaApp:LuaErr("LockStatus"..pet_guid)
	if not pet_guid then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetSystem.LockStatus 不存在宠物 "..pet_guid)
		return 
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetSystem.LockStatus "..pet_guid.." 不属于 "..player:GetName())
		return 
	end
	if pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "该宠物已经锁定")
		return
	end
	if sPetSystem:LockPet(pet, true) ~= 0 then
		sLuaApp:LuaErr("PetSystem sPetSystem:LockPet 错误")
	end
	

end

function PetSystem.UnLockStatus(player, pet_guid)
	--sLuaApp:LuaErr("UnLockStatus"..pet_guid)
	if not pet_guid then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetSystem.LockStatus 不存在宠物 "..pet_guid)
		return 
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetSystem.LockStatus "..pet_guid.." 不属于 "..player:GetName())
		return 
	end
	if not pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "该宠物已经解锁")
		return
	end
	if sPetSystem:LockPet(pet, false) ~= 0 then
		sLuaApp:LuaErr("PetSystem sPetSystem:LockPet 错误")
	end
end

--退回宠物装备
function PetSystem.ReturnPetEquip(player, pet_tb)
	if not pet_tb then return false end
	local equip_num = 0
	local all_equip_list = {}
	for _,pet in ipairs(pet_tb) do
		if not pet then return false end
		if player ~= pet:GetOwner() then
			sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法退还宠物装备！")
			return false
		end
		local pet_equip_con = pet:GetEquipContainer()
		local equip_list = pet_equip_con:GetItemList()
		local pet_guid = pet:GetGUID()
		all_equip_list[pet_guid] = equip_list
		equip_num = equip_num + #equip_list
	end
	if equip_num <= 0 then
		return true
	end
	if Lua_tools.GetBagFree(player) < equip_num then
		sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足，无法退回宠物装备，请先清理包裹空间！")
		return false
	end
	for pet_guid, equip_tb in pairs(all_equip_list) do
		if #equip_tb > 0 then
			for _, v in ipairs(equip_tb) do
				if not PetEquip.TakeOffEquip(player,pet_guid,v:GetSite()) then
					sLuaApp:NotifyTipsMsg(player, "宠物装备退还失败")
					return false
				end
			end
		end
	end
	sLuaApp:NotifyTipsMsg(player, "宠物装备已退还")
	return true
end

--宠物移入宠物仓库前回调
function PetSystem.on_warehouser_add_pet_pre(player, pet)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中无法操作")
		return false
	end
	return true
end
--宠物移出宠物仓库前回调
function PetSystem.on_warehouser_del_pet_pre(player, pet)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中无法操作")
		return false
	end
	return true
end

--战斗结束给上阵宠物重计算
function PetSystem.FightEndRecalcAttr(player, timer, p)
	local lineup_pet_list = PetLineup.GetNowLineup(player)
	for _,pet_guid in pairs(lineup_pet_list) do
		if pet_guid ~= "-1" then
			local pet = sPetSystem:GetPetByGUID(pet_guid)
			if pet then
				pet:RecalcAttr()
			end
		end
	end
end

function PetSystem.Initialization()
	--宠物栏位 随等级解锁
	PetSystem.LevelUpGetPetBag_Tb = {}
	if PetSystem.LevelUpGetPetBag then
		for _,v in pairs(PetSystem.LevelUpGetPetBag) do
			PetSystem.LevelUpGetPetBag_Tb[v] = true
		end
	end
	PetSystem.MaxUnLockNum = #PetSystem.LevelUpGetPetBag
	--sLuaApp:LuaErr("LevelUpGetPetBag_Tb "..Lua_tools.serialize(PetSystem.LevelUpGetPetBag_Tb))
	
	--宠物升级时 技能相关
	PetSystem.SkillUp = {} -- {[skill_id] = 升级后技能}
	PetSystem.SkillNotStudy = {} -- {[skill_id] = {[1] = 不能领悟的技能ID1, [2] = 不能领悟的技能ID2}} -- 有此技能时，领悟时不会领悟此技能
	local skill_config_tb = SkillConfig.GetTableData()
	local skill_grupo_tb = {} --{[skill_grupo_id] = {{["Id"] = Id, ["UpSkill"] = UpSkill},{["Id"] = Id, ["UpSkill"] = UpSkill},},}
	for _,v in ipairs(skill_config_tb) do
		local actor_type = v.ActorType
		if actor_type == 2 or actor_type == 5 then --使用者 2宠物 5所有
			local skill_grupo_id = v.SkillGroup --技能所属技能组id
			if skill_grupo_id ~= 0 then
				if not skill_grupo_tb[skill_grupo_id] then
					skill_grupo_tb[skill_grupo_id] = {}
				end
				if v.UpSkill ~= 0 then
					table.insert(skill_grupo_tb[skill_grupo_id],{["Id"] = v.Id, ["UpSkill"] = v.UpSkill})
				end
			end
		end
	end
	
	for _,v in pairs(skill_grupo_tb) do
		table.sort(v,
			function(x,y)
				if x["UpSkill"] == y["UpSkill"] then
					return	x["Id"] < y["Id"]
				else
					return  x["UpSkill"] < y["UpSkill"]
				end
			end)
		--sLuaApp:LuaErr(Lua_tools.serialize(v))
		
		for a,b in ipairs(v) do
			local skill_id = b["Id"]
			if v[a+1] then
				PetSystem.SkillUp[skill_id] = v[a+1]["Id"]
			end
			for i = a-1, 1,-1 do
				if not PetSystem.SkillNotStudy[skill_id] then
					PetSystem.SkillNotStudy[skill_id] = {}
				end
				table.insert(PetSystem.SkillNotStudy[skill_id],v[i]["Id"])
			end
			
		end
	end
	-- sLuaApp:LuaErr("PetSystem.SkillUp  "..Lua_tools.serialize(PetSystem.SkillUp))
	-- sLuaApp:LuaErr("PetSystem.SkillNotStudy  "..Lua_tools.serialize(PetSystem.SkillNotStudy))
	
	PetSystem.OpenFunctionLevelStr = Lua_tools.serialize(PetSystem.OpenFunctionLevel)
end
PetSystem.Initialization()