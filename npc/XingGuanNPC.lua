XingGuanNPC = {}

function XingGuanNPC.option1(npc, player, content)
	if NaoShi then
		if not NaoShi.StartFight(player, npc) then
			local msg_fight = "有个不知死活的小子正在挑战本星官，等我解决了他，再来收拾你！"
			return msg_fight
		end
	else
		sLuaApp:LuaDbg("缺少NaoShi")
	end
    return ""
end

function XingGuanNPC.main(npc, player)
	if NaoShi then
		--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
		local id = npc:GetInt("NaoShiActID")
		local talk_msg_tb = NaoShi.CheckFight(player, id)
		if talk_msg_tb and next(talk_msg_tb) then
			if talk_msg_tb[1] == 1 then
				local msg_yes= "天庭办事，闲杂人等速速离去！"
				player:AddNpcOption(npc, 4, "挑战星官", "option1", "")
				return msg_yes
			elseif talk_msg_tb[2] == 1 then
				local msg_one_no = "星官下凡，凡人退散！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
				return msg_one_no
			else
				local msg_no = "星官下凡，凡人退散！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战！！！"
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