CultivationSkill = {}

--版本号
CultivationSkill.Version = "210520"

--Up为字符串中2%值，客户端显示用
CultivationSkill.SkillData = {
	{Name = "攻击修炼", SkillID = 6001,  Icon="1900815010", Info="每一级使人物造成伤害时，额外增加2%伤害结果。", Up = "2"},
	{Name = "防御修炼", SkillID = 6002,  Icon="1900815020", Info="每一级使人物受到伤害时，额外减少0.5%伤害结果。", Up = "2"},
	{Name = "宠物攻击", SkillID = 6003,  Icon="1900815030", Info="每一级使宠物造成伤害时，额外增加2%伤害结果。", Up = "2"},
	{Name = "宠物防御", SkillID = 6004,  Icon="1900815040", Info="每一级使宠物受到伤害时，额外减少0.5%伤害结果。", Up = "2"},
	{Name = "侍从攻击", SkillID = 6005,  Icon="1900815050", Info="每一级使侍从造成伤害时，额外增加2%伤害结果。", Up = "2"},
	{Name = "侍从防御", SkillID = 6006,  Icon="1900815060", Info="每一级使侍从受到伤害时，额外减少0.5%伤害结果。", Up = "2"},
	{Name = "封印修炼", SkillID = 6007,  Icon="1900815070", Info="每一级使人物、宠物、侍从的封印命中率提高2%。", Up = "2"},
	{Name = "抗封修炼", SkillID = 6008,  Icon="1900815080", Info="每一级使人物、宠物、侍从的抗封率提高2%。", Up = "2"},
}

--能够使用的修炼丹以及对应获得的修炼经验值
CultivationSkill.ItemData = {
	{KeyName = "小修炼丹", Id = 31401, Exp = 100},
	{KeyName = "修炼丹", Id = 31402, Exp = 300},
	{KeyName = "高级修炼丹", Id = 31404, Exp = 1000},
}

--人物等级对应的修炼技能最大等级
CultivationSkill.SkillLevelLimit = {
	{level =  45, CulSkillMaxLevel =  6},
	{level =  50, CulSkillMaxLevel =  8},
	{level =  55, CulSkillMaxLevel = 10},
	{level =  60, CulSkillMaxLevel = 12},
	{level =  65, CulSkillMaxLevel = 13},
	{level =  70, CulSkillMaxLevel = 14},
	{level =  75, CulSkillMaxLevel = 15},
	{level =  80, CulSkillMaxLevel = 16},
	{level =  85, CulSkillMaxLevel = 17},
	{level =  90, CulSkillMaxLevel = 18},
	{level =  95, CulSkillMaxLevel = 19},
	{level = 100, CulSkillMaxLevel = 20},
	{level = 105, CulSkillMaxLevel = 21},
	{level = 110, CulSkillMaxLevel = 22},
	{level = 115, CulSkillMaxLevel = 23},
	{level = 120, CulSkillMaxLevel = 24},
}

--单次学习修炼技能消耗银币数量以及提升的经验值
CultivationSkill.OnceCulConsume = {MoneyVal = 20000, Exp = 20}

--每级修炼技能所需经验
CultivationSkill.SkillLevelExtra = {
   {Level =  1, Exp = 300},
   {Level =  2, Exp = 420},
   {Level =  3, Exp = 580},
   {Level =  4, Exp = 810},
   {Level =  5, Exp = 1130},
   {Level =  6, Exp = 1460},
   {Level =  7, Exp = 1890},
   {Level =  8, Exp = 2450},
   {Level =  9, Exp = 3180},
   {Level = 10, Exp = 4130},
   {Level = 11, Exp = 4950},
   {Level = 12, Exp = 5940},
   {Level = 13, Exp = 7120},
   {Level = 14, Exp = 8540},
   {Level = 15, Exp = 10240},
   {Level = 16, Exp = 11260},
   {Level = 17, Exp = 12380},
   {Level = 18, Exp = 13610},
   {Level = 19, Exp = 14970},
   {Level = 20, Exp = 16460},
   {Level = 21, Exp = 18100},
   {Level = 22, Exp = 19890},
   {Level = 23, Exp = 21830},
   {Level = 24, Exp = 25920},
   {Level = 25, Exp = 30000},
}

