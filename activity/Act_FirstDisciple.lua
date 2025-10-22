--大弟子脚本
Act_FirstDisciple = {}
Act_FirstDisciple.Contest_Level = 40
Act_FirstDisciple.Vote_Level = 30
Act_FirstDisciple.Contest_ID = 69
Act_FirstDisciple.Vote_ID = 70
Act_FirstDisciple.Change_MOD_ID = 71
Act_FirstDisciple.Initial_Declaration = "大家都来选我吧！"
Act_FirstDisciple.FightTag = 91114
Act_FirstDisciple.Vote_Energy = 0
Act_FirstDisciple.Vote_Bind_Gold = 10000
Act_FirstDisciple.ShowItem = "61024,61025"
Act_FirstDisciple.Monster_Group = {
	[31] = 1051,
	[32] = 1052,
	[33] = 1053,
	[34] = 1054,
	[35] = 1055,
	[36] = 1056,
}
Act_FirstDisciple.NPC_Pos = {
	[31] = {X=145,Y=32,Range=0,Direction=4},
	[32] = {X=124,Y=112,Range=0,Direction=3},
	[33] = {X=47,Y=42,Range=0,Direction=3},
	[34] = {X=52,Y=52,Range=0,Direction=3},
	[35] = {X=115,Y=56,Range=0,Direction=4},
	[36] = {X=79,Y=56,Range=0,Direction=3},
}
Act_FirstDisciple.Map_ID = {
	[31] = 205,
	[32] = 206,
	[33] = 204,
	[34] = 214,
	[35] = 218,
	[36] = 215,
}
Act_FirstDisciple.Job_To_Rank = {
	[31] = "大弟子排行榜1",
	[32] = "大弟子排行榜2",
	[33] = "大弟子排行榜3",
	[34] = "大弟子排行榜4",
	[35] = "大弟子排行榜5",
	[36] = "大弟子排行榜6",
}
Act_FirstDisciple.NPC = {
	[31] = 10273,
	[32] = 10276,
	[33] = 10277,
	[34] = 10275,
	[35] = 10274,
	[36] = 10278,
}
-- 活动开始前回调
function Act_FirstDisciple.OnDeclare(id, seconds)
    
end
-- 活动开始回调
function Act_FirstDisciple.OnStart(id, is_normal)
	if id == Act_FirstDisciple.Contest_ID then
		if sDBVarSystem:GetInt("Act_FirstDisciple_Week") ~= sLuaApp:WeekSinceEpoch(0) then
			local tb = {}
			for k,v in pairs(Act_FirstDisciple.Job_To_Rank) do
				if RankingListSystem.Config[v] then
					tb[''..k] = {}
					sRanklistSystem:ClearRanklist(RankingListSystem.Config[v])
				end
			end
			sDBVarSystem:SetString("Act_FirstDisciple_Declaration_tb",Lua_tools.serialize(tb),0)
			sDBVarSystem:SetInt("Act_FirstDisciple_Week",sLuaApp:WeekSinceEpoch(0),6)
		end
	end
	if id == Act_FirstDisciple.Change_MOD_ID then
		for k,v in pairs(Act_FirstDisciple.Job_To_Rank) do
			if RankingListSystem.Config[v] then
				--设置每个大弟子的外面模型
				local tb = sRanklistSystem:GetRanklist(RankingListSystem.Config[v],1,1)
				if tb[1] then
					if #tb[1] > 0 then
						if tb[1][2] > 0 then
							local map = sMapSystem:GetMapById(Act_FirstDisciple.Map_ID[k])
							if map then
								local npc = sNpcSystem:GetNpcByGUID(sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..k))
								if npc then
									sNpcSystem:DestroyNpc(npc)
								end	
								local npc_pos = Act_FirstDisciple.NPC_Pos[k]
								sNpcSystem:CreatePlayerNpcAsync(Act_FirstDisciple.NPC[k],map,npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction,0,tb[1][1],"Act_FirstDisciple:on_create_npc_async",""..k)
								sDBVarSystem:SetInt("Act_FirstDisciple_Player_GUID_Job"..k,tb[1][1],6)
							end
						end
					end
				end
			end
		end
	end
