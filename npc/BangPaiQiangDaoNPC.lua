--帮派强盗NPC
BangPaiQiangDaoNPC = {}

function BangPaiQiangDaoNPC.option1(npc, player, content)
	if BangPaiQiangDao then
		if not BangPaiQiangDao.StartFight(player, npc) then
			local msg_fight = "有个不知死活的小子正在挑战大爷，等我解决了他，再来收拾你！"
			return msg_fight
		end
	else
		sLuaApp:LuaDbg("缺少BangPaiQiangDao")
	end
    return ""
end

function BangPaiQiangDaoNPC.main(npc, player)
	if BangPaiQiangDao then
		--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
		local id = npc:GetInt("BangPaiQiangDaoActID")
		local talk_msg_tb = BangPaiQiangDao.CheckFight(player, id)
		if talk_msg_tb and next(talk_msg_tb) then
			if talk_msg_tb[1] == 1 then
				local msg_yes= "一个能打的都没有！！"
				player:AddNpcOption(npc, 4, "进入战斗", "option1", "")
				return msg_yes
			elseif talk_msg_tb[2] == 1 then
				local msg_one_no = "走开走开！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
				return msg_one_no
			else
				local msg_no = "走开走开！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战我！！！"
				return msg_no
			end
		else
			sLuaApp:LuaDbg("BangPaiQiangDao.CheckFight返回错误")
			return ""
		end
	else
		sLuaApp:LuaDbg("缺少BangPaiQiangDao")
	end
end