function CultivationSkill.CheckPetAndGuildSkill(player)
	sLuaApp:LuaDbg("CultivationSkill_CheckPetAndGuildSkill")
	local petCon = player:GetPetContainer(1)
	local pet_list = petCon:GetPetList()
	local guardCon = player:GetGuardContainer()
	local guard_list = guardCon:GetGuards()
	local mapping = CultivationSkill.CultivationSkillMapping
	for a, b in ipairs(pet_list) do
		for k, v in ipairs(CultivationSkill.SkillData) do
			local skill_id = v.SkillID
			local skillData = SkillConfig.GetById(skill_id)
			if skillData.ActorType == 2 or skillData.ActorType == 5 then
				local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])
				local pet_skillCon = b:GetSkillContainer()
				sLuaApp:LuaDbg("v.SkillID:"..v.SkillID)
				local skill = pet_skillCon:GetSkill(skill_id)
				if skill == nil then
					sLuaApp:LuaDbg("宠物nowlevel1:"..nowlevel)
					pet_skillCon:CreateSkill(skill_id, nowlevel, nowlevel,false)
				elseif skill:GetPerformance() ~= nowlevel then
					sLuaApp:LuaDbg("宠物nowlevel2:"..nowlevel)
					skill:SetPerformance(nowlevel)
					skill:SetMaxPerformance(nowlevel)
				end
			end
		end
		b:RecalcAttr()
	end
	
	for a, b in ipairs(guard_list) do
		for k, v in ipairs(CultivationSkill.SkillData) do
			local skill_id = v.SkillID
			local skillData = SkillConfig.GetById(skill_id)
			if skillData.ActorType == 3 or skillData.ActorType == 5 then
				local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id] )
				local guard_skillCon = b:GetSkillContainer()
				local skill = guard_skillCon:GetSkill(skill_id)
				--sLuaApp:LuaDbg("v.SkillID:"..v.SkillID)
				if skill == nil then
					--sLuaApp:LuaDbg("侍从nowlevel1:"..nowlevel)
					guard_skillCon:CreateSkill(skill_id, nowlevel, nowlevel,false)
				elseif skill:GetPerformance() ~= nowlevel then
					--sLuaApp:LuaDbg("侍从nowlevel2:"..nowlevel)
					skill:SetPerformance(nowlevel)
					skill:SetMaxPerformance(nowlevel)
				end
			end
		end
		b:RecalcAttr()
	end
end

function CultivationSkill.on_add_pet(pet)
	sLuaApp:LuaDbg("获得宠物回调")
	local player = pet:GetOwner()
	if player == nil then
		return ""
	end
	--sLuaApp:LuaDbg("player:"..player:GetGUID())
	local mapping = CultivationSkill.CultivationSkillMapping
	for k, v in ipairs(CultivationSkill.SkillData) do
		local skill_id = v.SkillID
		local skillData = SkillConfig.GetById(skill_id)
		if skillData.ActorType == 2 or skillData.ActorType == 5 then
			local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])
			if nowlevel ~= 0 then
				local pet_skillCon = pet:GetSkillContainer()
				--sLuaApp:LuaDbg("v.SkillID:"..v.SkillID)
				if pet_skillCon:GetSkill(skill_id) == nil then
					--sLuaApp:LuaDbg("宠物创建时学习对应修炼技能")
					--sLuaApp:LuaDbg("nowlevel:"..nowlevel)
					--sLuaApp:LuaDbg("nowlevel:"..nowlevel)
					pet_skillCon:CreateSkill(skill_id, nowlevel, nowlevel,false)
				else
					local skill = pet_skillCon:GetSkill(skill_id)
					if skill:GetPerformance() ~= nowlevel then
						skill:SetMaxPerformance(nowlevel) 
						skill:SetPerformance(nowlevel) 
					end
				end
			elseif nowlevel == 0 then
				local pet_skillCon = pet:GetSkillContainer()
				if pet_skillCon:GetSkill(skill_id) ~= nil then
					local skill = pet_skillCon:GetSkill(skill_id)
					skill:SetMaxPerformance(nowlevel) 
					skill:SetPerformance(nowlevel) 
				end
			end
		end
	end
	pet:RecalcAttr()
