--帮派摇钱树NPC
GuildCashTreeNPC = {}

GuildCashTreeNPC.MoneyIcon = {
	[1] = "1800408250",
	[2] = "1800408260",
	[4] = "1800408270",
	[5] = "1800408280",
}
function GuildCashTreeNPC.main(npc, player)
	local id = sVarSystem:GetInt("ACTIVITY_GuildCashTree_ID")
	if id == 0 then return "" end
	if not sLuaApp:IsActivityRunning(id) then 
		return "别挡着我晒太阳" 
	end
	local level_min = ActivityConfig.GetById(id).LevelMin
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		return "不到"..level_min.."级是无法侍奉我的！" 
	end

	local guild = player:GetGuild()
	if not guild then return end
	local npc_type = npc:GetString("GuildCashTreeNPCType")
	if npc_type == "宝箱" then
		GuildCashTree.OpenBox(npc, player)
		return ""
	end
	
	local task_name = Data["GuildCashTree"][tostring(guild:GetGUID())]["NextTask"][tostring(player:GetGUID())]
	if not task_name then
		GuildCashTree.GetNextTask(player)
		task_name = Data["GuildCashTree"][tostring(guild:GetGUID())]["NextTask"][tostring(player:GetGUID())]
	end
	local event = GuildCashTreeConfig.Event[task_name]
	
	if npc_type == "摇钱树" then
	
		local act_phase = guild:GetInt("GuildCashTreeActPhase")
		if act_phase == 1 then
			--生长阶段
			local task_status = Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskStatus"][tostring(player:GetGUID())]
			sLuaApp:LuaErr("task_status"..task_status)
			if task_status == 0 then
				if event["NPCKeyName"] then
					sLuaApp:LuaErr("NPCKeyName"..event["NPCKeyName"])
					player:AddNpcOption(npc, 1, "接受请求", "option1", ""..task_name)
				else
					local i = 0
					while event["TreeOption_"..i] do
						player:AddNpcOption(npc, 1, event["TreeOption_"..i]["Msg"], "option2", task_name.."$".."TreeOption_"..i)
						i = i + 1
					end
				end
			end
			return event["TreeExplain"]
		elseif act_phase == 2 then
			--收获阶段
			local is_get_box = player:GetWeekInt("GuildCashTreeGetFinalBox")
			if is_get_box == 0 then
				player:AddNpcOption(npc, 1, "摇树", "option3", "")
			end
			local msg = guild:GetString("TreeHarvestMsg")
			return msg
		end
	
		
	else
		--非摇钱树npc
		local i = 0
		while event["NPCOption_"..i] do
			player:AddNpcOption(npc, 4, event["NPCOption_"..i]["Msg"], "option2", task_name.."$".."NPCOption_"..i)
			i = i + 1
		end
		return event["NPCExplain"]
	end
	return "0"
end

--摇钱树npc 接受任务 并刷出任务怪
function GuildCashTreeNPC.option1(npc, player, content)
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "摇钱树不接受组队服侍！")
		return ""
	end
	local event = GuildCashTreeConfig.Event[content]
	local npc_data = NpcConfig.GetByKeyName(event["NPCKeyName"])
	if not npc_data then
		sLuaApp:LuaErr("GuildCashTreeNPC.option1 不存在"..event["NPCKeyName"])
		return ""
	end
	local map = npc:GetMap()
	local point_tb = {}
	if event["NPCRefreshArea"] and next(event["NPCRefreshArea"]) then
		local area = event["NPCRefreshArea"][sLuaApp:RandInteger(1, #event["NPCRefreshArea"])]
		point_tb = sMapSystem:GetRandomPoint(map, area["X"], area["Y"], area["Range"])
	else
		local x = sMapSystem:GetPosX(npc)
		local y = sMapSystem:GetPosY(npc)
		point_tb = sMapSystem:GetRandomPoint(map, x, y, 30)
	end
	local create_npc = sNpcSystem:CreateMoveNpc(npc_data.Id, map, point_tb["x"], point_tb["y"], 0, 1)	
	if create_npc then
		create_npc:SetVisible(player)
		local guild = player:GetGuild()
		Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskStatus"][tostring(player:GetGUID())] = 1
		
		if not Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskNPC"] then
			Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskNPC"] = {}
		end
		sLuaApp:LuaErr(player:GetName().. " TaskNPC "..create_npc:GetGUID())
		Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskNPC"][tostring(player:GetGUID())] = create_npc:GetGUID()
	end
	sLuaApp:NotifyTipsMsg(player, "接受请求成功！")
	return ""
end

--摇钱树npc 直接完成任务 
--任务怪选项
function GuildCashTreeNPC.option2(npc, player, content)
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "摇钱树不接受组队服侍！")
		return ""
	end
	local tmp_tb = sLuaApp:StrSplit(content, "$")
	local option_tb = GuildCashTreeConfig.Event[tmp_tb[1]][tmp_tb[2]]
	local player_guid = player:GetGUID()
	if option_tb["ConsumeType"] and option_tb["ConsumeVal"] then
		local money_msg = "#OFFSET<X:0,Y:-8#IMAGE"..GuildCashTreeNPC.MoneyIcon[option_tb["ConsumeType"]].."#OFFSETEND>#"..option_tb["ConsumeVal"]
		local str = [[GlobalUtils.ShowServerBoxMessage("购买]]..option_tb["BuyItemName"]..[[将消耗 ]]..money_msg..[[，是否确定？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "GuildCashTree.SelectOption('"..player_guid.."','"..content.."')")
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		GuildCashTree.SelectOption(player_guid, content)
	end
	return ""
end

--收获摇树
function GuildCashTreeNPC.option3(npc, player, content)
	local npc_data = NpcConfig.GetByKeyName(GuildCashTreeConfig.FinalBox)
	if not npc_data then
		sLuaApp:LuaErr("GuildCashTreeNPC.option3 不存在"..GuildCashTreeConfig.FinalBox)
		return ""
	end
	local map = npc:GetMap()
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	local point_tb = sMapSystem:GetRandomPoint(map, x, y, 10)
	local box_npc = sNpcSystem:CreateNpc(npc_data.Id, map, point_tb["x"], point_tb["y"], 0, 4, 1)
	if box_npc then
		box_npc:SetVisible(player)
		player:SetWeekInt("GuildCashTreeGetFinalBox", 1)
		box_npc:SetString("GuildCashTreeBoxRewardKey", "FinalReward")
		box_npc:SetString("GuildCashTreeNPCType", "宝箱")
	end
	return ""
end