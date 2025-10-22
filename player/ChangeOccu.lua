--转职
ChangeOccu = {}

--最小等级
ChangeOccu.MinLevel = 70
--距上一次转换门派最小时间 小时
ChangeOccu.MinChangeSchoolTime = 0
--距上一次转换角色最小时间 小时
ChangeOccu.MinChangeRoleTime = 0
--距服务器开启最小时间 小时
ChangeOccu.MinServerTime = 96
--角色只能同性别转换

--转换角色 是否给免费转武器次数
ChangeOccu.IsGetFreeChange = 1

ChangeOccu.SchoolConsume = {
	--当前门派=目标门派，不消耗
	[1] = {"菩提子",2},	--当前门派≠目标门派，消耗数量读配置
	[2] = {"菩提子",1},	--当前门派≠目标门派，并且目标门派之前加入过，消耗数量读配置
}
ChangeOccu.RoleConsume = {
	--当前角色=目标角色，不消耗
	[1] = {"再造丸",2},	--当前角色≠目标角色，消耗数量读配置
	[2] = {"再造丸",1},	--当前角色≠目标角色，并且目标角色之前使用过，消耗数量读配置
}
ChangeOccu.RoleDefaultColor = {
	[31] = {1001,1002}, [32] = {1101,1102}, [33] = {1201,1202}, [34] = {1301,1302}, [35] = {1401,1402}, [36] = {1501,1502},
	[37] = {1601,1602}, [38] = {1701,1702}, [39] = {1801,1802}, [40] = {1901,1902}, [41] = {2001,2002}, [42] = {2101,2102},
}

--洗点丹KeyName
ChangeOccu.ClearPointItem = "重洗灵丹"

