--装备相关表单

PlayerSkillStudy = {}

PlayerSkillStudy.SkillProficiency = {
	[1] = "10000 + rein*5000",
	[2] = "level*100 + rein*3000",
}

PlayerSkillStudy.StudyConsume = {
	[1] = {ProficiencyUp = 50, Money_Val = "45+pfy*8/9", Money_Type = 5},
	[2] = {ProficiencyUp = 50, Money_Val = "(45+pfy*8/9)*(3/2)", Money_Type = 5},
	[3] = {ProficiencyUp = 50, Money_Val = "(45+pfy*8/9)*(7/2)", Money_Type = 5},
}

PlayerSkillStudy.ProficiencyConfig = {50,100}



function PlayerSkillStudy.RoleSkill_GetData(player)
	sLuaApp:LuaDbg("FormEquipGet!")
	--EquipBuild.Initialization(0)
	
	local playerSkillProficiency = {}
	--playerSkillProficiency.Proficiencys = {}
	playerSkillProficiency.Configs = PlayerSkillStudy.ProficiencyConfig
	playerSkillProficiency.PfyFomula = PlayerSkillStudy.SkillProficiency
	playerSkillProficiency.Consume = PlayerSkillStudy.StudyConsume
	--local playerRole = player:GetAttr(ROLE_ATTR_ROLE)
	--local skillList = PlayerSkillStudy.CanStudyList[playerRole]
	--local skill_container = player:GetSkillContainer()
	--if skillList then
	--	for k,v in pairs(skillList) do
	--		local skillData = skill_container:GetSkill(k)
	--		if skillData then
	--			playerSkillProficiency.Proficiencys[k] = skillData:GetPerformance()
	--		end
	--	end
	--end
	if Lua_tools then
		sLuaApp:LuaDbg("PlayerSkillStudy表单回馈")
		str = [[ if RoleSkillUI then
				RoleSkillUI.serverData = ]] .. Lua_tools.serialize(playerSkillProficiency) .. [[				
				RoleSkillUI.Refresh()
			end
		]]

		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	return ""
end

function PlayerSkillStudy.Study(player, skillID, isRepeat, isNoTips)
	local playerRole = player:GetAttr(ROLE_ATTR_ROLE)
	local skillLevel = PlayerSkillStudy.CanStudyList[playerRole][skillID]
	if not skillLevel then
		sLuaApp:NotifyTipsMsg(player, "不存在的技能ID")
		return
	end
	local studyConfig = PlayerSkillStudy.StudyConsume[skillLevel]
	if not studyConfig then
		sLuaApp:NotifyTipsMsg(player, "不存在的技能等级")
		return
	end
	local skill_container = player:GetSkillContainer()
	local skillData = skill_container:GetSkill(skillID)
	if not skillData then
		if isRepeat ~= 1 and isNoTips ~= 1 then
			sLuaApp:NotifyTipsMsg(player, "你没有学会当前技能")
		end
		return
	end
	local pfy = skillData:GetPerformance()
	local pfy_max = skillData:GetMaxPerformance()
	
	if pfy >= pfy_max then
		if not isNoTips then
			if PlayerSkillStudy.SkillName[skillID] then
				sLuaApp:NotifyTipsMsg(player, "【"..PlayerSkillStudy.SkillName[skillID].."】已经无法提升熟练度了！")
			end
		end
		return
	end
	local pfy_add = studyConfig.ProficiencyUp
	if pfy_max - pfy < pfy_add then
		pfy_add = pfy_max - pfy
	end
	
	local pfy_critical = PlayerSkillStudy.ProficiencyConfig[skillLevel] or 0

	
	local money_val = studyConfig.Money_Val
	if type(money_val) == "string" then
		money_val = math.ceil(assert(load("local pfy = "..pfy.." return "..money_val))()*pfy_add/studyConfig.ProficiencyUp)
	end
	if type(money_val) == "number" then
		if Lua_tools.SubMoney(player, studyConfig.Money_Type, money_val, "system", "SkillSystem", "技能学习") then
			skillData:SetPerformance(pfy+pfy_add)
			if PlayerSkillStudy.SkillName[skillID] then
				sLuaApp:NotifyTipsMsg(player, "技能【"..PlayerSkillStudy.SkillName[skillID].."】熟练度提升成功！")
				
				--提升技能熟练度任务判断
				if sQuestSystem:GetQuestState(player,7) == 3 then
					sQuestSystem:ForceReady(player,7)
				end
			end
			if isNoTips == nil or isNoTips == 1 then
				if pfy_critical > pfy and pfy+pfy_add >= pfy_critical then
					local next_skill = PlayerSkillStudy.SkillNext[playerRole][skillID]
					if next_skill then
						PlayerSkillStudy.NewSkillStudy(player, next_skill)
					end
				end
			end
		else
			if isNoTips == nil or isNoTips == 1 then
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(studyConfig.Money_Type).."不足！")
			end
		end
	end
	local next_skill = 0
	if isRepeat == 1 then
		pfy = pfy + pfy_add
		if pfy < pfy_max then
			for i = 1,math.ceil((pfy_max - pfy)/studyConfig.ProficiencyUp) do
				pfy_add = studyConfig.ProficiencyUp
				if pfy_max - pfy < pfy_add then
					pfy_add = pfy_max - pfy
				end
				money_val = studyConfig.Money_Val
				if type(money_val) == "string" then
					money_val = math.ceil(assert(load("local pfy = "..pfy.." return "..money_val))()*pfy_add/studyConfig.ProficiencyUp)
					--sLuaApp:NotifyTipsMsg(player, "当前 pfy = "..pfy.."   计算结果 money_val = " .. money_val)
				end
				if type(money_val) == "number" then
					if Lua_tools.SubMoney(player, studyConfig.Money_Type, money_val, "system", "SkillSystem", "技能学习") then
						if pfy_critical > pfy and pfy+pfy_add >= pfy_critical then
							next_skill = PlayerSkillStudy.SkillNext[playerRole][skillID]
							
						end
						pfy = pfy + pfy_add
						skillData:SetPerformance(pfy)
					else
						
						if next_skill ~= 0 then
							PlayerSkillStudy.NewSkillStudy(player, next_skill)
							
						end
						return false
					end
				end
			end
			if pfy >= pfy_max then

				if next_skill ~= 0 then
					PlayerSkillStudy.NewSkillStudy(player, next_skill)
					
				end
				return true
			end
		end
	end
