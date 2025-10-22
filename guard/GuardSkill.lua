--侍从技能
GuardSkill = {}

--UPtrench 升阶槽位
--trenchLevelUP 槽位技能提升的等级
--AllLevelUP 所有技能等级提升

--升星主动技能提升配置：升级槽位、提升技能等阶、提升所有技能等级
GuardSkill.GuardStarUPConfig = {
	[2] = {UPtrench = 1, trenchLevelUP = 1, AllLevelUP = 1},
	[3] = {UPtrench = 2, trenchLevelUP = 1, AllLevelUP = 1},
	[4] = {UPtrench = 3, trenchLevelUP = 1, AllLevelUP = 1},
	[5] = {UPtrench = 1, trenchLevelUP = 1, AllLevelUP = 1},
	[6] = {UPtrench = 2, trenchLevelUP = 1, AllLevelUP = 1},
}

--情缘升星被动技能提升的等级
GuardSkill.GuardLoveStarUPConfig = {
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[4] = 1,
	[5] = 1,
	[6] = 1,
}

--获取技能数据
function GuardSkill.GetSkillData(player, guard_id)
	local GuardCon = player:GetGuardContainer()
	local guards = GuardCon:GetGuards()
	local guard = ""
	for k, v in ipairs(guards) do
		if v:GetId() == guard_id then
			--sLuaApp:LuaDbg("拥有该侍从")
			guard = v
		break
		end
	end
	local count = 0
	for k, v in ipairs(GuardSkill.GuardLoveStarUPConfig) do
		count = count + v
	end
	
	if guard ~= "" then
		local skilltable = GuardSkill.GetAllSkillData(player, guard, count)
		local str = [[
			if GuardUI then
				GuardUI['SkillList'] = ]]..Lua_tools.serialize(skilltable)..[[
				GuardUI.RefreshGuardSkillBg_Attr()
			end
		]]
		--sLuaApp:LuaDbg(str)
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		local skilltable = GuardSkill.GetAllSkillDataById(player, guard_id, count)
		local str = [[
			if GuardUI then
				GuardUI['SkillList'] = ]]..Lua_tools.serialize(skilltable)..[[
				GuardUI.RefreshGuardSkillBg_Attr()
			end
		]]
		--sLuaApp:LuaDbg(str)
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function GuardSkill.GetAllSkillDataById(player, guard_id, count)
	local guardData = GuardConfig.GetById(guard_id)
	--local guardStarData = GuardStarConfig.GetById(guard_id)
	local GuardCon = player:GetGuardContainer()
	local result = {}
	local love1Id = guardData.Love1Id
	local love2Id = guardData.Love2Id
	local love3Id = guardData.Love3Id
	
	for k, v in pairs(guardData) do
		sLuaApp("k: "..k.."   v:"..v)
	end
	
	local love1_starLevel = GuardSkill.GetLoveStar(GuardCon, love1Id)
	local love2_starLevel = GuardSkill.GetLoveStar(GuardCon, love2Id)
	local love3_starLevel = GuardSkill.GetLoveStar(GuardCon, love3Id)
	
	local love1 = guardData["Love1Skill"]
	local love2 = guardData["Love2Skill"]
	local love3 = guardData["Love3Skill"]
	
	for i = 1, 9 do
		if not guardData["skill"..i] then
			break
		elseif guardData["skill"..i] ~= 0 then
			result["skill"..i] = guardData["skill"..i]
		end
	end
	
	result["guard_star"] = 0
	result["love1_star"] = love1_starLevel
	result["love2_star"] = love2_starLevel
	result["love3_star"] = love3_starLevel
	result["Love1Skill"] = {love1, 0, 0, count, false}
	result["Love2Skill"] = {love2, 0, 0, count, false}
	result["Love3Skill"] = {love3, 0, 0, count, false}
	result["AllLoveAddSkill"] = {guardData["AllLoveAddSkill1"], 0, false}
	
	return result
end

