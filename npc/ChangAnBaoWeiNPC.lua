--长安保卫战 怪物
ChangAnBaoWeiNPC = {}

function ChangAnBaoWeiNPC.main(npc, player)
	if npc:GetInt("NPCType") == 1 then
		if ChangAnBaoWei and ChangAnBaoWei.OpenBox then
			ChangAnBaoWei.OpenBox(npc, player)
			return ""
		else
			sLuaApp:LuaErr("不存在ChangAnBaoWei.OpenBox")
		end
	else
		player:AddNpcOption(npc, 0, "保家卫国，为民除害", "option1", "")
		return "0"
	end
	return ""
end

function ChangAnBaoWeiNPC.option1(npc, player, content)
	if ChangAnBaoWei then
		local id = sVarSystem:GetInt("ACTIVITY_ChangAnBaoWei_ID")
		local level_min = ActivityConfig.GetById(id).LevelMin
		if not level_min then return "" end
		if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
			return level_min.."级都不到，还想挑战我，哈哈哈哈，真是可笑！"
		end
		if player:IsTempLeave() then
			return "暂离状态无法进入战斗。"
		end
		if player:GetTeam() and not player:IsTeamLeader() then
			return ""
		end
		
		if not ChangAnBaoWei.StartFight(player, npc) then
			return "干嘛！想以多欺少，欺负猴？"
		end
	else
		sLuaApp:LuaErr("缺少ChangAnBaoWei")
	end
    return ""
end
