--密藏表单
FormSeasonPass = {}

function FormSeasonPass.GetInitializedData(player)
	--sLuaApp:NotifyTipsMsg(player, "获取初始数据")
	if SeasonPass then
		SeasonPass.GetInitializedData(player)
	end
	return ""
end

function FormSeasonPass.GetData(player, pageNum)
	if not player then
		return ""
	end
	--sLuaApp:NotifyTipsMsg(player, "获取数据")
	if SeasonPass then
		SeasonPass.GetData(player, pageNum)
	end
	return ""
end

function FormSeasonPass.GetSingleItem(player, parm1, parm2)
	if not parm1 or not parm2 then
		return ""
	end
	--sLuaApp:NotifyTipsMsg(player, "获取单一物品")
	if SeasonPass then
		SeasonPass.GetSingleItem(player, parm1, parm2)
	end
	return ""
end

function FormSeasonPass.GetAllItem(player, parm1)
	if not parm1 then
		return ""
	end
	--sLuaApp:NotifyTipsMsg(player, "获取所有物品")
	if SeasonPass then
		SeasonPass.GetAllItem(player, parm1)
	end
	return ""
end

function FormSeasonPass.FinishQuest(player, Quest_Id)
	if not Quest_Id then
		--sLuaApp:NotifyTipsMsg(player, "阿巴阿巴")
		return ""
	end
	--sLuaApp:NotifyTipsMsg(player, "尝试完成任务 id"..Quest_Id)
	if SeasonPass then
		SeasonPass.FinishQuest(player, Quest_Id)
	end
	return ""
end

function FormSeasonPass.BuyLevel(player, Level)
	if not player or not Level then
		return ""
	end
	if SeasonPass then
		SeasonPass.AddSeasonPassExp(player, 0, "BuyExp", 0, Level)
	end
	return ""
end

function FormSeasonPass.ExchangeItem(player, ItemIndex, ItemNum)
	if not player or not ItemIndex or not ItemNum then
		return ""
	end
	--sLuaApp:NotifyTipsMsg(player, "尝试兑换道具")
	if SeasonPass then
		SeasonPass.ExchangeItem(player, ItemIndex, ItemNum)
	end
	return ""
end

function FormSeasonPass.Test(player)
	local str = [[
			GUI.OpenWnd('SeasonPassUI')	
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end