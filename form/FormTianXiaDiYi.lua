--天下第一表单
FormTianXiaDiYi = {}

function FormTianXiaDiYi.StartMatch(player)
	if PVPActivityMatch and TianXiaDiYi then
		--local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
		if not TianXiaDiYi.CheckMatch(player) then return "" end
		player:SetInt("TianXiaDiYi_isMatching", 1)--显示用
		if TianXiaDiYi.StartMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "开始匹配")
		else
			sLuaApp:NotifyTipsMsg(player, "开始匹配失败")
		end
	end
	return ""
end

function FormTianXiaDiYi.EndMatch(player)
	--sLuaApp:LuaDbg(player:GetName().."进入FormTianXiaDiYi.EndMatch")
	if PVPActivityMatch and TianXiaDiYi then
		--local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
		if not TianXiaDiYi.CheckEndMatch(player) then return "" end
		player:SetInt("TianXiaDiYi_isMatching",0)
		player:SetInt("TianXiaDiYi_isAutoMatching",0)
		if TianXiaDiYi.EndMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "结束匹配")
		else
			player:SetInt("TianXiaDiYi_isMatching",1)
			sLuaApp:NotifyTipsMsg(player, "结束匹配失败")
		end
	end
	return ""
end

function FormTianXiaDiYi.StartAutoMatch(player)
	if PVPActivityMatch and TianXiaDiYi then
		--local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
		if not TianXiaDiYi.CheckMatch(player) then return "" end
		local tmp = true
		if player:GetInt("TianXiaDiYi_isMatching") == 1 then
			tmp = false --已经在匹配中 则不需要再进入实际的匹配
		end
		player:SetInt("TianXiaDiYi_isMatching", 1)
		player:SetInt("TianXiaDiYi_isAutoMatching",1)
		if tmp then
			if TianXiaDiYi.StartMatch(player) then
				sLuaApp:NotifyTipsMsg(player, "开始自动匹配")
			else
				sLuaApp:NotifyTipsMsg(player, "开始自动匹配失败")
			end
		else
			TianXiaDiYi.GetMatchStatus(player)
		end
	end
	return ""
end

function FormTianXiaDiYi.EndAutoMatch(player)
	if PVPActivityMatch and TianXiaDiYi then
		--local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
		if not TianXiaDiYi.CheckEndMatch(player) then return "" end
		
		player:SetInt("TianXiaDiYi_isMatching",0)
		player:SetInt("TianXiaDiYi_isAutoMatching",0)
		if TianXiaDiYi.EndMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "结束自动匹配")
		else
			player:SetInt("TianXiaDiYi_isMatching",1)
			TianXiaDiYi.GetMatchStatus(player)
			sLuaApp:NotifyTipsMsg(player, "结束自动匹配失败")
		end
	end
	return ""
end

--打开主界面
function FormTianXiaDiYi.GetData(player)
	if TianXiaDiYi then
		TianXiaDiYi.GetData(player)
	end
	return ""
end

--传单个礼包内容 客户端显示用
function FormTianXiaDiYi.GetRewardInfo(player, reward_index)
	if TianXiaDiYi then
		TianXiaDiYi.GetRewardInfo(player, reward_index)
	end
	return ""
end

--发送队伍信息 是否在匹配 自动匹配 
function FormTianXiaDiYi.GetTeamInfo(player)
	if TianXiaDiYi then
		TianXiaDiYi.GetTeamInfo(player)
	end
	return ""
end

function FormTianXiaDiYi.GetTips(player)
	if TianXiaDiYi then
		TianXiaDiYi.GetTips(player)
	end
	return ""
end
