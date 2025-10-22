--丹炉活动器灵
DanLuQiLingNPC = {}

function DanLuQiLingNPC.option1(npc, player, content)
	if DanLu then
		if not DanLu.StartFight(player, npc) then
			local msg_fight = "有个不知死活的小子正在挑战大爷，等我解决了他，再来收拾你！"
			return msg_fight
		end
	else
		sLuaApp:LuaDbg("缺少DanLu")
	end
    return ""
end

function DanLuQiLingNPC.main(npc, player)	
	if DanLu then
		--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
		local id = npc:GetInt("DanLuActID")
		local talk_msg_tb = DanLu.CheckFight(player, id)
		if talk_msg_tb and next(talk_msg_tb) then
			if talk_msg_tb[1] == 1 then
				local msg_yes= "都是胆小鬼，没人敢和我打一架！!"
				if DanLuConfig.NPCToMonster and DanLuConfig.NPCToMonster[npc:GetKeyName()] then
					local item_keyname = DanLuConfig.NPCToMonster[npc:GetKeyName()]['ConsumeItem']
					local item_name = ItemConfig.GetByKeyName(item_keyname).Name
					msg_yes = msg_yes.."\n需要"..item_name.."才能完全击败我，获得奖励！"
				end
				player:AddNpcOption(npc, 4, "妖怪，看招！", "option1", "")
				return msg_yes
			elseif talk_msg_tb[2] == 1 then
				local msg_one_no = "走开走开！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
				return msg_one_no
			else
				local msg_no = "走开走开！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战我！！！"
				return msg_no
			end
		else
			sLuaApp:LuaDbg("DanLu.CheckFight返回错误")
			return ""
		end
	else
		sLuaApp:LuaDbg("缺少DanLu")
	end
end