end
-- 活动结束回调
function Act_FirstDisciple.OnStop(id)
    
end
-- 玩家点击参与活动回调
function Act_FirstDisciple.OnJoin(id, player)
	local team = player:GetTeam()
	if team then
		sLuaApp:NotifyTipsMsg(player, "组队不能参加大弟子活动！")
		return
	end
	local job = player:GetAttr(3)
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(]]..Act_FirstDisciple.NPC[job]..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
-- 玩家客户端查询数据回调
function Act_FirstDisciple.OnQuery(id, player)
	local str = "0:0:0:0:"..Act_FirstDisciple.ShowItem..",:1:"..(ActivitySystem.Act_GetClassify("Act_FirstDisciple") or '2,3,5')
	return str
end
function Act_FirstDisciple.on_create_npc_async(npc, params)
    if npc == nil then
        return
    end
	local guid = npc:GetGUID()
	--sLuaApp:LuaWrn("Act_FirstDisciple:On_Create_NPC   ".. guid)
	sDBVarSystem:SetInt("Act_FirstDisciple_NPC_GUID_Job"..params,guid,6)
end
function Act_FirstDisciple.On_Sys_Start()
	for k,v in pairs(Act_FirstDisciple.Job_To_Rank) do
		local map = sMapSystem:GetMapById(Act_FirstDisciple.Map_ID[k])
		local npc_pos = Act_FirstDisciple.NPC_Pos[k]
		if map then
			if sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..k) ~= 0 and sContactSystem:GetContactName(sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..k)) ~= "" then
				sNpcSystem:CreatePlayerNpcAsync(Act_FirstDisciple.NPC[k],map,npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction,0,sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..k),"Act_FirstDisciple:on_create_npc_async",""..k)
			else
				local npc = sNpcSystem:CreateNpc(Act_FirstDisciple.NPC[k], map, npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction, 0)
				if npc then
					sDBVarSystem:SetInt("Act_FirstDisciple_Player_GUID_Job"..k,0,6)
					sDBVarSystem:SetInt("Act_FirstDisciple_NPC_GUID_Job"..k,npc:GetGUID(),6)
				end
			end
		end
	end
end
function Act_FirstDisciple.Modify_Declaration(player,str)
	if player:GetInt("Act_FirstDisciple_Player_State") ~= 1 then
		return
	end
	local job = player:GetAttr(3)
	if str == "" then
		str = Act_FirstDisciple.Initial_Declaration
	end
	local tb = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
	tb[''..job][''..player:GetGUID()] = str
	sDBVarSystem:SetString("Act_FirstDisciple_Declaration_tb",Lua_tools.serialize(tb),0)
	sLuaApp:NotifyTipsMsg(player, "宣言更新成功！")
end
function Act_FirstDisciple.Result(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_FirstDisciple", "Result")
	if victory == 2 then
		player:SetInt("Act_FirstDisciple_Player_State",1)
		local job = player:GetAttr(3)
		local tb = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
		if not tb[''..job] then
			sLuaApp:NotifyTipsMsg(player, "？？？？？？？？？？？？？？？？？？")
		end
		tb[''..job][''..player:GetGUID()] =  Act_FirstDisciple.Initial_Declaration
		sDBVarSystem:SetString("Act_FirstDisciple_Declaration_tb",Lua_tools.serialize(tb),0)
		sRanklistSystem:UpdateRanklist(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]],player:GetGUID(),0,""..player:GetGUID(),""..player:GetName())
		sLuaApp:NotifyTipsMsg(player, "挑战成功，快去发表竞选宣言吧！")
	end
