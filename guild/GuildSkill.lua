--帮派技能
GuildSkill = {}

--帮派技能版本号
GuildSkill.Version = "230731"

--帮派技能单次学习消耗以及增长的经验
GuildSkill.OnceGuildConsume = {MoneyVal = 20000, GuildContribute = 20, Exp = 20}

--帮派技能Id
GuildSkill.SkillData = {
	{SkillID = 6101},
	{SkillID = 6102},
	{SkillID = 6103},
	{SkillID = 6104},
	{SkillID = 6105},
	{SkillID = 6106},
}

GuildSkill.InitMAxSkillLevel = 10

--帮派技能每级所需经验(需要比最大等级多配置1级)
GuildSkill.SkillLevelExtra = {
	{Level = 1, Exp = 40},
	{Level = 2, Exp = 40},
	{Level = 3, Exp = 40},
	{Level = 4, Exp = 40},
	{Level = 5, Exp = 40},
	{Level = 6, Exp = 40},
	{Level = 7, Exp = 40},
	{Level = 8, Exp = 40},
	{Level = 9, Exp = 40},
	{Level = 10, Exp = 40},
	{Level = 11, Exp = 60},
	{Level = 12, Exp = 60},
	{Level = 13, Exp = 60},
	{Level = 14, Exp = 60},
	{Level = 15, Exp = 60},
	{Level = 16, Exp = 60},
	{Level = 17, Exp = 60},
	{Level = 18, Exp = 60},
	{Level = 19, Exp = 60},
	{Level = 20, Exp = 60},
	{Level = 21, Exp = 80},
	{Level = 22, Exp = 80},
	{Level = 23, Exp = 80},
	{Level = 24, Exp = 80},
	{Level = 25, Exp = 80},
	{Level = 26, Exp = 80},
	{Level = 27, Exp = 80},
	{Level = 28, Exp = 80},
	{Level = 29, Exp = 80},
	{Level = 30, Exp = 80},
	{Level = 31, Exp = 100},
	{Level = 32, Exp = 100},
	{Level = 33, Exp = 100},
	{Level = 34, Exp = 100},
	{Level = 35, Exp = 100},
	{Level = 36, Exp = 100},
	{Level = 37, Exp = 100},
	{Level = 38, Exp = 100},
	{Level = 39, Exp = 100},
	{Level = 40, Exp = 100},
	{Level = 41, Exp = 200},
	{Level = 42, Exp = 200},
	{Level = 43, Exp = 200},
	{Level = 44, Exp = 200},
	{Level = 45, Exp = 200},
	{Level = 46, Exp = 200},
	{Level = 47, Exp = 200},
	{Level = 48, Exp = 200},
	{Level = 49, Exp = 200},
	{Level = 50, Exp = 200},
	{Level = 51, Exp = 300},
	{Level = 52, Exp = 300},
	{Level = 53, Exp = 300},
	{Level = 54, Exp = 300},
	{Level = 55, Exp = 300},
	{Level = 56, Exp = 300},
	{Level = 57, Exp = 300},
	{Level = 58, Exp = 300},
	{Level = 59, Exp = 300},
	{Level = 60, Exp = 300},
	{Level = 61, Exp = 400},
	{Level = 62, Exp = 400},
	{Level = 63, Exp = 400},
	{Level = 64, Exp = 400},
	{Level = 65, Exp = 400},
	{Level = 66, Exp = 400},
	{Level = 67, Exp = 400},
	{Level = 68, Exp = 400},
	{Level = 69, Exp = 400},
	{Level = 70, Exp = 400},
	{Level = 71, Exp = 700},
	{Level = 72, Exp = 700},
	{Level = 73, Exp = 700},
	{Level = 74, Exp = 700},
	{Level = 75, Exp = 700},
	{Level = 76, Exp = 700},
	{Level = 77, Exp = 700},
	{Level = 78, Exp = 700},
	{Level = 79, Exp = 700},
	{Level = 80, Exp = 700},
	{Level = 81, Exp = 1000},
	{Level = 82, Exp = 1000},
	{Level = 83, Exp = 1000},
	{Level = 84, Exp = 1000},
	{Level = 85, Exp = 1000},
	{Level = 86, Exp = 1000},
	{Level = 87, Exp = 1000},
	{Level = 88, Exp = 1000},
	{Level = 89, Exp = 1000},
	{Level = 90, Exp = 1000},
	{Level = 91, Exp = 1000},
	{Level = 92, Exp = 1000},
	{Level = 93, Exp = 1000},
	{Level = 94, Exp = 1000},
	{Level = 95, Exp = 1000},
	{Level = 96, Exp = 1000},
	{Level = 97, Exp = 1000},
	{Level = 98, Exp = 1000},
	{Level = 99, Exp = 1000},
	{Level = 100, Exp = 1000},
	{Level = 101, Exp = 1000},
	{Level = 102, Exp = 1000},
	{Level = 103, Exp = 1000},
	{Level = 104, Exp = 1000},
	{Level = 105, Exp = 1000},
	{Level = 106, Exp = 1000},
	{Level = 107, Exp = 1000},
	{Level = 108, Exp = 1000},
	{Level = 109, Exp = 1000},
	{Level = 110, Exp = 1500},
	{Level = 111, Exp = 1500},
	{Level = 112, Exp = 1500},
	{Level = 113, Exp = 1500},
	{Level = 114, Exp = 1500},
	{Level = 115, Exp = 1500},
	{Level = 116, Exp = 1500},
	{Level = 117, Exp = 1500},
	{Level = 118, Exp = 1500},
	{Level = 119, Exp = 1500},
	{Level = 120, Exp = 1500},
	{Level = 121, Exp = 2000},
}

