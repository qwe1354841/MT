--武道大会相关表单
FormWuDaoHui = {}

function FormWuDaoHui.GetTeamPlayerData(player)
	if Act_WuDaoHui then
		Act_WuDaoHui.GetTeamPlayerData(player)
	end
	return ""
end

function FormWuDaoHui.ExitWuDaoHui(player)
	local str = [[
		GlobalUtils.ShowServerBoxMessage("确认退出本次活动？")
		]]
	player:SetString("SYSTEM_ConfirmBox_Function", "Act_WuDaoHui.ExitAct("..player:GetGUID()..",1)")
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--打断开宝箱
function FormWuDaoHui.StopOpenBox(player)
	if WuDaoHuiBox then
		WuDaoHuiBox.StopOpenBox(player)
	end
	return ""
end