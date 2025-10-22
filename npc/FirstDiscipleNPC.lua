--大弟子NPC
FirstDiscipleNPC = {}
FirstDiscipleNPC.STR = [[
	1.每周一~周四可以参加竞选本门派的大弟子
	2.每周五~周六大家可以通过投票选出自己心仪的对象
	3.每个角色只能投一票
	4.周日12:00以后新的大弟子就诞生了
	5.大弟子会把自己的化身留在这里供他人挑战
]]
function FirstDiscipleNPC.main(npc, player)	
	local job = player:GetAttr(3)
	if Act_FirstDisciple.NPC[job] ~= npc:GetId() then
		return "0"
	end
	--player:AddNpcOption(npc, 0 , "我要投票", "option3", "")
	--player:AddNpcOption(npc, 0 , "我要竞选门派大弟子", "option1", "")
	if sLuaApp:IsActivityRunning(Act_FirstDisciple.Contest_ID) then 
		if player:GetAttr(ROLE_ATTR_LEVEL) >= Act_FirstDisciple.Contest_Level then
			if player:GetInt("Act_FirstDisciple_Week") ~= sDBVarSystem:GetInt("Act_FirstDisciple_Week") then
				player:SetInt("Act_FirstDisciple_Week",sDBVarSystem:GetInt("Act_FirstDisciple_Week"))
				if sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..job) == tonumber(player:GetGUID()) then
					player:SetInt("Act_FirstDisciple_Player_State",1)
				else
					player:SetInt("Act_FirstDisciple_Player_State",0)
				end
				player:SetInt("Act_FirstDisciple_Player_Vate_State",0)
			end
			if player:GetInt("Act_FirstDisciple_Player_State") == 0 then
				player:AddNpcOption(npc, 0 , "我要竞选门派大弟子", "option1", "")
			elseif player:GetInt("Act_FirstDisciple_Player_State") == 1 then
				player:AddNpcOption(npc, 0 , "发布竞选宣言", "option2", "")
			end
			if sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..job) == tonumber(player:GetGUID()) then
				player:AddNpcOption(npc, 0 , "改变形象", "option4", "")
			end
		end
	elseif sLuaApp:IsActivityRunning(Act_FirstDisciple.Vote_ID) then 
		if player:GetAttr(ROLE_ATTR_LEVEL) >= Act_FirstDisciple.Vote_Level then
			if player:GetInt("Act_FirstDisciple_Week") ~= sDBVarSystem:GetInt("Act_FirstDisciple_Week") then
				player:SetInt("Act_FirstDisciple_Week",sDBVarSystem:GetInt("Act_FirstDisciple_Week"))
				if sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..job) == tonumber(player:GetGUID()) then
					player:SetInt("Act_FirstDisciple_Player_State",1)
				else
					player:SetInt("Act_FirstDisciple_Player_State",0)
				end
				player:SetInt("Act_FirstDisciple_Player_Vate_State",0)
			end		
			player:AddNpcOption(npc, 0 , "我要投票", "option3", "")
		end
	end
	player:AddNpcOption(npc, 0 , "我想了解一下", "option5", "")
	return "0"
end

function FirstDiscipleNPC.option1(npc, player, str)
	local team = player:GetTeam()
	if team then
		sLuaApp:NotifyTipsMsg(player, "组队不能参加大弟子竞选！")
		return ""
	end
	local job = player:GetAttr(ROLE_ATTR_JOB_1)
	if sDBVarSystem:GetInt("Act_FirstDisciple_Player_GUID_Job"..job) == 0 then
		local res = sFightSystem:StartTagPVE(player,Act_FirstDisciple.Monster_Group[job] ,Act_FirstDisciple.FightTag,"","","")
		if res then
			sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_FirstDisciple", "Result")
		end
	else
		local res = sFightSystem:StartTagNPC(player,npc,Act_FirstDisciple.Monster_Group[job],Act_FirstDisciple.FightTag,"","","")
		if res then
			sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Act_FirstDisciple", "Result")
		end
	end
    return ""
end

function FirstDiscipleNPC.option2(npc, player, str)
	local job = player:GetAttr(3)
	local declaration = Act_FirstDisciple.Initial_Declaration
	local tb_1 = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
	if tb_1[''..job][''..player:GetGUID()] then
		declaration = tb_1[''..job][''..player:GetGUID()]
	end
	local FormStr = [[
		GUI.OpenWnd("DiscipleDeclarationUI")
		if DiscipleDeclarationUI then
			DiscipleDeclarationUI.Data = ']]..declaration..[['
			DiscipleDeclarationUI.RefreshDeclarationData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end

function FirstDiscipleNPC.option3(npc, player, str)
	local job = player:GetAttr(3)
	local tb = {}
	tb['rank_list'] = sRanklistSystem:GetAllRanklist(RankingListSystem.Config[Act_FirstDisciple.Job_To_Rank[job]])
	local tb_1 = assert(load("return " .. sDBVarSystem:GetString("Act_FirstDisciple_Declaration_tb")))()
	tb['declaration_tb'] = tb_1[''..job]
	tb['vote_energy'] = Act_FirstDisciple.Vote_Energy
	tb['vote_bind_gold'] = Act_FirstDisciple.Vote_Bind_Gold
	tb['initial_declaration'] = Act_FirstDisciple.Initial_Declaration
	tb['vate_state'] = player:GetInt("Act_FirstDisciple_Player_Vate_State")
	local FormStr = [[
		GUI.OpenWnd("DiscipleVoteUI")
		if DiscipleVoteUI then
			DiscipleVoteUI.Data = ]]..Lua_tools.serialize(tb)..[[
			DiscipleVoteUI.RefreshPlayersData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end

function FirstDiscipleNPC.option4(npc, player, str)
	local job = player:GetAttr(3)
	local map = sMapSystem:GetMapById(Act_FirstDisciple.Map_ID[job])
	if map then
		local npc = sNpcSystem:GetNpcByGUID(sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..job))
		--sLuaApp:LuaWrn("FirstDiscipleNPC.option4    "..sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..job))
		--sLuaApp:LuaWrn("FirstDiscipleNPC.option4    "..type(npc))
		if npc then
			--sLuaApp:LuaWrn("FirstDiscipleNPC.option4    "..npc:GetGUID())
			sNpcSystem:DestroyNpc(npc)
		end	
		local npc_pos = Act_FirstDisciple.NPC_Pos[job]
		sNpcSystem:CreatePlayerNpcAsync(Act_FirstDisciple.NPC[job],map,npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction,0,player:GetGUID(),"Act_FirstDisciple:on_create_npc_async",""..job)
	end
	sLuaApp:NotifyTipsMsg(player, "修改外型成功")
	return ""
end

function FirstDiscipleNPC.option5(npc, player, str)
	return FirstDiscipleNPC.STR
end
function FirstDiscipleNPC.test(player)
	local job = player:GetAttr(3)
	local map = sMapSystem:GetMapById(Act_FirstDisciple.Map_ID[job])
	local npc_pos = Act_FirstDisciple.NPC_Pos[job]
	local npc = sNpcSystem:GetNpcByGUID(sDBVarSystem:GetInt("Act_FirstDisciple_NPC_GUID_Job"..job))
	if npc then
		sNpcSystem:DestroyNpc(npc)
	end
	sNpcSystem:CreatePlayerNpcAsync(Act_FirstDisciple.NPC[job],map,npc_pos.X,npc_pos.Y,npc_pos.Range,npc_pos.Direction,0,player:GetGUID(),"Act_FirstDisciple:on_create_npc_async",""..job)
end