--初始化，创建帮派技能映射
function GuildSkill.init()
	GuildSkill.GuildSkillMapping = {}
	for k, v in ipairs(GuildSkill.SkillData) do
		GuildSkill.GuildSkillMapping[v.SkillID] = k
	end
	if GuildSkill.FixData == nil then
		GuildSkill.FixData = {}
	end
	GuildSkill.FixData.SkillData = Lua_tools.serialize(GuildSkill.SkillData)
	GuildSkill.FixData.SkillLevelExtra = Lua_tools.serialize(GuildSkill.SkillLevelExtra)
end
GuildSkill.init()

--@newinter GuildSkill.Test(player)
function GuildSkill.Test(player)
	sGuildSystem:AddFund(player:GetGuild(),1000000)
	sGuildSystem:AddBuildDegree(player,100000)
	return ""
end

--获取帮派技能数据
function GuildSkill.GetGuildSkillData(player, version)
	local guild = player:GetGuild()
	local guild_level = 0
	local guild_skillMaxLevel = 0
	local version = tostring(version)
	if guild ~= nil then
		guild_level = guild:GetValutLevel()
	end
	--sLuaApp:LuaDbg("guild_level"..guild_level)
	guild_skillMaxLevel = GuildSkill.GetPlayerNowGuildSkillLevel(player)
	--sLuaApp:LuaDbg("guild_skillMaxLevel:"..guild_skillMaxLevel)
	player:SetInt("GuildSkillMaxLevel", guild_skillMaxLevel)

	local LevelData = GuildSkill.GetLevelData(player)
	local skillbuildData = GuildConfig.BuildingsConfig[4]["BuildingLevels"]
	local str = [[
		if RoleSkillUI then
	]]
	Data.GuildSkill = {}
	Data.GuildSkill.Version = version
	--sLuaApp:LuaDbg("version:"..version)
	--sLuaApp:LuaDbg("CultivationSkill.Version:"..GuildSkill.Version)
	if version ~= GuildSkill.Version then
		local NowMAXSkillLevel = 0 
		for k, v in ipairs(skillbuildData) do
			NowMAXSkillLevel = NowMAXSkillLevel + v["Param1"]
		end
		NowMAXSkillLevel = NowMAXSkillLevel + GuildSkill.InitMAxSkillLevel
	
		str = str .. [[
				RoleSkillUI.GuildSkillData.SkillInfo = ]]..GuildSkill.FixData.SkillData..[[
				RoleSkillUI.GuildSkillData.SkillLevelExtra = ]]..GuildSkill.FixData.SkillLevelExtra..[[
				RoleSkillUI.GuildSkillData.OnceGuildConsume = ]]..Lua_tools.serialize(GuildSkill.OnceGuildConsume)..[[
				RoleSkillUI.GuildSkillData.NowMAXSkillLevel = ]]..NowMAXSkillLevel..[[
		]]
	end
	str = str .. [[
			RoleSkillUI.GuildSkillData.SkillNowLevel = ]]..Lua_tools.serialize(LevelData)..[[
			RoleSkillUI.GuildSkillData.SkillMaxLevel = ]]..player:GetInt("GuildSkillMaxLevel")..[[
			RoleSkillUI.GuildSkillData.Version = ]]..GuildSkill.Version..[[
			RoleSkillUI.RefreshServerData()
		end
	]]
	--RoleSkillUI.GuildRefresh()
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--@newinter GuildSkill.GetPlayerNowGuildSkillLevel(player)
function GuildSkill.GetPlayerNowGuildSkillLevel(player)
	local guild = player:GetGuild()
	local guild_level = 0
	local guild_skillMaxLevel = 0
	local version = tostring(version)
	local retLevel = GuildSkill.InitMAxSkillLevel
	if guild ~= nil then
		guild_level = guild:GetValutLevel()
	end
	--sLuaApp:LuaDbg("guild_level"..guild_level)
	
	if guild_level ~= 0 then
		if GuildConfig then
			if GuildConfig.BuildingsConfig then
				for i = 1, guild_level do 
					retLevel = retLevel + GuildConfig.BuildingsConfig[4]["BuildingLevels"][i]["Param1"]
				end
			end
		else
			sLuaApp:LuaErr("没有找到帮派配置")
			return 0
		end
	end
	return retLevel
