TianDiDaJieNPC = {}

function TianDiDaJieNPC.on_create(npc)
  --lualib:AddTrigger(npc, lua_trigger_post_die, "on_die")
  return ""
end

function TianDiDaJieNPC.main(npc,player)
    local msg = ""
	local id = npc:GetInt("TianDiDaJieActID")
	local talk_msg_tb = TianDiDaJie.CheckFight(player, id)
	sLuaApp:LuaDbg("id:"..id)
	sLuaApp:LuaDbg("talk_msg_tb:"..Lua_tools.serialize(talk_msg_tb))

	if talk_msg_tb and next(talk_msg_tb) then
		if talk_msg_tb[1] == 1 then
			local msg_yes= "咿呀呀呀呀！本大爷驾到，将金银珠宝都给本大爷呈上来！！！"
			player:AddNpcOption(npc, 4, "妖怪，看招！", "option1", "")
			return msg_yes
		elseif talk_msg_tb[2] == 1 then
			if player:IsTempLeave() then
				local msg_one_no = "队伍暂离状态下没有资格挑战我！！！"
				return msg_one_no
			else
				local msg_one_no = "走开走开！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
				return msg_one_no
			end
		else
			local msg_no = "走开走开！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战！！！"
			return msg_no
		end
	else
		sLuaApp:LuaDbg("NaoShi.CheckFight返回错误")
		return ""
	end
end

function TianDiDaJieNPC.option1(npc, player)
	sLuaApp:LuaDbg("==================点击了对话=====================")
	if TianDiDaJieNPC then
		if not TianDiDaJie.StartFight(player, npc) then
			sLuaApp:NotifyTipsMsg(player, "无法进入战斗，目标仍在战斗中")
			return ""
		end
	else
		sLuaApp:LuaDbg("TianDiDaJieNPC")
	end
    return ""
end