end
function Act_FirstDisciple.Get_Declaration(player)
	if player:GetInt("Act_FirstDisciple_Player_State") ~= 1 then
		return
	end
	local job = player:GetAttr(3)
	local declaration = Act_FirstDisciple.Initial_Declaration
	local tb = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
	if tb[''..job][''..player:GetGUID()] then
		declaration = tb[''..job][''..player:GetGUID()]
	end	
	local FormStr = [[
		GUI.CloseWnd("DiscipleVoteUI")
		GUI.OpenWnd("DiscipleDeclarationUI")
		if DiscipleDeclarationUI then
			DiscipleDeclarationUI.Data = ']]..declaration..[['
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
function Act_FirstDisciple.Vote(player,guid)
	guid = tonumber(guid)
	if player:GetInt("Act_FirstDisciple_Player_Vate_State") == 1 then	
		sLuaApp:NotifyTipsMsg(player, "你已经投过票了")
		return
	end
	--活力相关，暂时没有
	if Act_FirstDisciple.Vote_Energy > 0 then
		
	end
	local job = player:GetAttr(3)
	local rank_tb = sRanklistSystem:GetRank(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]],guid)
	if #rank_tb <= 0 then
		sLuaApp:NotifyTipsMsg(player, "休想骗我，没这个人")
		return
	end	
	local value = rank_tb[2]
	value = value + 1
	sRanklistSystem:UpdateRanklist(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]],guid,value,""..rank_tb[3],""..rank_tb[4])
	player:SetInt("Act_FirstDisciple_Player_Vate_State",1)
	player:AddBindGold(Act_FirstDisciple.Vote_Bind_Gold, "system", "大弟子", ""..guid)
	sLuaApp:NotifyTipsMsg(player, "您获得了"..Act_FirstDisciple.Vote_Bind_Gold.."银币")
	sLuaApp:NotifyTipsMsg(player, "投票成功")
	local tb = {}
	tb['rank_list'] = sRanklistSystem:GetAllRanklist(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]])
	local tb_1 = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
	tb['declaration_tb'] = tb_1[''..job]
	tb['vote_energy'] = Act_FirstDisciple.Vote_Energy
	tb['vote_bind_gold'] = Act_FirstDisciple.Vote_Bind_Gold
	tb['initial_declaration'] = Act_FirstDisciple.Initial_Declaration
	tb['vate_state'] = player:GetInt("Act_FirstDisciple_Player_Vate_State")
	local FormStr = [[
		if DiscipleVoteUI then
			DiscipleVoteUI.Data = ]]..Lua_tools.serialize(tb)..[[
			DiscipleVoteUI.RefreshPlayersData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end
function Act_FirstDisciple.ByChangeOccu(player)
	local job = player:GetAttr(3)
	player:SetInt("Act_FirstDisciple_Player_State",0)
	if sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..job) == player:GetGUID() then
		local npc = sNpcSystem:GetNpcByGUID(sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..job))
		if npc then
			sNpcSystem:DestroyNpc(npc)
		end
		local map = sMapSystem:GetMapById(Act_FirstDisciple.Map_ID[job])
		local npc_pos = Act_FirstDisciple.NPC_Pos[job]
		local npc = sNpcSystem:CreateNpc(Act_FirstDisciple.NPC[job], map, npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction, 0)
		if npc then
			sDBVarSystem:SetInt("Act_FirstDisciple_NPC_GUID_Job"..job,npc:GetGUID(),6)
		end
	end
	local rank_tb = sRanklistSystem:GetRank(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]],player:GetGUID())
	if #rank_tb > 0 then
		sRanklistSystem:RemoveRank(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]],player:GetGUID())
	end	
end

function Act_FirstDisciple.ClearWrongData()
	for k,v in pairs(Act_FirstDisciple.Job_To_Rank) do
		sDBVarSystem:SetInt("Act_FirstDisciple_Player_GUID_Job"..k,0,6)
	end
	Act_FirstDisciple.On_Sys_Start()
end