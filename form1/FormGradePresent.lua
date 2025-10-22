FormGradePresent = {}

--获取数据
function FormGradePresent.GetPresetnData(player)
	if player:GetInt("OpenGtadeGiftUITime") ~= 0 then
		local Last_LevelupTime = player:GetInt("OpenGtadeGiftUITime")
		local NowTime = sLuaApp:GetTimes()
		if NowTime < Last_LevelupTime + 5 then
			return ""
		end
	end
	sLuaApp:LuaDbg("FormGradePresent.GetPresetnData")
	if GradePresent then
		GradePresent.GetPresetnData(player)
	end
	return ""
end

--领取奖励
function FormGradePresent.GiveGradePresent(player, reward_level)
	sLuaApp:LuaDbg("FormGradePresent.GiveGradePresent")
	if GradePresent then
		GradePresent.GiveGradePresent(player, reward_level)
	end
	return ""
end

--获取领取的宠物GUID
function FormGradePresent.GetGradePresentPetGUID(player, index)
	if GradePresent then
		GradePresent:GetGradePresentPetGUID(player, index)
	end
	return ""
end