end

function PlayerSkillStudy.StudyMore(player, skillID)
	PlayerSkillStudy.Study(player, skillID, 1)
end

function PlayerSkillStudy.StudyAll(player, school)
	local skillList = {}
	local schoolData = SchoolConfig.GetById(school)
	for i = 1,3 do
		local skill = schoolData['Skill'..i]	
		PlayerSkillStudy.Study(player, skill, 1, i)
	end
end

function PlayerSkillStudy.NewSkillStudy(player, skillID)
	local skill_container = player:GetSkillContainer()
	local skillData = skill_container:GetSkill(skillID)
	if skillData then
		sLuaApp:NotifyTipsMsg(player, "您已经学习了该技能")
		
		--学技能任务判断
		if sQuestSystem:GetQuestState(player,6) == 3 then
			sQuestSystem:ForceReady(player,6)
		end
		
		return
	end
	local playerRole = player:GetAttr(ROLE_ATTR_ROLE)
	local FrontSkill = 0
	if PlayerSkillStudy.SkillFrontList[playerRole] then
		FrontSkill = PlayerSkillStudy.SkillFrontList[playerRole][skillID]
	end
	if FrontSkill and FrontSkill ~= 0 then
		skillData = skill_container:GetSkill(FrontSkill)
		if not skillData then
			sLuaApp:NotifyTipsMsg(player, "当前无法学习该技能")
			return
		end
		if PlayerSkillStudy.CanStudyList[playerRole] then
			local index = PlayerSkillStudy.CanStudyList[playerRole][FrontSkill]
			if index then
				local ProficiencyMin = PlayerSkillStudy.ProficiencyConfig[index]
				if ProficiencyMin then
					if skillData:GetPerformance() >= ProficiencyMin then
						skill_container:CreateSkill(skillID, 1, PlayerSkillStudy.GetMaxPerformance(player:GetAttr(ROLE_ATTR_LEVEL), player:GetAttr(ROLE_ATTR_REINCARNATION)), true)
						return
					end
				end
			end
		end
	end
	sLuaApp:NotifyTipsMsg(player, "配置错误，无法学习该技能")
end