--tips
ChangeOccu.Tips = [[1.门派、角色可以自由转换。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[2.根据目标门派、角色与当前门派、角色的差异，需要消耗对应的道具。若转换的门派、角色在之前曾经使用过，消耗的道具数量将减半。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[3.进行转换的角色等级需要达到<color=#ff133f>70</color>级，并且<color=#ff133f>没有穿戴</color>武器。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[4.每次转换成功，都需要间隔一定时间才能再次转换。门派转换、角色转换的间隔时间<color=#ff133f>分别计算</color>。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[5.转换门派后，目标门派的技能等级将与原门派一致。原门派的天赋技能激活与装备状态会保留，但<color=#ff133f>不会生效</color>。角色的潜能点会根据目标门派的默认加点方案自动分配，并可免费获得一个九转炼骨丹（通过邮件寄送）。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[6.转换角色后，将会获得<color=#ff133f>1次免费</color>转换武器的机会，角色的染色方案将会保留。\n]]
ChangeOccu.Tips = ChangeOccu.Tips..[[7.若当前为门派大弟子，或正参与门派大弟子竞选，转换门派后将<color=#ff133f>立即取消</color>原门派大弟子身份或竞选资格。\n]]

function ChangeOccu.GetData(player)
	local str = [[
		GUI.OpenWnd("RoleTransferUI")
		if RoleTransferUI then
			RoleTransferUI.RoleTransferTips  = "]]..ChangeOccu.Tips..[["
			RoleTransferUI.SchoolConsume = ]]..Lua_tools.serialize(ChangeOccu.SchoolConsume)..[[
			RoleTransferUI.RoleConsume = ]]..Lua_tools.serialize(ChangeOccu.RoleConsume)..[[
			RoleTransferUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
end

function ChangeOccu.StartChange(player, change_school_id, change_role_id, is_checked)
	local roleID = change_role_id
	if not change_school_id or not change_role_id or not is_checked then return end
	change_school_id = tonumber(change_school_id)
	change_role_id = tonumber(change_role_id)
	is_checked = tonumber(is_checked)
	local now_school_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local now_role_id = player:GetAttr(ROLE_ATTR_ROLE)
	local is_change_school = not (change_school_id == now_school_id)
	local is_change_role = not (change_role_id == now_role_id)

	if not is_change_school and not is_change_role then
		sLuaApp:NotifyTipsMsg(player, "目标门派和角色与当前门派和角色完全一致，无需转换")
		return
	end
	
	if is_change_school then
		local school_data = SchoolConfig.GetById(change_school_id)
		if not school_data then
			sLuaApp:LuaErr(" ChangeOccu.StartChange SchoolConfig 不存在 "..change_school_id)
			return
		end
	end
	if is_change_role then
		local role_data = RoleConfig.GetById(change_role_id)
		if not role_data then
			sLuaApp:LuaErr(" ChangeOccu.StartChange RoleConfig 不存在 "..change_role_id)
			return
		end
		local now_sex = player:GetAttr(ROLE_ATTR_GENDER)	
		if now_sex ~= role_data.Sex then
			sLuaApp:NotifyTipsMsg(player, "不可跨性别转换")
			return
		end
	end

	if not ChangeOccu.Check(player) then return end
	
	local consume_item = {}
	if is_change_school then
		local is_used_school = player:GetInt("ChangeOccu_UsedSchool_"..change_school_id)
		if is_used_school == 0 then
			for _,v in ipairs(ChangeOccu.SchoolConsume[1]) do
				table.insert(consume_item, v)
			end
		elseif is_used_school == 1 then
			for _,v in ipairs(ChangeOccu.SchoolConsume[2]) do
				table.insert(consume_item, v)
			end
		end
	end
	if is_change_role then
		local is_used_role = player:GetInt("ChangeOccu_UsedRole_"..change_role_id)
		if is_used_role == 0 then
			for _,v in ipairs(ChangeOccu.RoleConsume[1]) do
				table.insert(consume_item, v)
			end
		elseif is_used_role == 1 then
			for _,v in ipairs(ChangeOccu.RoleConsume[2]) do
				table.insert(consume_item, v)
			end
		end
	end
	
	if not Lua_tools.IsItemEnough(player, consume_item) then
		if OneKeyBuy then
			local defect_list = Lua_tools.GetDefectList(player, consume_item)
			OneKeyBuy.Main(player, defect_list)
		else
			sLuaApp:NotifyTipsMsg("转换所需物品不足")
		end
		return
	end
	
	--弹验证码
	if is_checked == 0 then
		local str = [[
			if RoleTransferUI then
				GUI.OpenWnd("RoleTransferConfirmUI",']]..change_school_id..[[#]]..change_role_id..[[')
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	
	if not Lua_tools.SubItem(player, consume_item, "system", "转职", "转职消耗") then
		sLuaApp:LuaErr("ChangeOccu.StartChange Lua_tools.SubItem 错误")
		return
	end
	
	--清除天赋设置
	if PlayerSkillSpell then
		PlayerSkillSpell.Del_Skill_Spell_All(player)
	else
		sLuaApp:LuaErr("ChangeOccu 缺少 PlayerSkillSpell")
		return
	end
	--门派大弟子
	if is_change_school and Act_FirstDisciple then
		Act_FirstDisciple.ByChangeOccu(player)
	end
	--染色
	local plan1 = player:GetColorPlan1()  --头
	local plan2 = player:GetColorPlan2()  --身体
	--sLuaApp:LuaDbg("plan1......."..plan1)
	--sLuaApp:LuaDbg("plan2......."..plan2)
	local row1 = ColorConfig.GetById(plan1)
	local row2 = ColorConfig.GetById(plan2)
	local HeadC = 0
	local BodyC = 0
	local Table = assert(load("return " .. sVarSystem:GetString("RoleColorConfig")))()
	--sLuaApp:LuaDbg("RoleColorConfig....long"..#Table)
	for k,v in pairs(Table) do
		if roleID == v.TempletId then
			if row1.Group == v.Group then
				if row1.Index == v.Index then
					HeadC = v.Id
				end
			end
			if row2.Group == v.Group then
				if row2.Index == v.Index then
					BodyC = v.Id
				end
			end
		end
	end
	if HeadC == 0 then
		HeadC = ChangeOccu.RoleDefaultColor[roleID][1]
		sLuaApp:NotifyTipsMsgEx(player, "未获得该角色染色方案，调整为默认方案")
	end
	if BodyC == 0 then
		BodyC = ChangeOccu.RoleDefaultColor[roleID][2]
		sLuaApp:NotifyTipsMsgEx(player, "未获得该角色染色方案，调整为默认方案")
	end
	--sLuaApp:LuaDbg("门派获取"..player:GetAttr(ROLE_ATTR_ROLE))
	--sLuaApp:LuaDbg("HeadC......."..HeadC)
	--sLuaApp:LuaDbg("BodyC......."..BodyC)
	local ret = player:DyeingColor(HeadC, BodyC)
	if not ret then
		sLuaApp:NotifyTipsMsgEx(player, "染色方案错误")
	end
	--转职
	if not player:Transfer(change_role_id, change_school_id) then
		sLuaApp:LuaErr(player:GetName().." Transfer 失败")
		return
	end
	--检查角色装备生效 刷新模型
	sItemSystem:CheckEquipsRequire(player)

	--调用推荐加点
	ChangeOccu.AddPoint(player, change_role_id)
	
	--《转职成功》飘字
	ChangeOccu.EndChangeOccu(player)
	
	sQuestSystem:ClearQuestsByTemplate(player,1)
    sQuestSystem:ClearQuestsByTemplate(player,2)
    sQuestSystem:ForceRecalc(player)
	
	--转技能
	if PlayerSkill then
		ChangeOccu.ChangeSkill(player)
		--心法技能Attr
		if PlayerSkill then
			PlayerSkill.RecalcSkillAttr(player)
		end
	else
		sLuaApp:LuaErr("ChangeOccu 缺少 PlayerSkill")
		return
	end
	PlayerSkillSpell.GetSkillSpellByChangeOccu(player)
	
	--设置默认挂机技能
	local skill_id = player:GetInt("PlayerSkill_Sect_1_1")
	if not player:SetAutoSkill(skill_id) then
		sLuaApp:LuaErr("ChangeOccu player:SetAutoSkill 失败")
	end

	--记录时间
	local now_time = sLuaApp:GetTimes()
	if is_change_school then
		player:SetInt("ChangeOccu_ChangeSchoolTime", now_time)
	end
	if is_change_role then
		player:SetInt("ChangeOccu_ChangeRoleTime", now_time)
		if ChangeOccu.IsGetFreeChange == 1 then
			EquipChange.GetFreeChangeNum(player, "Weapon")
		end
	end
	--记录已使用
	ChangeOccu.SetUsed(player)
	
	--灵宝系统
	if SpiritualEquip then
		SpiritualEquip.ChangeOccu(player, now_school_id, change_school_id)
	end
	
	--清空自动切换技能方案
	if AutomaticCasting then
		AutomaticCasting.ResetRoleSchemeData(player)
	end
	
	local str = [[
		if RoleTransferUI then
			GUI.DestroyWnd('RoleTransferUI')
		end
		GUI.OpenWnd('GetRoleTipUI',']]..change_school_id..[[#]]..change_role_id..[[')
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--记录已使用
function ChangeOccu.SetUsed(player)
	player:SetInt("ChangeOccu_UsedSchool_"..player:GetAttr(ROLE_ATTR_JOB_1), 1)
	player:SetInt("ChangeOccu_UsedRole_"..player:GetAttr(ROLE_ATTR_ROLE), 1)
end

function ChangeOccu.ChangeSkill(player)
	local skill_container = player:GetSkillContainer()
	for heart_method_index = 1, PlayerSkill.HeartMethodNum do
		local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index)
		for j = 1, 5 do
			--销毁老技能
			local old_skill_id = player:GetInt("PlayerSkill_Sect_"..heart_method_index.."_"..j)
			if old_skill_id ~= 0 then
				player:SetInt("PlayerSkill_Sect_"..heart_method_index.."_"..j, 0)
				local old_skill = skill_container:GetSkill(old_skill_id)
				skill_container:DestroySkill(old_skill, true)
			end
		end
		--PlayerSkill.AddSkill(player, heart_method_index, heart_level)
	end
	--防止手贱在开服的时候改心法顺序 2022-01-07 16:14:10
	for heart_method_index = 1, PlayerSkill.HeartMethodNum do
		local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index)
		PlayerSkill.AddSkill(player, heart_method_index, heart_level)
	end
end

function ChangeOccu.AddPoint(player, role_id)
	--取消自动加点
	player:SetInt("ADDPOINT_Auto",0)
	--清属性点
	player:ClearPoint()
	local remain_point = player:GetAttr(ROLE_ATTR_REMAIN_POINT)
	local school = player:GetAttr(ROLE_ATTR_JOB_1)
	local str = [[
	if GlobalProcessing then
		GlobalProcessing.SetAddPoint(]]..role_id..[[, ]]..school..[[, ]]..remain_point..[[)
	end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--发洗点丹
	sMailSystem:SendMail( 0, "门派转换贺礼", player:GetGUID(), 1, "门派转换贺礼", "恭喜您加入了新门派！为了您更好地体验游戏，送上贺礼一份。您可以使用这九转炼骨丹重置角色潜能点，然后重新分配。", {}, ChangeOccu.ClearPointItemTb)
end


function ChangeOccu.Check(player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if level < ChangeOccu.MinLevel then
		sLuaApp:NotifyTipsMsg(player, ChangeOccu.MinLevel.."级才能进行门派和角色转换")
		return false
	end
	local equip_con = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
	local equip_list = equip_con:GetItemList()
	if next(equip_list) then
		sLuaApp:NotifyTipsMsg(player, "请卸下所有装备后再进行转换")
		return false
	end
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "组队中，不能转换")
		return false
	end
	local now_time = sLuaApp:GetTimes()
	local last_school_time = player:GetInt("ChangeOccu_ChangeSchoolTime")
	if last_school_time + ChangeOccu.MinChangeSchoolTime * 3600 > now_time then
		sLuaApp:NotifyTipsMsg(player, "每次转换门派必须间隔"..ChangeOccu.MinChangeSchoolTime.."小时以上")
		return false
	end
	local last_role_time = player:GetInt("ChangeOccu_ChangeRoleTime")
	if last_role_time + ChangeOccu.MinChangeRoleTime * 3600 > now_time then
		sLuaApp:NotifyTipsMsg(player, "每次转换角色必须间隔"..ChangeOccu.MinChangeRoleTime.."小时以上")
		return false
	end
	local server_time = ConstVarConfig["StartServerTime"].Value
	local server_time_sec = sLuaApp:Str2DateTime(server_time)
	if server_time_sec + ChangeOccu.MinServerTime * 3600 > now_time then
		sLuaApp:NotifyTipsMsg(player, "开服"..ChangeOccu.MinServerTime.."小时后才可以转换")
		return false
	end
	local shape_id = player:GetAttr(ROLE_ATTR_SHAPE)
	if shape_id ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "变身状态下不能进行转换")
		return false
	end
	return true
end

function ChangeOccu.EndChangeOccu(player)
	local str = [[
		if BubbleMessageUI then
			BubbleMessageUI.RoleTransferSuccess()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function ChangeOccu.Initilization()
	local item_data = ItemConfig.GetByKeyName(ChangeOccu.ClearPointItem)
	if not item_data then
		sLuaApp:LuaErr("ChangeOccu.Initilization() ItemConfig 不存在"..ChangeOccu.ClearPointItem)
	end
	ChangeOccu.ClearPointItemTb = {item_data.Id, 1, 1}
	
	for i = 31, 36 do
		sCustomVarSystem:SetBroadcastScope(0, "ChangeOccu_UsedSchool_"..i, 1)
	end
	for i = 31, 42 do
		sCustomVarSystem:SetBroadcastScope(0, "ChangeOccu_UsedRole_"..i, 1)
	end
end
ChangeOccu.Initilization()
