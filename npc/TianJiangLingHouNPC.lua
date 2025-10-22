--天降灵猴 NPC
TianJiangLingHouNPC = {}

function TianJiangLingHouNPC.option1(npc, player, content)
	if not TianJiangLingHou.StartFight(player, npc) then
		return "你也想陪我玩？排队排队，下一个便是你！"
	end
	return ""
end

function TianJiangLingHouNPC.main(npc, player)
	if TianJiangLingHou then
		local id = npc:GetInt("TianJiangLingHouActID")
		local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
		local join_num = player:GetDayInt("TianJiangLingHouJoinNum")
		if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
			return level_min.."级都不到的无名小辈，我可没心思陪你玩。"
		elseif player:GetTeam() then
			return "你们居然组队，以多欺少，我可不跟你们玩。"
		elseif join_num >= TianJiangLingHouConfig.JoinMax then 
			return "今天已经送你很多宝物了，下次再来吧。"
		else
			player:AddNpcOption(npc, 4, "   陪你这顽猴玩玩也无妨！", "option1", "")
			return "少侠少侠，来陪我玩玩吧！"
		end
	else
		sLuaApp:LuaErr("缺少TianJiangLingHou")
	end
	return ""
end