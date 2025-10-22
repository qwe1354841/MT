--福利NPC
FuliNPC = {}
function FuliNPC.option1(npc, player, content)
	if player:GetDayInt("Ceshi_MeiRiFuLi") == 1 then
		sLuaApp:NotifyTipsMsg(player, "你已经领取过了每日福利，请明天再来哦")
	else
		player:SetDayInt("Ceshi_MeiRiFuLi",1)
		Lua_tools.AddMoney(player, 1, 200000)
		sLuaApp:NotifyTipsMsg(player, "你成功领取了200000金元宝")
		Lua_tools.AddMoney(player, 2, 5000)
		sLuaApp:NotifyTipsMsg(player, "你成功领取了5000银元宝")
		Lua_tools.AddMoney(player, 4, 10000)
		sLuaApp:NotifyTipsMsg(player, "你成功领取了10000金币")
		player:AddPvp(1000, "", "", "")
		sLuaApp:NotifyTipsMsg(player, "你成功领取了1000战功")
	end
    return ""
end

function FuliNPC.option2(npc, player, content)
	if player:GetDayInt("Ceshi_MeiRiExp") == 1 then
		sLuaApp:NotifyTipsMsg(player, "你已经领取过了每日福利，请明天再来哦")
	else
		player:SetDayInt("Ceshi_MeiRiExp",1)
		Lua_tools.AddItem(player, {"人物大经验丹", 99, 1}, "", "", "")
	end
    return ""
end

function FuliNPC.option3(npc, player, content)
    FuliNPC.moveMap(player, "模型展示3")
    return ""
end

function FuliNPC.option4(npc, player, content)
    FuliNPC.moveMap(player, "模型展示4")
    return ""
end

function FuliNPC.option5(npc, player, content)
	if DoubleExp then
		return DoubleExp.GetPoint(player, 0)
	else
		sLuaApp:LuaErr("FuliNPC.option5 缺少 DoubleExp")
	end
    return ""
end

function FuliNPC.option6(npc, player, content)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('UserInputUI')")
    return ""
end

function FuliNPC.moveMap(player, Map)
	local team = player:GetTeam()
	if team then
		local leader_guid = team:GetTeamLeaderGUID()
		if leader_guid then
			if leader_guid ~= player:GetGUID() then
				if not sTeamSystem:IsTempLeave(player) then
					sLuaApp:LuaDbg("not leader and not leave")
					return
				end
			else
				sTeamSystem:EnterMap(team,map,x,y,range)
			end
		end
	end
	local map = sMapSystem:GetMapByKey(Map)
	sMapSystem:Jump(player,map,0,0,100)
end

function FuliNPC.main(npc, player)
	
	player:AddNpcOption(npc, 0, "领取每日福利", "option1", "1");
	player:AddNpcOption(npc, 0, "领取每日经验丹", "option2", "1");
	player:AddNpcOption(npc, 0, "领取双倍经验点", "option5", "1");
    --player:AddNpcOption(npc, 1, "传送到展示地图1", "option1", "1");
    --player:AddNpcOption(npc, 2, "传送到展示地图2", "option2", "2");
    --player:AddNpcOption(npc, 3, "传送到展示地图3", "option3", "3");
    --player:AddNpcOption(npc, 4, "传送到展示地图4", "option4", "4");
	--if player:GetAttr(ROLE_ATTR_GM) > 0 then
	--	player:AddNpcOption(npc, 0, "给指定玩家充值", "option6", "1");
	--end
    
    return "可以在我这里领取许多福利哦！";
end