end

function CultivationSkill.on_add_guard(guard)
	sLuaApp:LuaDbg("获得侍从回调")
	local player = guard:GetMaster()
	if player == nil then
		return ""
	end
	local mapping = CultivationSkill.CultivationSkillMapping
	for k, v in ipairs(CultivationSkill.SkillData) do
		local skill_id = v.SkillID
		local skillData = SkillConfig.GetById(skill_id)
		if skillData.ActorType == 3 or skillData.ActorType == 5 then
			local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id] )
			if nowlevel ~= 0 then
				local guard_skillCon = guard:GetSkillContainer()
				sLuaApp:LuaDbg("v.SkillID:"..v.SkillID)
				if guard_skillCon:GetSkill(skill_id) == nil then
					sLuaApp:LuaDbg("侍从创建时学习对应修炼技能")
					sLuaApp:LuaDbg("nowlevel:"..nowlevel)
					guard_skillCon:CreateSkill(skill_id, nowlevel, nowlevel,false)
				else
					local skill = guard_skillCon:GetSkill(skill_id)
					if guard_skillCon:GetSkill(skill_id) ~= nil then
						if skill:GetPerformance() ~= nowlevel then
							skill:SetMaxPerformance(nowlevel) 
							skill:SetPerformance(nowlevel) 
						end
					end
				end
			elseif nowlevel == 0 then
				local guard_skillCon = guard:GetSkillContainer()
				if guard_skillCon:GetSkill(skill_id) ~= nil then
					local skill = guard_skillCon:GetSkill(skill_id)
					skill:SetMaxPerformance(nowlevel) 
					skill:SetPerformance(nowlevel) 
				end
			end
		end
	end
	guard:RecalcAttr()
end

function CultivationSkill.init()
	CultivationSkill.CultivationSkillMapping = {}
	CultivationSkill.ItemDataMapping = {}
	for k, v in ipairs(CultivationSkill.SkillData) do
		CultivationSkill.CultivationSkillMapping[v.SkillID] = k
	end
	for k, v in ipairs(CultivationSkill.ItemData) do
		CultivationSkill.ItemDataMapping[v.Id] = v.Exp
	end
	
end
CultivationSkill.init()

