--副本Form
FormDungeon={}

--打断开宝箱
function FormDungeon.StopOpenBox(player)
	if Dungeon then
		Dungeon.StopOpenBox(player)
	end
	return ""
end

--点击退出副本
function FormDungeon.ClickQuit(player)
	if player:GetTeam() and not player:IsTeamLeader() then
		sLuaApp:NotifyTipsMsg(player, "不是队长，无法决定队伍去向！")
		return ""
	else
		if Dungeon then
			local str = [[GlobalUtils.ShowServerBoxMessage("是否退出副本？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ToQuit("..player:GetGUID()..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
	return ""
end

function FormDungeon.RequestEnter(player,str)
	if DungeonSystem then
		DungeonSystem.RequestEnter(player,str)
	end
	return ""
end

function FormDungeon.GetDungeonData(player)
	if DungeonSystem then
		DungeonSystem.GetDungeonData(player)
	end
	return ""
end

function FormDungeon.GetInitializeData(player)
	if DungeonSystem then
		DungeonSystem.GetInitializeData(player)
	end
	return ""
end

function FormDungeon.GetReadyData(player)
	if DungeonSystem then
		DungeonSystem.GetReadyData(player)
	end
	return ""
end

function FormDungeon.ReadyTrue(player)
	if DungeonSystem then
		DungeonSystem.ReadyTrue(player)
	end
	return ""
end

function FormDungeon.ReadyFalse(player)
	if DungeonSystem then
		DungeonSystem.ReadyFalse(player)
	end
	return ""
end