end

function GuildSkill.GetLevelData(player)
	local res = {}
	for i = 1, #GuildSkill.SkillData do
		local GuildSkillData = SkillConfig.GetById(GuildSkill.SkillData[i].SkillID)
		res[GuildSkill.SkillData[i].SkillID] = {NowLevel = player:GetInt("GuildSkill_NowLevel_"..i), NowExp = player:GetInt("GuildSkill_NowExp_"..i), NowNeedExp = GuildSkill.SkillLevelExtra[player:GetInt("GuildSkill_NowLevel_"..i) + 1].Exp, Att1 = GuildSkillData.FixedAtt1, Att1Coef = GuildSkillData.FixedAtt1Att1Coef2, Att2 = GuildSkillData.FixedAtt2, Att2Coef = GuildSkillData.FixedAtt2Att1Coef2}
	end
	return res
end

--学习(花费银币)
function GuildSkill.LearnTime(player, skill_id, count)
	sLuaApp:LuaDbg("count:"..count)
	local skill_id = tonumber(skill_id) 
	local count = tonumber(count)
	if count <= 0 then
		return ""
	end
	local exp = count * GuildSkill.OnceGuildConsume["Exp"]
	local mapping = GuildSkill.GuildSkillMapping
	local nowlevel = player:GetInt("GuildSkill_NowLevel_"..mapping[skill_id])
	local guild = player:GetGuild()
	if guild == nil then
		sLuaApp:NotifyTipsMsg(player, "请先加入一个帮派！")
		return ""
	end
	
	if nowlevel >= player:GetInt("GuildSkillMaxLevel") then
		sLuaApp:NotifyTipsMsg(player, "技能学习失败,已到达当前帮派技能可学习的最高等级")
		return ""
	end
	
	local GuildContribute = count*GuildSkill.OnceGuildConsume["GuildContribute"]
	local nowexp = player:GetInt("GuildSkill_NowExp_"..mapping[skill_id])
	local maxLevel = player:GetInt("GuildSkillMaxLevel")
	local maxLevelExp = 0
	for i = 1, maxLevel do
		maxLevelExp = maxLevelExp + GuildSkill.SkillLevelExtra[i]["Exp"]
	end
	local tip = false
	if exp > maxLevelExp - nowexp then
		--sLuaApp:LuaDbg("==============:"..(maxLevelExp - nowexp)/GuildSkill.OnceGuildConsume.Exp)
		tip = true
		count = math.ceil((maxLevelExp - nowexp)/GuildSkill.OnceGuildConsume.Exp)
	end
	local MoneyVal = count*GuildSkill.OnceGuildConsume["MoneyVal"]
	local exp = count * GuildSkill.OnceGuildConsume["Exp"]
	local GuildContribute = count*GuildSkill.OnceGuildConsume["GuildContribute"]

	if Lua_tools.IsMoneyEnough(player, 5, MoneyVal) == false then
		if MoneyChange then
			local f_name = [[GuildSkill.LearnTime(player,]]..skill_id..[[,]]..count..[[)]]
			MoneyChange.LackMoney(player, 5, MoneyVal, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(inte_tb.MoneyType).."不足，不能学习")
		end
		return ""
	end
	
	if not player:SubGuildContribute(GuildContribute, "帮派技能系统", "学习帮派技能", "学习帮派技能消耗帮贡"..GuildContribute.."点，获得经验"..exp.."点") then
		sLuaApp:NotifyTipsMsgEx(player, "扣除帮贡失败，无法学习")
		return ""
	end
	
	if Lua_tools.SubMoney(player, 5, MoneyVal) then
		GuildSkill.AddExp(player, skill_id, exp)
		if tip then
			sLuaApp:NotifyTipsMsgEx(player, "超出等级上限，学习"..count.."次，获得"..exp.."点经验,达到当前帮派技能最大等级")
		end
		GuildSkill.GetGuildSkillData(player, Data.GuildSkill.Version)
		return ""
	else
		sLuaApp:NotifyTipsMsgEx(player, "您的银币不足，无法修炼")
		return ""
	end
end