function PlayerSkillStudy.on_player_levelup(player, newlevel)

	local playerRole = player:GetAttr(ROLE_ATTR_ROLE)
	local rein = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local skillList = PlayerSkillStudy.CanStudyList[playerRole]
	local skill_container = player:GetSkillContainer()
	
	local maxer = PlayerSkillStudy.GetMaxPerformance(newlevel, rein)
	--sLuaApp:NotifyTipsMsg(player, "玩家升级儿~")
	if skillList then
		for k,v in pairs(skillList) do
			local skillData = skill_container:GetSkill(k)
			if skillData then
				skillData:SetMaxPerformance(maxer)
			end
		end
	end

	--玩家自动加点
    --判断是否开启了自动加点
	if player:GetInt("ADDPOINT_Auto") == 1 then 
		local method = player:GetString("ADDPOINT_Method")
		if  method then
			local list = sLuaApp:StrSplit(method, ",")  
			--拿出要加的点数
			local point1 = tonumber(list[1])
			local point2 = tonumber(list[2])
			local point3 = tonumber(list[3])
			local point4 = tonumber(list[4])
			local point5 = tonumber(list[5])
			local proportion1 = point1/5
			local proportion2 = point2/5
			local proportion3 = point3/5
			local proportion4 = point4/5
			local proportion5 = point5/5
			--判断剩余点数是否大于5，如果大于5   将会按照玩家加点方案加点
		    local have = player:GetAttr(ROLE_ATTR_REMAIN_POINT)
			if have >= 5 then
				if have%5 == 0 then
					--按玩家方案将剩余点数加完
					player:AddPoint(have*proportion1, have*proportion2, have*proportion3, have*proportion4,have*proportion5)
				else
					local surplus = have%5
					player:AddPoint((have-surplus)*proportion1, (have-surplus)*proportion2, (have-surplus)*proportion3, (have-surplus)*proportion4,(have-surplus)*proportion5)
					--将剩余点数按方案加完
					if AddPoint.Auto_Mode == 1 then
						AddPoint.Not_Enough_Auto(player,surplus,list)
						player:SetInt("PLAYER_PointsUsed", surplus+player:GetInt("PLAYER_PointsUsed"))
					else
						sLuaApp:NotifyTipsMsg(player, "您还有不能自动分配的潜能点数")
					end
				end
				player:SetInt("PLAYER_PointsUsed", have+player:GetInt("PLAYER_PointsUsed"))
			end
		end
	end
end

function PlayerSkillStudy.GetMaxPerformance(level, rein)
	local maxer = 0
	if not rein then
		rein = 0
	end
	for k,v in ipairs(PlayerSkillStudy.SkillProficiency) do
		local miner = 0
		if type(v) == 'number' then
			miner = v
		elseif type(v) == 'string' then
			miner = assert(load("local level = "..level.." local rein = "..rein.." return "..v))()
		end
		if type(miner) == 'number' then
			if miner > 0 then
				if maxer == 0 then
					maxer = miner
				elseif miner < maxer then
					maxer = miner
				end
			end
		end
	end
	return maxer
end

function PlayerSkillStudy.Initialization()
	PlayerSkillStudy.SkillFrontList = {}
	PlayerSkillStudy.CanStudyList = {}
	PlayerSkillStudy.SkillName = {}
	PlayerSkillStudy.SkillNext = {}
	local playerConfig = {}
	for i = 1, 10 do
		PlayerSkillStudy.CanStudyList[i] = {}
		PlayerSkillStudy.SkillFrontList[i] = {}
		PlayerSkillStudy.SkillNext[i] = {}
		playerConfig[i] = RoleConfig.GetById(i)
		--local school1 = playerConfig[i].School1
		--local school2 = playerConfig[i].School2
		--local school3 = playerConfig[i].School3
		
		for j = 1,3 do
			for m = 1,3 do
				if not PlayerSkillStudy.CanStudyList[i] then
					PlayerSkillStudy.CanStudyList[i] = {}
				end
				local skillID = SchoolConfig.GetById(playerConfig[i]['School'..j])['Skill'..m]
				PlayerSkillStudy.CanStudyList[i][skillID] = m
				local Tb_skill = SkillConfig.GetById(skillID)
				if Tb_skill then
					PlayerSkillStudy.SkillName[skillID] = Tb_skill.Name
				end
				if m > 1 then
					PlayerSkillStudy.SkillFrontList[i][skillID] = SchoolConfig.GetById(playerConfig[i]['School'..j])['Skill'..(m-1)]
					PlayerSkillStudy.SkillNext[i][SchoolConfig.GetById(playerConfig[i]['School'..j])['Skill'..(m-1)]] = skillID
				end
			end
		end
	end
	
	--if Lua_tools then
	--	print("PlayerSkillStudy.SkillFrontList = " .. Lua_tools.serialize(PlayerSkillStudy.SkillFrontList))
	--	print("PlayerSkillStudy.CanStudyList = " .. Lua_tools.serialize(PlayerSkillStudy.CanStudyList))
	--end
end

--PlayerSkillStudy.Initialization()