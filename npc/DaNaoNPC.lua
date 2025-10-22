--活动大闹天宫NPC
DaNaoNPC = {}

function DaNaoNPC.option1(npc, player, content)
	if NaoShi then
		if not NaoShi.StartFight(player, npc) then
			local msg_fight = "我现在正在与另一位少侠激战,等下就来收拾你"
			return msg_fight
		end
	else
		sLuaApp:LuaDbg("缺少NaoShi")
	end
    return ""
end

function DaNaoNPC.main(npc, player)
	if NaoShi then
		--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
		local id = npc:GetInt("NaoShiActID")
		local talk_msg_tb = NaoShi.CheckFight(player, id)
		if talk_msg_tb and next(talk_msg_tb) then
			if talk_msg_tb[1] == 1 then
				local msg_yes= ""
				player:AddNpcOption(npc, 4, "嘿！来较量一番！", "option1", "")
				return msg_yes
			elseif talk_msg_tb[2] == 1 then
				local msg_one_no = "走开走开！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
				return msg_one_no
			else
				local msg_no = "走开走开！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战我！！！"
				return msg_no
			end
		else
			sLuaApp:LuaDbg("NaoShi.CheckFight返回错误")
			return ""
		end
	else
		sLuaApp:LuaDbg("缺少NaoShi")
	end
end