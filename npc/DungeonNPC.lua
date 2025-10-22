--副本NPC挂载脚本
DungeonNPC = {}

function DungeonNPC.main(npc, player)
	local npc_type = npc:GetString("DungeonNPCType")
	if npc_type == "" then 
		sLuaApp:LuaErr(npc:GetKeyName().."string 不存在Type")
		return "0"
	end
	
	if npc_type == "NPC" then
		local talk_step = npc:GetString("DungeonNextTalk")
		npc:SetString("DungeonNextTalk", "")
		if talk_step and talk_step ~= "" then
			return DungeonNPC.Talk(npc, player, talk_step)
		else
			return DungeonNPC.Talk(npc, player, "Talk_1")
		end
	elseif npc_type == "Box" then
		Dungeon.OpenBox(player, npc)
		return ""
	elseif npc_type == "Lamp" then
		local msg = npc:GetString("DistanceTipsMsg")
		return msg
	end
	return "0"
end

function DungeonNPC.Talk(npc, player, talk_step)
	if not talk_step then 
		return "0" 
	end
	local first_map_guid = player:GetInt("DungeonFirstMapGUID")
	if first_map_guid == 0 then return end
	local first_map = sMapSystem:GetMapByGUID(first_map_guid)
	local floor_num = 0
	local step = ""
	if first_map then
		floor_num = first_map:GetInt("DungeonFloorNum")
		step = first_map:GetString("DungeonStepNum")
	else
		sLuaApp:LuaErr("DungeonNPC.Talk"..player:GetName().."")
	end
	if floor_num == 0 or step == "" then
		sLuaApp:LuaErr("DungeonNPC.Talk 未获取到 floor_num or step")
		return "0"
	end

	local npc_keyname = npc:GetKeyName()
	local flag = player:GetString("DungeonFlag")
	if not flag or flag == "" then return end
	local npc_talk = assert(load(" return "..flag ..".NpcTalk"))()
	if not npc_talk[floor_num] or not npc_talk[floor_num][step] then
		sLuaApp:LuaDbg(flag..".NpcTalk因缺少配置"..floor_num..step.."而使用了默认对话0")
		return "0"
	end
	if not npc_talk[floor_num][step][npc_keyname] then
		if npc:GetMap() ~= player:GetMap() then
			sLuaApp:LuaDbg("DungeonNPC.Talk  player npc不在同一地图 关闭talk")
			return ""
		end
		sLuaApp:LuaDbg(flag..".NpcTalk"..floor_num..step.."因缺少配置"..npc_keyname.."而使用了默认对话0")
		return "0"
	end
	local talk_msg_tb = npc_talk[floor_num][step][npc_keyname][talk_step]
	if not talk_msg_tb then
		return "0"
	end
	if not talk_msg_tb["TalkMsg"] then
		sLuaApp:LuaErr(flag..".NpcTalk缺少配置TalkMsg")
		return "0"
	end
	
	if talk_msg_tb["Option"] and next(talk_msg_tb["Option"]) then
		for _,v in ipairs(talk_msg_tb["Option"]) do
			if not v["Msg"] or not v["NextTalk"] or not v["NextStep"] then
				sLuaApp:LuaErr(flag..".NpcTalk[Option]缺少配置")
				return "0"
			end
			player:AddNpcOption(npc, 0, v["Msg"], "option", v["NextTalk"]..","..v["NextStep"]..","..v["StartFight"]..","..v["NextFloor"])
		end
	end
		
	local msg = talk_msg_tb["TalkMsg"]["Msg"]
	local CheckSpeaker_Player = string.find(msg, "*Player*")
	local CheckSpeaker_NPC = string.find(msg, "*NPC*")
	local CheckSpeaker_Pet = string.find(msg, "*Pet*")
	local CheckSpeaker_Guard = string.find(msg, "*Guard*")
	if CheckSpeaker_Player then
		--[1]和[2]此处是硬写的，sLuaApp:StrSplit接口不太适用
		msg = sLuaApp:StrSplit(msg, "*Player*")[1]
		--sLuaApp:LuaErr("CheckSpeaker_Player = "..tostring(CheckSpeaker_Player))
		--sLuaApp:LuaErr("new   msg = "..msg)
		npc:SetInt("npcDialogModelType", 1)
		npc:SetInt("npcDialogModelID", 0)
	elseif CheckSpeaker_NPC then
		local aaa = sLuaApp:StrSplit(msg, "*NPC*")[1]
		--sLuaApp:LuaErr("aaa = "..aaa)
		local NPC_KeyName = sLuaApp:StrSplit(aaa, "*")[1]
		--sLuaApp:LuaErr("NPC_KeyName = "..NPC_KeyName)
		local npc_id = NpcConfig.GetByKeyName(NPC_KeyName).Id
		msg = sLuaApp:StrSplit(aaa, NPC_KeyName.."*")[1]
		--sLuaApp:LuaErr("new   msg = "..msg)
		npc:SetInt("npcDialogModelType", 2)
		npc:SetInt("npcDialogModelID", npc_id)
	elseif CheckSpeaker_Pet then
		npc:SetInt("npcDialogModelType", 3)
	elseif CheckSpeaker_Guard then
		npc:SetInt("npcDialogModelType", 4)
	else
		npc:SetInt("npcDialogModelType", 2)
		local npc_id = npc:GetId()
		npc:SetInt("npcDialogModelID", npc_id)
	end
	
	return msg
