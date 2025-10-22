FormOfficialPosition = {}

--获取官职信息
function FormOfficialPosition.GetOPConfig(player)
	--sLuaApp:LuaDbg("获取官职信息")
	if OfficialPosition then
		OfficialPosition.GetOPConfig(player)
	end
	return ""
end

--领取俸禄
function FormOfficialPosition.GetSalary(player)
	--sLuaApp:LuaDbg("领取俸禄")
	if OfficialPosition then
		OfficialPosition.GetSalary(player)
	end
	return ""
end

--获取玩家当前官职信息
function FormOfficialPosition.GetNowPositionData(player)
	--sLuaApp:LuaDbg("获取玩家当前官职信息")
	if OfficialPosition then
		OfficialPosition.GetNowPositionData(player)
	end
	return ""
end

