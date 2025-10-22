--结婚NPC 红娘
MarryNPC = {}


function MarryNPC.main(npc, player)
	local res_check_team = MarryNPC.CheckTeam(player)
	if not res_check_team[1] then
		return res_check_team[2]
	end
	
	local team = player:GetTeam()
	local team_members = team:GetTeamMembers(true)
	if team_members[1]:GetInt("Marry_AgreeMarry") == 1 and team_members[2]:GetInt("Marry_AgreeMarry") == 1 then
		for k,v in ipairs(Marry.Grade) do
			player:AddNpcOption(npc, 0, v["Name"], "option2", ""..k)
		end
		return "选择你们的婚礼吧"
	else
		player:AddNpcOption(npc, 0, "我要结婚", "option1", "")
	end
	return ""
end

function MarryNPC.option1(npc, player, content)
	local team_members = player:GetTeam():GetTeamMembers(true)
	local str = [[GlobalUtils.ShowServerBoxMessage("您是否确定与]]..team_members[1]:GetName()..[[结婚")]]
	team_members[2]:SetString("SYSTEM_ConfirmBox_Function", "MarryNPC.Agree(sPlayerSystem:GetPlayerByGUID("..team_members[2]:GetGUID().."),sNpcSystem:GetNpcByGUID("..npc:GetGUID().."))")
	sLuaApp:ShowForm(team_members[2], "脚本表单", str)
	local str = [[GlobalUtils.ShowServerBoxMessage("您是否确定与]]..team_members[2]:GetName()..[[结婚")]]
	team_members[1]:SetString("SYSTEM_ConfirmBox_Function", "MarryNPC.Agree(sPlayerSystem:GetPlayerByGUID("..team_members[1]:GetGUID().."),sNpcSystem:GetNpcByGUID("..npc:GetGUID().."))")
	sLuaApp:ShowForm(team_members[1], "脚本表单", str)
	return ""
end

function MarryNPC.Agree(player, npc)
	local team = player:GetTeam()
	if not team then return end
	player:SetInt("Marry_AgreeMarry", 1)
	if sTeamSystem:IsTeamLeader(team,player) then
		local team_members = team:GetTeamMembers(true)
		if team_members[1]:GetInt("Marry_AgreeMarry") == 1 and team_members[2]:GetInt("Marry_AgreeMarry") == 1 then
			local npc_id = npc:GetId()
			local str = [[
				CL.StartMove(]]..npc_id..[[)
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function MarryNPC.CheckTeam(player)
	local team = player:GetTeam()
	if not team then		
		return {false,"结婚必须男女2人组队申请，请队伍成员满足条件后再来申请。"}
	end
	local team_members = team:GetTeamMembers(true)
	if #team_members ~= 2 then
		return {false,"结婚必须男女2人组队申请，请队伍成员满足条件后再来申请。"}
	end
	
	local sex_1 = team_members[1]:GetAttr(ROLE_ATTR_GENDER)
	local sex_2 = team_members[2]:GetAttr(ROLE_ATTR_GENDER)
	if sex_1 == sex_2 then
		return {false,"结婚必须男女2人组队申请，请队伍成员满足条件后再来申请。"}
	end
	
	if not sTeamSystem:IsTeamLeader(team, player) then
		return {false, "只有队长可以选择。"}
	end
	if sTeamSystem:IsTempLeave(player) then
		return {false,"您的爱人此刻不在队伍中，请他归队后再来申请。"}
	end
	--判断是否已婚
	if sPlayerSystem:GetSpouse(team_members[1]) ~= "" then
		return {false, team_members[1]:GetName().."的"..(sex_1 == 1 and "娘子" or "夫君").."不同意这桩亲事。"}
	end
	if sPlayerSystem:GetSpouse(team_members[2]) ~= "" then
		return {false, team_members[2]:GetName().."的"..(sex_1 == 1 and "娘子" or "夫君").."不同意这桩亲事。"}
	end
	
	local level_1 = team_members[1]:GetAttr(ROLE_ATTR_LEVEL)
	if level_1 < Marry.MinLevel then
		return {false,"结婚需要男女2人等级满足"..Marry.MinLevel.."级，"..team_members[1]:GetName().."等级不足，无法申请。"}
	end
	local level_2 = team_members[2]:GetAttr(ROLE_ATTR_LEVEL)
	if level_2 < Marry.MinLevel then
		return {false,"结婚需要男女2人等级满足"..Marry.MinLevel.."级，"..team_members[2]:GetName().."等级不足，无法申请。"}
	end
	--判断互为好友和好感度XXXXXXXXXXXX
	
	local is_wedding = sVarSystem:GetInt("Marry_IsWedding")
	if is_wedding == 1 then
		sLuaApp:NotifyTipsMsg(team_members[1], "当前有其他玩家在举行婚礼，请您们稍后再来申请。")
		sLuaApp:NotifyTipsMsg(team_members[2], "当前有其他玩家在举行婚礼，请您们稍后再来申请。")
		return {false,"当前有其他玩家在举行婚礼，请您们稍后再来申请。"}
	end
	return {true,""}
end

function MarryNPC.option2(npc, player, grade_index)
	local res_check_team = MarryNPC.CheckTeam(player)
	if not res_check_team[1] then
		return res_check_team[2]
	end
	grade_index = tonumber(grade_index)
	local marry_grade_config = Marry.Grade[grade_index]
	local need_item_keyname = marry_grade_config["GiftKeyName"]
	local item_data = ItemConfig.GetByKeyName(need_item_keyname)
	if not item_data then
		sLuaApp:LuaErr("MarryNPC.option2 ItemConfig不存在"..need_item_keyname)
		return ""
	end
	local item_name = item_data.Name
	local need_item_list = {need_item_keyname,1}
	if Lua_tools.IsItemEnough(player, need_item_list) then
		local str = [[GlobalUtils.ShowServerBoxMessage("是否消耗1个]]..item_name..[[去结婚？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "Marry.StartMarry(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..grade_index..",'"..need_item_keyname.."')")
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		if OneKeyBuy then
			sLuaApp:LuaErr("need_item_list"..Lua_tools.serialize(need_item_list))
			OneKeyBuy.Main(player, need_item_list)
		else
			sLuaApp:NotifyTipsMsg(player, "结婚所需"..item_name.."不足")
		end
	end
	return ""
end