end


function DungeonNPC.option(npc, player, content)
	if player:GetTeam() and not player:IsTeamLeader() then
		sLuaApp:NotifyTipsMsg(player, "不是队长，无法决定队伍去向！")
	end
	local tmp_tb = sLuaApp:StrSplit(content, ",")
	local NextTalk = tonumber(tmp_tb[1])
	local NextStep = tonumber(tmp_tb[2])
	local StartFight = tonumber(tmp_tb[3])
	local NextFloor = tonumber(tmp_tb[4])
	
	if NextTalk ~= -1 then
		npc:SetString("DungeonNextTalk", "Talk_"..NextTalk)
		return DungeonNPC.main(npc, player)
	end
	
	if NextFloor ~= -1 then
		player:SetString("DungeonStep", "")
		local flag = player:GetString("DungeonFlag")
		player:SetString(flag.."Last_floor_num", NextFloor)
		--local first_map_guid = player:GetInt("DungeonFirstMapGUID")
		--if first_map_guid == 0 then 
		--	return "" 
		--end
		--local first_map = sMapSystem:GetMapByGUID(first_map_guid)
		--first_map:SetInt("DungeonShowStep", 0)
		local DungeonLastMap = player:GetMap()
		local DungeonLastMapGuid = DungeonLastMap:GetGUID()
		player:SetString("DungeonLastMapGuid", DungeonLastMapGuid)
		Dungeon.CreateMap(player, NextFloor)
		return ""
	end
	
	local floor_num = player:GetInt("DungeonFloor")
	if floor_num == 0 then
		floor_num = 1
	end
	if NextStep ~= -1 then
		local first_map_guid = player:GetInt("DungeonFirstMapGUID")
		if first_map_guid == 0 then 
			return "" 
		end
		local first_map = sMapSystem:GetMapByGUID(first_map_guid)
		if first_map then
			local floor_num = first_map:GetInt("DungeonFloorNum")
			local now_step = first_map:GetString("DungeonStepNum")
			if now_step ~= "Step_"..NextStep then
				local map = npc:GetMap()
				Dungeon.GoToStep(player, map, floor_num, "Step_"..NextStep, first_map)
			end
		end
		return ""
	end
	
	if StartFight == 1 then
		if not Dungeon.StartFight(player, npc) then
			return "想以多欺少，还“侠”呢！"
		end
	end
	return ""
end