--获取修炼技能数据
function CultivationSkill.GetCulSKillData(player, version)
	local LevelData = CultivationSkill.GetSkillData(player)
	for k, v in pairs(LevelData) do
		--sLuaApp:LuaDbg("k:"..k.."  vNowLevel:"..v.NowLevel.."  vNowExp:"..v.NowExp.."  vNeedExp:"..v.NowNeedExp)
	end
	CultivationSkill.GetMaxSkillLevel(player)
	local str = [[
		if RoleSkillUI then
	]]
	Data.CultivationSkill = {}
	Data.CultivationSkill.Version = version
	--sLuaApp:LuaDbg("version:"..version)
	--sLuaApp:LuaDbg("CultivationSkill.Version:"..CultivationSkill.Version)
	if version ~= CultivationSkill.Version then
		str = str .. [[
				RoleSkillUI.CulSkillData.SkillInfo = ]]..Lua_tools.serialize(CultivationSkill.SkillData)..[[
				RoleSkillUI.CulSkillData.SkillLevelExtra = ]]..Lua_tools.serialize(CultivationSkill.SkillLevelExtra)..[[
				RoleSkillUI.CulSkillData.ItemData = ]]..Lua_tools.serialize(CultivationSkill.ItemData)..[[
		]]
	end
	str = str .. [[
			RoleSkillUI.CulSkillData.SkillNowLevel = ]]..Lua_tools.serialize(LevelData)..[[
			RoleSkillUI.CulSkillData.SkillMaxLevel = ]]..player:GetInt("CulSkillMaxLevel")..[[
			RoleSkillUI.CulSkillData.OnceCulConsume = ]]..CultivationSkill.OnceCulConsume["MoneyVal"]..[[
			RoleSkillUI.Version = ]]..CultivationSkill.Version..[[
			RoleSkillUI.RefreshServerData()
		end
	]]
	--RoleSkillUI.PracticeRefresh()
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--获取玩家当前等级对应的最大修炼等级
function CultivationSkill.GetMaxSkillLevel(player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local maxlevel = 0
	for k, v in pairs(CultivationSkill.SkillLevelLimit) do
		if CultivationSkill.SkillLevelLimit[k + 1] then
			if level >= v.level and level < CultivationSkill.SkillLevelLimit[k + 1].level then
				maxlevel = v.CulSkillMaxLevel
				break
			end
		else
			if level == v.level then
				maxlevel = v.CulSkillMaxLevel
				break
			end
		end
	end
	player:SetInt("CulSkillMaxLevel", maxlevel)
end

--获取技能数据
function CultivationSkill.GetSkillData(player)
	local res = {}
	for i = 1, #CultivationSkill.SkillData do
		res[CultivationSkill.SkillData[i].SkillID] = {NowLevel = player:GetInt("CultivationSkill_NowLevel_"..i), NowExp = player:GetInt("CultivationSkill_NowExp_"..i), NowNeedExp = CultivationSkill.SkillLevelExtra[player:GetInt("CultivationSkill_NowLevel_"..i) + 1].Exp}
	end
	return res
end

--学习(花费银币)
function CultivationSkill.LearnTime(player, skill_id, count)
	local skill_id = tonumber(skill_id) 
	local count = tonumber(count)
	if count <= 0 then
		return ""
	end
	local exp = count * CultivationSkill.OnceCulConsume["Exp"]
	local mapping = CultivationSkill.CultivationSkillMapping
	local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])
	if nowlevel >= player:GetInt("CulSkillMaxLevel") then
		sLuaApp:NotifyTipsMsg(player, "技能修炼失败,已到达当前可修炼的最高等级")
		return ""
	end
	local MoneyVal = count*CultivationSkill.OnceCulConsume["MoneyVal"]
	if Lua_tools.IsMoneyEnough(player, 5, MoneyVal) == false then
		if MoneyChange then
			local f_name = [[CultivationSkill.LearnTime(player,]]..skill_id..[[,]]..count..[[)]]
			MoneyChange.LackMoney(player, 5, MoneyVal, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(inte_tb.MoneyType).."不足，不能修炼")
		end
		return ""
	end
	
	if Lua_tools then
		if Lua_tools.SubMoney(player, 5, MoneyVal, "修炼技能系统", "修炼技能", "修炼技能消耗银币："..MoneyVal) then
			CultivationSkill.AddExp(player, skill_id, exp)
			return ""
		else
			sLuaApp:NotifyTipsMsgEx(player, "您的银币不足，无法修炼")
			return ""
		end
	else
		sLuaApp:LuaDbg("没有找到Lua_tools")
		return ""
	end
end

