--离婚NPC
DivorceNPC = {}

function DivorceNPC.main(npc, player)
	for k,v in ipairs(Marry.Divorce) do
		player:AddNpcOption(npc, 0, v["Name"], "option1", ""..k)
	end
	

	return ""
end

function DivorceNPC.option1(npc, player, divorce_index)
	--检查是否已结婚
	local spouse_unid = sPlayerSystem:GetSpouse(player)
	if spouse_unid == "" then
		return "您还未结婚。"
	end

	local divorce_config = Marry.Divorce[tonumber(divorce_index)]
	local divorce_type = divorce_config["Type"]
	local divorce_consume = divorce_config["Consume"]
	if divorce_type == "协议" then
		local res_check_team = DivorceNPC.CheckTeam(player)
		if not res_check_team[1] then
			return res_check_team[2]
		end
		local need_money_type = divorce_consume["MoneyType"]
		local need_money_val = divorce_consume["MoneyVal"]
		if need_money_type and need_money_val and need_money_val > 0 then
			local team = player:GetTeam()
			local team_members = team:GetTeamMembers(true)
			DivorceNPC.SendCheckMsg(team_members[1], need_money_type, need_money_val)
			DivorceNPC.SendCheckMsg(team_members[2], need_money_type, need_money_val)
		end	
	elseif divorce_type == "直接" then
		
		local need_item_keyname = divorce_consume["ItemKeyName"]
		if need_item_keyname and need_item_keyname ~= "" then
			local item_data = ItemConfig.GetByKeyName(need_item_keyname)
			if not item_data then
				sLuaApp:LuaErr("DivorceNPC.option1 ItemConfig不存在"..need_item_keyname)
				return ""
			end
			local item_name = item_data.Name
			local need_item_list = {need_item_keyname,1}
			if Lua_tools.IsItemEnough(player, need_item_list) then
				local str = [[GlobalUtils.ShowServerBoxMessage("是否消耗1个]]..item_name..[[离婚？")]]
				player:SetString("SYSTEM_ConfirmBox_Function", "Marry.DirectDivorce(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."), '"..need_item_keyname.."')")
				sLuaApp:ShowForm(player, "脚本表单", str)
			else
				if OneKeyBuy then
					OneKeyBuy.Main(player, need_item_list)
				else
					sLuaApp:NotifyTipsMsg(player, "离婚所需"..item_name.."不足")
				end
			end
			
		end
	end
	return ""
end

function DivorceNPC.SendCheckMsg(player, need_money_type, need_money_val)
	if Lua_tools.IsMoneyEnough(player, need_money_type, need_money_val) then
		local str = [[GlobalUtils.ShowServerBoxMessage("是否消耗#OFFSET<X:0,Y:-8#IMAGE]]..ShiLianConfig.MoneyIcon[need_money_type]..[[#OFFSETEND>#]]..need_money_val..[[离婚？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "DivorceNPC.Agree(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."), "..need_money_type..", "..need_money_val..")")
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:NotifyTipsMsg(player, "离婚所需"..Lua_tools.GetMoneyName(need_money_type).."不足")
	end
	
end

function DivorceNPC.Agree(player, need_money_type, need_money_val)
	local team = player:GetTeam()
	if not team then return end
	player:SetInt("Marry_AgreeMarry", 1)
	local team_members = team:GetTeamMembers(true)
	if team_members[1]:GetInt("Marry_AgreeMarry") == 1 and team_members[2]:GetInt("Marry_AgreeMarry") == 1 then
		Marry.AgreementDivorce(team_members[1], team_members[2], need_money_type, need_money_val)
	end
end

function DivorceNPC.CheckTeam(player)
	local team = player:GetTeam()
	if not team then		
		return {false,"离婚需要夫妻2人组队申请，请队伍成员满足条件后再来申请。"}
	end
	local team_members = team:GetTeamMembers(true)
	if #team_members ~= 2 then
		return {false,"离婚需要夫妻2人组队申请，请队伍成员满足条件后再来申请。"}
	end
	
	local spouse_unid = sPlayerSystem:GetSpouse(team_members[1])
	if spouse_unid ~= team_members[2]:GetUNID() then
		return {false,"离婚需要夫妻2人组队申请，请队伍成员满足条件后再来申请。"}
	end
		
	if not sTeamSystem:IsTeamLeader(team, player) then
		return {false, "只有队长可以选择。"}
	end

	--local sex_1 = team_members[1]:GetAttr(ROLE_ATTR_GENDER)
	local sex_2 = team_members[2]:GetAttr(ROLE_ATTR_GENDER)
	if sTeamSystem:IsTempLeave(player) then
		return {false,"离婚需要夫妻2人均在队伍之中，请您的"..(sex_2 == 1 and "夫君" or "娘子")..team_members[2]:GetName().."归队后再来申请。"}
	end

	return {true,""}
end