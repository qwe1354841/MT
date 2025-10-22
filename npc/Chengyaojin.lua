Chengyaojin = {}
function Chengyaojin.Consult(npc, player, content)
	local str = [[1.每周一全天、每周二19:00前可报名参加比赛。
2.必须组队，且组队人数至少为]]..(ShuiLuDaHui_Sign.PlayerSetting or 5)..[[人时才能报名。
3.报名费用为]]..(ShuiLuDaHui_Sign.RegistrationFee or 30000)..(Lua_tools.GetMoneyName(ShuiLuDaHui_Sign.Money_type or 5))..[[。
4.周二19:30分后可通过我前往水陆大会会场，进入会场时，请务必保证队伍人员与报名时完全一致。
5.大会举办方会按照所有报名队伍的积分进行匹配分组，每组共有4支队伍。
6.大会开始后，组内各队将会在赛会的安排下捉对厮杀，请留意追踪面板的比赛时间信息。
7.大会每个赛季有]]..(ShuiLuDaHui_Sign.MatchsOnceSeason or 6)..[[轮，每周进行一轮。六轮结束后，排名前列的玩家将获得丰厚奖励。]]
    return str
end

function Chengyaojin.Signup(npc, player, content)
	sLuaApp:LuaDbg("Chengyaojin_Signup")
    return ShuiLuDaHui_Sign.Sign(player)
end

function Chengyaojin.Movein(npc, player, content)
    return ShuiLuDaHui.Approach(player)
end

function Chengyaojin.moveMap(player, Map)
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

function Chengyaojin.main(npc, player)
	sLuaApp:LuaDbg("Chengyaojin_main")
    player:AddNpcOption(npc, 0, "了解水陆大会", "Consult", "1");
	if sLuaApp:IsActivityRunning(6) == true or sLuaApp:IsActivityRunning(9) == true then
		player:AddNpcOption(npc, 0, "水陆大会报名", "Signup", "2");
		sLuaApp:LuaDbg("Chengyaojin")
	end
	if sLuaApp:IsActivityRunning(7) == true then
		player:AddNpcOption(npc, 0, "进入水陆大会", "Movein", "3");
	end
    
    return "";
end