--使用修炼丹
function CultivationSkill.UseElixir(player, skill_id, param, show_exp)
	local skill_id = tonumber(skill_id)
	local show_exp = tonumber(show_exp)
	if CultivationSkill.CultivationSkillMapping[skill_id] == nil then
		return ""
	end
	if type(param) ~= "string" then
		return ""
	end
	local mapping = CultivationSkill.CultivationSkillMapping
	local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])

	if nowlevel >= player:GetInt("CulSkillMaxLevel") then
		sLuaApp:NotifyTipsMsg(player, "技能修炼失败,已到达当前可修炼的最高等级")
		return ""
	end
	if param == "" then
		sLuaApp:NotifyTipsMsg(player, "技能修炼失败,未选中任何修炼丹")
		return ""
	end
	local item_list = {}
	if string.find(param, ",") == nil then
		table.insert(item_list, sLuaApp:StrSplit(param, "-"))
	else
		for k, v in pairs(sLuaApp:StrSplit(param, ",")) do
			table.insert(item_list, sLuaApp:StrSplit(v, "-"))
		end
	end
	local exp = 0
	for k,v in pairs(item_list) do
		sLuaApp:LuaDbg("k:"..k.."  v1:"..v[1].."  v2:"..v[2])
		local item_guid = tonumber(v[1])
		local item_num = tonumber(v[2])
		local item = sItemSystem:GetItemByGUID(item_guid)
		if item:GetOwnerGUID() ~= player:GetGUID() then
			return ""
		end
		if CultivationSkill.ItemDataMapping then
			local item_id = item:GetId()
			exp = exp + (CultivationSkill.ItemDataMapping[item_id] * item_num)
		else
			sLuaApp:LuaDbg("没有itemData映射数据")
			return ""
		end
		
		if sItemSystem:ConsumeItem(item, item_num, "修炼技能系统", "修炼技能", "修炼技能消耗修炼丹") ~= 0 then
			sLuaApp:NotifyTipsMsgEx(player, "使用物品失败")
			return ""
		end
	end
	if show_exp == exp then
		CultivationSkill.AddExp(player, skill_id, exp)
		local str = [[
			if RoleSkillUI then
				RoleSkillUI.ResetCountData()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--CultivationSkill.GetCulSKillData(player, Data.CultivationSkill.Version)
	else
		sLuaApp:LuaDbg("修炼丹经验不相等")
	end
	return ""
end

function CultivationSkill.Remake(player)
	sLuaApp:LuaDbg("remake")
	for i = 1, #CultivationSkill.SkillData do
		 player:SetInt("CultivationSkill_NowLevel_"..i, 0)
		 player:SetInt("CultivationSkill_NowExp_"..i, 0)
	end
	local skillCon = player:GetSkillContainer()
	local skill_list = skillCon:GetSkills()
	for k, v in pairs(skill_list) do
		for a, b in pairs(CultivationSkill.CultivationSkillMapping) do
			if v:GetID() == a then
				skillCon:DestroySkill(v, true)
			end
		end
	end 
	return true
end

--增加技能经验
function CultivationSkill.AddExp(player, skill_id, exp)
	local mapping = CultivationSkill.CultivationSkillMapping
	local nowlevel = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])
	sLuaApp:LuaDbg("nowlevel:"..nowlevel)
	local expData = CultivationSkill.SkillLevelExtra
	sLuaApp:LuaDbg("CulSkillMaxLevel:"..player:GetInt("CulSkillMaxLevel"))
	if nowlevel >= player:GetInt("CulSkillMaxLevel") then
		return ""
	end
	--player:SetInt("CultivationSkill_NowExp_"..mapping[skill_id], 0)
	if player:GetInt("CultivationSkill_NowExp_"..mapping[skill_id]) == 0 then
		player:SetInt("CultivationSkill_NowExp_"..mapping[skill_id], exp)
	else
		player:SetInt("CultivationSkill_NowExp_"..mapping[skill_id], player:GetInt("CultivationSkill_NowExp_"..mapping[skill_id]) + exp)
	end
	local nowexp = player:GetInt("CultivationSkill_NowExp_"..mapping[skill_id])
	sLuaApp:LuaDbg("nowexp:"..nowexp)
	local count = nowexp
	local needexp = 0
	local now_show_exp = 0
	for i = 1, #expData do
		count = count - expData[i].Exp
		needexp = needexp + expData[i].Exp
		if count < 0 then
			local level = expData[i].Level - 1
			now_show_exp = expData[i].Exp + count
			if nowlevel ~= level then
				player:SetInt("CultivationSkill_NowLevel_"..mapping[skill_id], level)
				if Achievement then
					Achievement.Achievement_Practice_Skill(player,skill_id,level)
				end
				CultivationSkill.AddAllTypeExp(player, skill_id, level)
			end
			sLuaApp:LuaDbg("等级："..(expData[i].Level - 1) )
			break
		end

		if i == #expData then
			if player:GetInt("CultivationSkill_NowExp_"..mapping[skill_id]) >= needexp then
				local level = expData[i].Level - 1
				if nowlevel ~= level then
				player:SetInt("CultivationSkill_NowLevel_"..mapping[skill_id], level)
				if Achievement then
						Achievement.Achievement_Practice_Skill(player,skill_id,level)
					end
					CultivationSkill.AddAllTypeExp(player, skill_id, level)
				end
			end
		end

	end
	sLuaApp:NotifyTipsMsgEx(player, "获得"..exp.."点修炼经验")
	CultivationSkill.GetCulSKillData(player, Data.CultivationSkill.Version)
	return ""