--给相应技能增加经验值
function GuildSkill.AddExp(player, skill_id, exp)
	local mapping = GuildSkill.GuildSkillMapping
	local nowlevel = player:GetInt("GuildSkill_NowLevel_"..mapping[skill_id])
	--sLuaApp:LuaDbg("nowlevel:"..nowlevel)
	local expData = GuildSkill.SkillLevelExtra
	--sLuaApp:LuaDbg("GuildSkillMaxLevel:"..player:GetInt("GuildSkillMaxLevel"))
	if nowlevel >= player:GetInt("GuildSkillMaxLevel") then
		return ""
	end
	--player:SetInt("CultivationSkill_NowExp_"..mapping[skill_id], 0)
	if player:GetInt("GuildSkill_NowExp_"..mapping[skill_id]) == 0 then
		player:SetInt("GuildSkill_NowExp_"..mapping[skill_id], exp)
	else
		player:SetInt("GuildSkill_NowExp_"..mapping[skill_id], player:GetInt("GuildSkill_NowExp_"..mapping[skill_id]) + exp)
	end
	local nowexp = player:GetInt("GuildSkill_NowExp_"..mapping[skill_id])
	local count = nowexp
	local now_show_exp = 0
	for i = 1, #expData do
		count = count - expData[i].Exp
		--sLuaApp:LuaDbg("count:"..count)
		if count < 0 then
			local level = expData[i].Level - 1
			--sLuaApp:LuaDbg("count:"..count)
			now_show_exp = expData[i].Exp + count
			--sLuaApp:LuaDbg("now_show_exp:"..now_show_exp)
			if nowlevel ~= level then
				player:SetInt("GuildSkill_NowLevel_"..mapping[skill_id], level)
				local skillData = SkillConfig.GetById(skill_id)
				local petCon = player:GetPetContainer(1)
				local pet_list = petCon:GetPetList()
				local guardCon = player:GetGuardContainer()
				local guard_list = guardCon:GetGuards()
				if skillData.ActorType == 1 then
					--适用于角色
					--sLuaApp:LuaDbg("角色技能升级")
					local skillCon = player:GetSkillContainer()
					GuildSkill.UpSkill(player, skillCon, skill_id, level)
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
							GuildSkill.UpSkill(player, skillCon, skill_id, level)
						end
					end
				elseif skillData.ActorType == 3 then
					--适用于侍从
					sLuaApp:LuaDbg("提升侍从技能")
					if guard_list ~= nil then
						for k, v in pairs(guard_list) do
							local skillCon = v:GetSkillContainer()
							GuildSkill.UpSkill(player, skillCon, skill_id, level)
						end
					end
				elseif skillData.ActorType == 5 then
					--适用于所有单位，角色、宠物、侍从
					local player_skillCon = player:GetSkillContainer()
					GuildSkill.UpSkill(player, player_skillCon, skill_id, level)
					local skill = player_skillCon:GetSkill(skill_id)
					if skill ~= nil then
						sLuaApp:LuaDbg("当前技能"..skill_id.."熟练度"..skill:GetPerformance())
					else
						sLuaApp:LuaDbg("没有该技能")
					end
					
					if pet_list ~= nil then
						for k, v in pairs(pet_list) do
							local skillCon = v:GetSkillContainer()
							GuildSkill.UpSkill(player, skillCon, skill_id, level)
						end
					end
					if guard_list ~= nil then
						sLuaApp:LuaDbg("添加技能")
						for k, v in pairs(guard_list) do
							local skillCon = v:GetSkillContainer()
							GuildSkill.UpSkill(player, skillCon, skill_id, level)
							local skill = skillCon:GetSkill(skill_id)
							if skill ~= nil then
								sLuaApp:LuaDbg("当前技能"..skill_id.."熟练度"..skill:GetPerformance())
							else
								sLuaApp:LuaDbg("没有该技能")
							end
						end
					end
				end
				if level == (#expData - 1) then
					player:SetInt("GuildSkill_NowExp_"..mapping[skill_id], player:GetInt("GuildSkill_NowExp_"..mapping[skill_id]) - now_show_exp)
					exp = exp - now_show_exp
				end
			end
			break
		end
	end
	sLuaApp:NotifyTipsMsgEx(player, "获得"..exp.."点修炼经验")
	return ""
end

--给技能提升等级
function GuildSkill.UpSkill(player, skillCon, skill_id, level)
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

function GuildSkill.Remake(player)
	sLuaApp:LuaDbg("remake")
	for i = 1, #GuildSkill.SkillData do
		 player:SetInt("GuildSkill_NowLevel_"..i, 0)
		 player:SetInt("GuildSkill_NowExp_"..i, 0)
	end
	local skillCon = player:GetSkillContainer()
	local skill_list = skillCon:GetSkills()
	for k, v in pairs(skill_list) do
		for a, b in pairs(GuildSkill.GuildSkillMapping) do
			if v:GetID() == a then
				skillCon:DestroySkill(v, true)
			end
		end
	end 
	return true
end

