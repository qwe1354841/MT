--天下会武表单
FormTianXiaHuiWu={}

function FormTianXiaHuiWu.StartMatch(player)
	if PVPActivityMatch and TianXiaHuiWu then
		local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if not TianXiaHuiWu.CheckMatch(player) then return "" end
		player:SetInt("isMatching"..id, 1)--显示用
		if TianXiaHuiWu.StartMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "开始匹配")
		else
			sLuaApp:NotifyTipsMsg(player, "开始匹配失败")
		end
	end
	return ""
end

function FormTianXiaHuiWu.EndMatch(player)
	--sLuaApp:LuaDbg(player:GetName().."进入FormTianXiaHuiWu.EndMatch")
	if PVPActivityMatch and TianXiaHuiWu then
		local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if not TianXiaHuiWu.CheckEndMatch(player) then return "" end
		player:SetInt("isMatching"..id,0)
		player:SetInt("isAutoMatching"..id,0)
		if TianXiaHuiWu.EndMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "结束匹配")
		else
			player:SetInt("isMatching"..id,1)
			sLuaApp:NotifyTipsMsg(player, "结束匹配失败")
		end
	end
	return ""
end

function FormTianXiaHuiWu.StartAutoMatch(player)
	if PVPActivityMatch and TianXiaHuiWu then
		local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if not TianXiaHuiWu.CheckMatch(player) then return "" end
		local tmp = true
		if player:GetInt("isMatching"..id) == 1 then
			tmp = false --已经在匹配中 则不需要再进入实际的匹配
		end
		player:SetInt("isMatching"..id, 1)
		player:SetInt("isAutoMatching"..id,1)
		if tmp then
			if TianXiaHuiWu.StartMatch(player) then
				sLuaApp:NotifyTipsMsg(player, "开始自动匹配")
			else
				sLuaApp:NotifyTipsMsg(player, "开始自动匹配失败")
			end
		else
			TianXiaHuiWu.GetMatchStatus(player)
		end
	end
	return ""
end

function FormTianXiaHuiWu.EndAutoMatch(player)
	if PVPActivityMatch and TianXiaHuiWu then
		local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if not TianXiaHuiWu.CheckEndMatch(player) then return "" end
		
		player:SetInt("isMatching"..id,0)
		player:SetInt("isAutoMatching"..id,0)
		if TianXiaHuiWu.EndMatch(player) then
			sLuaApp:NotifyTipsMsg(player, "结束自动匹配")
		else
			player:SetInt("isMatching"..id,1)
			TianXiaHuiWu.GetMatchStatus(player)
			sLuaApp:NotifyTipsMsg(player, "结束自动匹配失败")
		end
	end
	return ""
end

--打开主界面
function FormTianXiaHuiWu.GetData(player)
	if TianXiaHuiWu then
		TianXiaHuiWu.GetData(player)
	end
	return ""
end

--传单个礼包内容 客户端显示用
function FormTianXiaHuiWu.GetRewardInfo(player, reward_index)
	if TianXiaHuiWu then
		TianXiaHuiWu.GetRewardInfo(player, reward_index)
	end
	return ""
end

--发送队伍信息 是否在匹配 自动匹配 
function FormTianXiaHuiWu.GetTeamInfo(player)
	if TianXiaHuiWu then
		TianXiaHuiWu.GetTeamInfo(player)
	end
	return ""
end

function FormTianXiaHuiWu.GetTips(player)
	if TianXiaHuiWu then
		TianXiaHuiWu.GetTips(player)
	end
	return ""
end
