--妖王NPC
YaoWangNPC = {}

function YaoWangNPC.main(npc,player)
	if not YaoWang then
		sLuaApp:LuaDbg(player, "YaoWang is nil")
		return "0"
	end
	
	if not YaoWang.Config then
		sLuaApp:LuaDbg(player, "YaoWang.Config is nil")
		return "0"
	end
	
	if YaoWang.Config['Is_TeamAct'] ~= nil then
		local Level_Min = tonumber(YaoWang.Config['Level_Min'])
		if not Level_Min then
			sLuaApp:LuaDbg(player, "Level_Min is nil")
			return "0"
		end		
		if YaoWang.Config['Is_TeamAct'] == "true" then
			local Join_MinNum = tonumber(YaoWang.Config['Join_MinNum'])
			if not Join_MinNum then
				sLuaApp:LuaDbg(player, "Join_MinNum is nil")
				return "0"
			end
			local team = player:GetTeam()
			if not team then
				return "走开走开！只有至少"..Join_MinNum.."人组队并且全员等级达到"..Level_Min.."级的队伍才有资格挑战我！！！"
			end
			if Lua_tools.GetTeamMember(player,false) < Join_MinNum then
				return "走开走开！只有至少"..Join_MinNum.."人组队并且全员等级达到"..Level_Min.."级的队伍才有资格挑战我！！！"
			end
			if Lua_tools.GetTeamLowestlevel(player) < Level_Min then
				return "走开走开！只有至少"..Join_MinNum.."人组队并且全员等级达到"..Level_Min.."级的队伍才有资格挑战我！！！"
			end
		else
			if Lua_tools.GetTeamLowestlevel(player) < Level_Min then
				return "走开走开！只有等级达到"..Level_Min.."级才有资格挑战我！！！"
			end
		end
	else
		sLuaApp:LuaDbg(player, "YaoWang.Config[Is_TeamAct] is nil")
		return "0"
	end
	
	player:AddNpcOption(npc, 4, "挑战妖王", "option1", "")
	
	return "看来你有资格挑战我！"
end

function YaoWangNPC.option1(npc, player, content)
	if npc:GetInt("YaoWangNPCisFight") > 0 then
		return "有个不知死活的小子正在挑战大爷，等我解决了他，再来收拾你！"
	else
		local Monster_Group = npc:GetInt("YaoWang_Monster_Group")
		if sFightSystem:StartTagPVE(player, Monster_Group, YaoWang.Config['FightTag'], "YaoWang", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("YaoWangNPCisFight", 1)
			
			local team = player:GetTeam()
			local memberlist = {}
			if team then
				if player:GetGUID() == team:GetTeamLeaderGUID() then
					memberlist = team:GetTeamMembers(false)
				else
					memberlist[1] = player
				end
			else
				memberlist[1] = player
			end
			
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "YaoWang", "OnResult")
				v:SetInt("YaoWang_NPC_GUID", npc:GetGUID())
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("YaoWangNPCisFight", npc:GetInt("YaoWangNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("NaoShi.StartFight开始pve失败")
		end
	end
    return ""
end