--返回侍从技能id以及星级
function GuardSkill.GetAllSkillData(player, guard, count)
	--local guard = sGuardSystem:GetGuard(guard_guid)
	local guard_id = guard:GetId()
	--sLuaApp:LuaDbg(guard_id)
	if not count then
		local count = 0
		for k, v in ipairs(GuardSkill.GuardLoveStarUPConfig) do
			count = count + v
		end
	end
	
	local guardData = GuardConfig.GetById(guard_id)
	local guardSkillList = {}
	for i = 1, 9 do
		if guardData["Skill"..i] ~= 0 then
			guardSkillList[tostring(guardData["Skill"..i])] = true
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(guardSkillList))
	local GuardCon = player:GetGuardContainer()
	local SkillCon = guard:GetSkillContainer()

	local love1Id = guardData.Love1Id
	local love2Id = guardData.Love2Id
	local love3Id = guardData.Love3Id

	local guard_starLevel = GuardSkill.GetLoveStar(player, GuardCon, guard_id)
	local love1_starLevel = GuardSkill.GetLoveStar(player, GuardCon, love1Id)
	local love2_starLevel = GuardSkill.GetLoveStar(player, GuardCon, love2Id)
	local love3_starLevel = GuardSkill.GetLoveStar(player, GuardCon, love3Id)
	
	local result = {}
	local skills = SkillCon:GetSkills()
	
	local skillcount = 0
	for k, v in ipairs(skills) do
		sLuaApp:LuaDbg("k: "..k.."   vid: "..v:GetId().."   vlevel: "..v:GetPerformance())
		if guardSkillList[tostring(v:GetId())]	then 
			skillcount = skillcount + 1
			if guard:GetInt("GuardSkillID_"..skillcount) == 0 and guard:GetInt("GuardSkillLV_"..skillcount) == 0 then
				guard:SetInt("GuardSkillID_"..skillcount, v:GetId())
				guard:SetInt("GuardSkillLV_"..skillcount, v:GetPerformance())
			end
		end
	end
	
	result["guard_star"] = guard_starLevel
	result["love1_star"] = love1_starLevel
	result["love2_star"] = love2_starLevel
	result["love3_star"] = love3_starLevel

	local love1 = guardData["Love1Skill"]
	local love2 = guardData["Love2Skill"]
	local love3 = guardData["Love3Skill"]
	local allLoveLevel = math.min(math.min(tonumber(love1_starLevel),tonumber(love2_starLevel)), tonumber(love3_starLevel))
	local allLove = guardData["AllLoveAddSkill1"]
	
	for i = 1, 4 do
		local skillid = guard:GetInt("GuardSkillID_"..i)
		if skillid ~= love1 and skillid ~= love2 and skillid ~= love3 and skillid ~= allLove then
			result["skill"..i] = {guard:GetInt("GuardSkillID_"..i), guard:GetInt("GuardSkillLV_"..i)}
		end
	end
	
	GuardSkill.GetLoveSkill(result, SkillCon, 1, love1, guard, count)
	GuardSkill.GetLoveSkill(result, SkillCon, 2, love2, guard, count)
	GuardSkill.GetLoveSkill(result, SkillCon, 3, love3, guard, count)

	local canLvUp = false
	if SkillCon:GetSkill(allLove) then
		if allLoveLevel > guard:GetInt("GuardLastAllLoveSkill_Star") then
			canLvUp = true
		end
		result["AllLoveAddSkill"] = {allLove, SkillCon:GetSkill(allLove):GetPerformance(), guard:GetInt("GuardLastAllLoveSkill_Star"), count, canLvUp}
	else
		result["AllLoveAddSkill"] = {allLove, 0, 0, count, canLvUp}
	end
	return result
end

--获取侍从技能是否能够升级（小红点相关，能返回true，不能返回false）
--@newinter GuardSkill.GetSkillCanLvUp(player, 113, 1)
function GuardSkill.GetSkillCanLvUp(player, guard, index)
	if guard:GetMaster() ~= player then
		sLuaApp:LuaErr("侍从主人与玩家不符")
		return ""
	end
	local result = GuardSkill.GetAllSkillData(player, guard, count)
	--sLuaApp:LuaDbg("是否能升级："..tostring(result["Love"..index.."Skill"][5]))
	if index == "All" then
		if result["AllLoveAddSkill"][5] ~= nil then
			return result["AllLoveAddSkill"][5]
		else
			return ""
		end
	else
		if result["Love"..index.."Skill"][5] ~= nil then
			return result["Love"..index.."Skill"][5]
		else
			return ""
		end
	end
end

--设置情缘技能数据
function GuardSkill.GetLoveSkill(result, SkillCon, index, love, guard, count)
	sLuaApp:LuaDbg("GetLoveSkill")
	local canLvUp = false
	local skill = SkillCon:GetSkill(love)
	if skill then
		local nowpreformance = skill:GetPerformance()
		if nowpreformance and count then
			if nowpreformance > count then
				skill:SetPerformance(count)
				skill:SetMaxPerformance(count)
			end
		end
		GuardSkill.CheckGuardLoveSkill(guard, SkillCon:GetSkill(love), index)
	end
	if result["love"..index.."_star"] > guard:GetInt("GuardLastLoveSkill_"..index.."_Star") then
		canLvUp = true
	end
	if skill then
		result["Love"..index.."Skill"] = {love, SkillCon:GetSkill(love):GetPerformance(), guard:GetInt("GuardLastLoveSkill_"..index.."_Star"), count, canLvUp}
	else
		result["Love"..index.."Skill"] = {love, 0, 0, count, canLvUp}
	end
