--pvp匹配
PVPActivityMatch={}

function PVPActivityMatch.StartMatch(player,timer,act_id)
	act_id = tonumber(act_id)
	if player:GetTeam() then--XXXXXXXXXX
		if not player:IsTeamLeader() then
			sLuaApp:LuaErr("PVPActivityMatch.StartMatch错误")
			sLuaApp:NotifyTipsMsg(player, "您不是队长，无法进行该操作")
			return false
		end
	end
	local matching_player = sVarSystem:GetInt("PVPActivityMatching_"..act_id)
	sLuaApp:LuaDbg("PVPActivityMatchStartMatch1111  "..matching_player)
	if matching_player and matching_player ~= 0 then
		sVarSystem:SetInt("PVPActivityMatching_"..act_id,0)
		local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if act_id == txhw_id then
			TianXiaHuiWu.ReadyFight(player, sPlayerSystem:GetPlayerByGUID(matching_player))
		end
		local txdy_id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
		if act_id == txdy_id then
			TianXiaDiYi.ReadyFight(player, sPlayerSystem:GetPlayerByGUID(matching_player))
		end
		
		local SurvivalChallengeId = sVarSystem:GetInt("ACTIVITY_SurvivalChallenge_ID")
		if act_id == SurvivalChallengeId then
			SurvivalChallenge.ReadyFight(player, sPlayerSystem:GetPlayerByGUID(matching_player))
		end
		return true
	else
		
		sVarSystem:SetInt("PVPActivityMatching_"..act_id, player:GetGUID())
		local matching_player = sVarSystem:GetInt("PVPActivityMatching_"..act_id)
		--sLuaApp:LuaDbg("PVPActivityMatchStartMatch2"..matching_player)
		return true
	end
	return false
end
function PVPActivityMatch.EndMatch(player,act_id)
	act_id = tonumber(act_id)
	-- if player:GetTeam() then
		-- if not player:IsTeamLeader() then
			-- sLuaApp:LuaErr("PVPActivityMatch.EndMatch错误")
			-- sLuaApp:NotifyTipsMsg(player, "您不是队长，无法进行该操作")
			-- return false
		-- end
	-- end
	
	local matching_player=sVarSystem:GetInt("PVPActivityMatching_"..act_id)
	--sLuaApp:LuaDbg("PVPActivityMatchEndMatch"..matching_player)
	if matching_player == player:GetGUID() then
		sLuaApp:LuaErr(matching_player.."移出匹配池")
		sVarSystem:SetInt("PVPActivityMatching_"..act_id,0)
		return true
	end
	if matching_player == 0 then --服务器重启导致匹配池被清零
		return true
	end
	return false
end

function PVPActivityMatch.IsMatching(player)
	local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local txdy_id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if txdy_id ~= 0 and sLuaApp:IsActivityRunning(txdy_id) then
		if player:GetInt("TianXiaDiYi_isAutoMatching") == 1 then
			return true
		end
		if player:GetInt("TianXiaDiYi_isMatching") == 1 then
			return true
		end
	end
	
	if txhw_id ~= 0 and sLuaApp:IsActivityRunning(txhw_id) then
		if player:GetInt("isAutoMatching"..txhw_id) == 1 then
			return true
		end
		if player:GetInt("isMatching"..txhw_id) == 1 then
			return true
		end
	end
	return false
end

function PVPActivityMatch.Logout(player)
	--sLuaApp:LuaDbg("玩家下线取消匹配状态")
	local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local txdy_id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if PVPActivityMatch.IsMatching(player) then
		if txhw_id ~= 0 and player:GetInt("isMatching"..txhw_id) == 1 or player:GetInt("isAutoMatching"..txhw_id) == 1 then
			sLuaApp:LuaDbg("天下会武清除匹配状态")
			player:SetInt("isMatching"..txhw_id, 0)
			player:SetInt("isAutoMatching"..txhw_id, 0)
			TianXiaHuiWu.EndMatch(player)
		end 
		if txdy_id ~= 0 and player:GetInt("TianXiaDiYi_isMatching") == 1 or player:GetInt("TianXiaDiYi_isAutoMatching") == 1 then
			sLuaApp:LuaDbg("天下第一清除匹配状态")
			player:SetInt("TianXiaDiYi_isMatching", 0)
			player:SetInt("TianXiaDiYi_isAutoMatching", 0)
			TianXiaDiYi.EndMatch(player)
		end
	end
	return ""
end

