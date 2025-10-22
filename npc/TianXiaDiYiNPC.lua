--天下第一NPC
TianXiaDiYiNPC = {}

function TianXiaDiYiNPC.main(npc, player)
	if sLuaApp:IsActivityRunning(22) or sLuaApp:IsActivityRunning(23) then
		player:AddNpcOption(npc, 0, "参与天下第一活动", "option3", "")
	else
		player:AddNpcOption(npc, 0, "查看上次天下第一排名", "option1", "")
	end
	player:AddNpcOption(npc, 0, "战功商店", "option2", "")
	return ""
end

function TianXiaDiYiNPC.option3(npc, player)
	--参与活动
	local activityData = ActivityConfig.GetById(22) or ActivityConfig.GetById(23)
	if player:GetAttr(ROLE_ATTR_LEVEL) >= tonumber(activityData.LevelMin) then
		sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('PersonalFightUI')")
	else
		sLuaApp:NotifyTipsMsg(player, "您的等级不足，无法参加天下第一")
	end
	return ""
end

function TianXiaDiYiNPC.option1(npc, player)
	--查看上次天下第一排名
	local rankList = sRanklistSystem:GetAllRanklist(RankingListSystem.Config["天下第一积分榜"] or 32)
	if rankList and next(rankList) then
		--sLuaApp:LuaDbg(Lua_tools.serialize(rankList))
		sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('PersonalFightUI')")
	else
		sLuaApp:NotifyTipsMsg(player, "暂无上次竞技排名数据")
	end
	return ""
end
function TianXiaDiYiNPC.option2(npc, player)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('ShopStoreUI', 5)")
	return ""
end