end

--根据侍从id获取玩家侍从星级
function GuardSkill.GetLoveStar(player, GuardCon, guard_id)
	--sLuaApp:LuaDbg(guard_id)
	if GuardCon:HasGuard(guard_id) == true then
		for k, v in ipairs(GuardCon:GetGuards()) do
			if v:GetId() == guard_id then
				if GuardUpStar then
					--sLuaApp:LuaDbg(GuardUpStar.GetGuardStar(player,v:GetGUID()))
					return GuardUpStar.GetGuardStar(player,v:GetGUID())
				else
					return 1
				end
			end
		end
	else
		return 0
	end
end

--侍从升星技能升级
function GuardSkill.GuardStarUP(player, guard_guid, guard_star)	
	local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
	local GuardCon = player:GetGuardContainer()
	local guards = GuardCon:GetGuards()
	
	guard_star = tonumber(guard_star)
	if guard_star <= 1 then
		return ""
	end
	local UPData = GuardSkill.GuardStarUPConfig[guard_star]
	if guard ~= "" then
		local guardData = GuardConfig.GetById(guard:GetId())
		local SkillCon = guard:GetSkillContainer()
		local UPtrenchSkill = guard:GetInt("GuardSkillID_"..UPData["UPtrench"])
		local skillData = SkillConfig.GetById(UPtrenchSkill)
		
		if skillData.UpSkillId ~= 0 and skillData.UpSkillId ~= nil then
			--SkillCon:CreateSkill(UPtrenchSkill, 1, 1, true)
			local skill = SkillCon:GetSkill(UPtrenchSkill)
			local skillLevel = tonumber(skill:GetPerformance())
			local skillMaxLevel = tonumber(skill:GetMaxPerformance())
			if UPData["AllLevelUP"] > 0 then
				local index = UPData["UPtrench"]
				local target_level = skillLevel + UPData["AllLevelUP"]
				local newskill =  SkillCon:CreateSkill(skillData.UpSkillId, target_level, target_level, true)
				SkillCon:DestroySkill(skill, false)
				for k, v in ipairs(SkillCon:GetSkills()) do
					local skill_id = v:GetId()
					for i = 1, 4 do 
						if skill_id == guard:GetInt("GuardSkillID_"..i) then
							sLuaApp:LuaDbg(skill_id)
							v:SetMaxPerformance(target_level)
							v:SetPerformance(target_level)
						end
					end
				end
				for i = 1, 4 do
					if i ~= index then
						guard:SetInt("GuardSkillLV_"..i, guard:GetInt("GuardSkillLV_"..i) + UPData["AllLevelUP"])
					end
				end	
				guard:SetInt("GuardSkillID_"..index, newskill:GetId())
				guard:SetInt("GuardSkillLV_"..index, target_level)
			else
				local target_level = skillLevel + UPData["trenchLevelUP"]
				skill:SetMaxPerformance(target_level)
				
				--for k, v in ipairs(SkillCon:GetSkills()) do
				--	sLuaApp:LuaDbg("k:"..k.."  v:"..v:GetId())
				--end
				local index = UPData["UPtrench"]
				SkillCon:DestroySkill(SkillCon:GetSkill(guard:GetInt("GuardSkillID_"..index)), true)
				local newskill = SkillCon:CreateSkill(skillData.UpSkillId, target_level, target_level, true)
				newskill:SetMaxPerformance(target_level)
				newskill:SetPerformance(target_level)
				guard:SetInt("GuardSkillID_"..index, newskill:GetId())
				guard:SetInt("GuardSkillLV_"..index, newskill:GetPerformance())
				--SkillCon:DestroySkill(SkillCon:GetSkill(skillData.UpSkillId), true)
				--for k, v in ipairs(SkillCon:GetSkills()) do
				--	sLuaApp:LuaDbg("k:"..k.."  v:"..v:GetId())
				--end
			end
		else	
			sLuaApp:LuaDbg("当前技能无法升阶")
			return ""
		end
		
	else
		sLuaApp:NotifyTipsMsg(player, "您尚未拥有该侍从")
		return ""
	end
end