end

function CultivationSkill.AddAllTypeExp(player, skill_id, level)
	local skillData = SkillConfig.GetById(skill_id)
	--宠物容器
	local petCon = player:GetPetContainer(PET_CONTAINER_PANEL)
	local pet_list = petCon:GetPetList()
	--宠物仓库
	local petCon_2 = player:GetPetContainer(PET_CONTAINER_WAREHOUSE_PETS)
	local pet_list_2 = petCon_2:GetPetList()

	local guardCon = player:GetGuardContainer()
	local guard_list = guardCon:GetGuards()

	if skillData.ActorType == 1 then
	--适用于角色
	sLuaApp:LuaDbg("角色技能升级")
	local skillCon = player:GetSkillContainer()
	CultivationSkill.UpSkill(player, skillCon, skill_id, level)
	local skill = skillCon:GetSkill(skill_id)
	if skill ~= nil then
		sLuaApp:LuaDbg("当前技能"..skill_id.."熟练度"..skill:GetPerformance())
	else
		sLuaApp:LuaDbg("没有该技能")
	end
elseif skillData.ActorType == 2 then
	--适用于宠物
	if pet_list ~= nil then
		for k, v in pairs(pet_list) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
	if pet_list_2 ~= nil then
		for k, v in pairs(pet_list_2) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
elseif skillData.ActorType == 3 then
	--适用于侍从
	sLuaApp:LuaDbg("提升侍从技能")
	if guard_list ~= nil then
		for k, v in pairs(guard_list) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
elseif skillData.ActorType == 5 then
	--适用于所有单位，角色、宠物、侍从
	local player_skillCon = player:GetSkillContainer()
	CultivationSkill.UpSkill(player, player_skillCon, skill_id, level)
	if pet_list ~= nil then
		for k, v in pairs(pet_list) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
	if pet_list_2 ~= nil then
		for k, v in pairs(pet_list_2) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
	if guard_list ~= nil then
		sLuaApp:LuaDbg("添加技能")
		for k, v in pairs(guard_list) do
			local skillCon = v:GetSkillContainer()
			CultivationSkill.UpSkill(player, skillCon, skill_id, level)
		end
	end
end

end


function CultivationSkill.UpSkill(player, skillCon, skill_id, level)
	local skill = skillCon:GetSkill(skill_id)
	sLuaApp:LuaDbg("UpSkill")
	if skill ~= nil then
		sLuaApp:LuaDbg("拥有技能")
		skill:SetMaxPerformance(level)
		skill:SetPerformance(level)
	else
		sLuaApp:LuaDbg("创建技能")
		skillCon:CreateSkill(skill_id, level, level, true)
	end
end
