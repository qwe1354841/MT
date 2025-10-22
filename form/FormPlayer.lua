--物品相关表单

FormPlayer = {}

function FormPlayer.QueryPlayer(player, player_name)
	if player == nil then
		return ""
	end
	if not sPlayerSystem:PlayerCanQuery(player_name) then
		sLuaApp:NotifyTipsMsgEx(player, "玩家拒绝被查看")
		return ""
	end
	local code = sPlayerSystem:QueryPlayerByName(player, player_name)
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "查询玩家不在线")
	end
	return ""
end

function FormPlayer.GetGuildGuardianConfig(player)
	if GuildGuardian then
		GuildGuardian.GetConfig(player)
	end
	return ""
end

function FormPlayer.GetGuildGuardianData(player,index)
	if GuildGuardian then
		GuildGuardian.RefreshData(player,index)
	end
	return ""
end

function FormPlayer.GuildGuardianAddPoint(player,index,str_point)
	if GuildGuardian then
		GuildGuardian.AddPoint(player,index,str_point)
	end
	return ""
end

function FormPlayer.GuildGuardianExchangePoint(player,index,val)
	if GuildGuardian then
		GuildGuardian.ExchangePoint(player,index,val)
	end
	return ""
end

function FormPlayer.GuildGuardianResetPoint(player,index)
	if GuildGuardian then
		GuildGuardian.ResetPoint(player,index)
	end
	return ""
end