--情缘技能升级
function GuardSkill.GuardLoveStarUP(player, guard_guid, love)
	local guard = sGuardSystem:GetGuardByGUID(guard_guid)
	local guard_id = guard:GetId()
	love = tonumber(love)
	if love <= 0 then
		return ""
	end
	if guard ~= "" then
		sLuaApp:LuaDbg(love)
		local guardData = GuardConfig.GetById(guard_id)
		local SkillCon = guard:GetSkillContainer()	
		sLuaApp:LuaDbg("love:"..love)
		--Love1Skill
		sLuaApp:LuaDbg("情缘升星对应技能id："..guardData["Love"..love.."Skill"])
		local skill = SkillCon:GetSkill(guardData["Love"..love.."Skill"])
		
		if skill ~= nil then
			GuardSkill.CheckGuardLoveSkill(guard, skill, love)
			local lastLoveLevel = guard:GetInt("GuardLastLoveSkill_"..love.."_Star")
			if lastLoveLevel > 0 then
				lastLoveLevel = lastLoveLevel + 1
				local UPData = GuardSkill.GuardLoveStarUPConfig[lastLoveLevel]
				sLuaApp:LuaDbg("UPData:"..UPData)
				skill:SetMaxPerformance(skill:GetMaxPerformance() + UPData)
				skill:SetPerformance(skill:GetPerformance() + UPData)
				guard:SetInt("GuardLastLoveSkill_"..love.."_Star", lastLoveLevel)
				return true
			else
				sLuaApp:LuaErr("上次情缘技能对应侍从星级不合法")
				return false
			end
		else
			local initialLevel = GuardSkill.GuardLoveStarUPConfig[1]
			if SkillCon:CreateSkill(guardData["Love"..love.."Skill"], initialLevel, initialLevel, true) ~= nil then	
				guard:SetInt("GuardLastLoveSkill_"..love.."_Star", 1)
				return true
			else
				sLuaApp:LuaErr("创建技能失败")
				return false
			end
		end
	else
		sLuaApp:LuaDbg("尚未拥有拥有该侍从")
		return false
	end
end

--全部情缘开启升级终极技能
function GuardSkill.GuardAllLoveStarUP(player, guard_guid)
	local guard = sGuardSystem:GetGuardByGUID(guard_guid)
	local guard_id = guard:GetId()
	if guard ~= "" then
		local guardData = GuardConfig.GetById(guard_id)
		local SkillCon = guard:GetSkillContainer()
		--sLuaApp:LuaDbg("情缘升星对应技能id："..guardData["love"..love.."Skil"])
		local skill = SkillCon:GetSkill(guardData["AllLoveAddSkill1"])
		if skill ~= nil then
			local lastAllLoveLevel = guard:GetInt("GuardLastAllLoveSkill_Star")
			if lastAllLoveLevel > 0 then
				lastAllLoveLevel = lastAllLoveLevel + 1
				local UPData = GuardSkill.GuardLoveStarUPConfig[lastAllLoveLevel]
				skill:SetMaxPerformance(skill:GetMaxPerformance() + UPData)
				skill:SetPerformance(skill:GetPerformance() + UPData)
				guard:SetInt("GuardLastAllLoveSkill_Star", lastAllLoveLevel)
				local count = 0
				for k, v in ipairs(GuardSkill.GuardLoveStarUPConfig) do
					count = count + v
				end
				if lastAllLoveLevel == count then
					if Achievement then
						Achievement.Achievement_Guard_Friendship(player)
					end
				end
				return true
			else
				sLuaApp:LuaErr("上次终极情缘技能对应侍从星级不合法")
				return false
			end
		else
			local initialLevel = GuardSkill.GuardLoveStarUPConfig[1]
			if SkillCon:CreateSkill(guardData["AllLoveAddSkill1"], initialLevel, initialLevel, true) ~= nil then	
				guard:SetInt("GuardLastAllLoveSkill_Star", 1)
				return true
			else
				sLuaApp:LuaErr("创建技能失败")
				return false
			end
		end
	else
		sLuaApp:LuaDbg("尚未拥有拥有该侍从")
		return false
	end

end

function GuardSkill.CheckGuardLoveSkill(guard, skill, love)
	local lastLoveLevel = guard:GetInt("GuardLastLoveSkill_"..love.."_Star")
	local nowpreformance = skill:GetMaxPerformance()
	local record = 0
	local S_record = 0
	for i = 1, lastLoveLevel do
		record = record + GuardSkill.GuardLoveStarUPConfig[i]
	end
	sLuaApp:LuaDbg("record:"..record)
	if record ~= nowpreformance then
		for k,v in ipairs(GuardSkill.GuardLoveStarUPConfig) do
			S_record = S_record + v
			if S_record == nowpreformance then
				guard:SetInt("GuardLastLoveSkill_"..love.."_Star", k)
				break
			end
		end
	end
	sLuaApp:LuaDbg("S_record:"..S_record)
end

function GuardSkill.on_add_guard(guard)
	--sLuaApp:LuaDbg("玩家获得侍从")
	local player = guard:GetMaster() 
	if player ~= nil then
		GuardSkill.GetSkillData(player, guard:GetId())
	else
		sLuaApp:LuaDbg("系统出错，未找到玩家")
	end
end


