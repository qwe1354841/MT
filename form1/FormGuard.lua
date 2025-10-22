--侍从相关表单
FormGuard = {}

--侍从升星数据
function FormGuard.GetUpStarData(player,guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","升星") then
		return ""
	end
	if GuardUpStar then
		GuardUpStar.GetData(player,guard_guid)
	end
	return ""
end

--侍从升星
function FormGuard.StartUpStar(player,guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","升星") then
		return ""
	end
	if GuardUpStar then
		GuardUpStar.StartUpStar(player,guard_guid)
	end
	return ""
end

--得到全部阵容的侍从guid表
function FormGuard.GetBattleArray(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if Guard_BattleArray then
		Guard_BattleArray.GetBattleArray(player)
	end
	return ""
end

--UI界面刷新
function FormGuard.RefreshLineupPanel(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if Guard_BattleArray then
		Guard_BattleArray.RefreshLineupPanel(player)
	end
	return ""
end


--设置使用阵容
function FormGuard.ChangeUseArray(player,index)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if not Marry.BanGuard(player) then
		return
	end
	if Guard_BattleArray then
		Guard_BattleArray.SetUseArray(player,index)
	end
	return ""
end

--改变阵容名称
function FormGuard.ChangeArrayName(player,index,name)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if Guard_BattleArray then
		Guard_BattleArray.ChangeArrayName(player,index,name)
	end
	return ""
end

--指定阵容侍从上阵
function FormGuard.LineupUp(player,index,guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.LineupUp(player,index,guard_guid)
	end
	return ""
end

--指定阵容侍从下阵
function FormGuard.LineupDown(player,index,guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.LineupDown(player,index,guard_guid)
	end
	return ""
end

--指定阵容交换侍从
function FormGuard.LineupExchange(player,index,site1,site2)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.LineupExchange(player,index,site1,site2)
	end
	return ""
end

--指定阵容侍从上阵交换
function FormGuard.LineupUpAndExchange(player,index,guard_guid1,guard_guid2)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.LineupUpAndExchange(player,index,guard_guid1,guard_guid2)
	end
	return ""
end

--清空指定侍从阵容
function FormGuard.ClearLineup(player,index)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.ClearLineup_Index(player,index)
	end
	return ""
end

--清空所有侍从阵容
function FormGuard.ClearAllLineup(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if not Marry.BanGuard(player) then
		return
	end
	--if player:IsFightState() then
    --    sLuaApp:NotifyTipsMsg(player , '战斗中无法操作阵容！')
    --    return ""
    --end
	if Guard_BattleArray then
		Guard_BattleArray.ClearLineup_All(player)
	end
	return ""
end

--侍从情缘数据
function FormGuard.GetLoveSkillData(player, guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","情缘") then
		return ""
	end
	if Guard_LoveSkillUp then
		Guard_LoveSkillUp.GetData(player, guard_guid)
	end
	return ""
end

--侍从普通情缘技能升级
function FormGuard.CommonLoveSkillUp(player, guard_guid, index)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","情缘") then
		return ""
	end
	if Guard_LoveSkillUp then
		Guard_LoveSkillUp.CommonSkillUp(player, guard_guid, index)
	end
	return ""
end

--侍从终极情缘技能升级
function FormGuard.SuperLoveSkillUp(player, guard_guid)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","情缘") then
		return ""
	end
	if Guard_LoveSkillUp then
		Guard_LoveSkillUp.SuperSkillUp(player, guard_guid)
	end
	return ""
end

--得到全部阵容的侍从guid表
function FormGuard.GetBattleArray(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","阵容") then
		return ""
	end
	if Guard_BattleArray then
		Guard_BattleArray.GetBattleArray(player)
	end
	return ""
end

--侍从加成数据
function FormGuard.AttrAddData(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","加成") then
		return ""
	end
	if Guard_Add then
		Guard_Add.MainData(player)
	end
	return ""
end

--玩家已有侍从加成属性列表
function FormGuard.GetAttrAddList(player)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","加成") then
		return ""
	end
	if Guard_Add then
		Guard_Add.GetAttrAddList(player)
	end
	return ""
end

--侍从加成升级
function FormGuard.AttrAddLevelup(player,guard_id)
	if not MainUISwitch.CheckOpenLevel(player,"侍从","加成") then
		return ""
	end
	if Guard_Add then
		Guard_Add.Attr_Levelup(player,guard_id)
	end

	return ""
end

-- 发给GlobalProcessing的侍从小红点数据
function FormGuard.get_guard_red_point_data(player)
	if not player then return end
	-- 获取玩家等级
	local role_level = player:GetAttr(ROLE_ATTR_LEVEL)

	if not MainUISwitch then require 'MainUISwitch' end

	local open_level = 13

	if MainUISwitch and MainUISwitch.Config and MainUISwitch.Config['侍从'].OpenLevel then
		open_level = MainUISwitch.Config['侍从'].OpenLevel
	end

	-- 如果玩家等级未达标，不提供小红点数
	if role_level >= open_level then
		local guards_red_point = {}
		if GuardRedPoint then
			guards_red_point = GuardRedPoint.get_guard_red_point(player)
		end
		local str = [[
    	GlobalProcessing.guard_red_point_data = ]].. Lua_tools.serialize(guards_red_point) ..[[
    	GlobalProcessing._refresh_guard_red_point()
    ]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	return ""
end

-- 发送侍从升星数据
function FormGuard.get_guard_up_star_data(player)
	if not player then return end
	if not GuardUpStar then require 'GuardUpStar' end

	if GuardUpStar then
		local str = [[
		if not UIDefine then require 'UIDefine' end

		if UIDefine then
			UIDefine.guard_up_star_token_num = ]] .. Lua_tools.serialize(GuardUpStar.NeedTokenNumber) ..[[
		end
	]]

		sLuaApp:ShowForm(player, "脚本表单", str)
	end

	return ''
end

--设置侍从是否可见
function FormGuard.SetOtherGuardCanSee(player,set)
	if player == nil then
		return ""
	end

	set = tonumber(set)
	if set == nil then
		return ''
	end

	if set ~= 0 then
		player:SetInt("GUARD_OtherGuardCanSee", 1)
		player:OtherGuardCanSee(false)
	else
		player:SetInt("GUARD_OtherGuardCanSee", 0)
		player:OtherGuardCanSee(true)
	end

	sCustomVarSystem:SetBroadcastScope(0,"GUARD_OtherGuardCanSee",1)

	return ""
end

--获得侍从的可见状态
function FormGuard.GetGuardCanSeeOnLogin(player)
	if player == nil then
		return ""
	end

	if player:GetInt('GUARD_OtherGuardCanSee') ~= 0 then
		--player:SetInt("PET_OtherPetCanSee", 1)
		player:OtherGuardCanSee(false)
	else
		player:SetInt("GUARD_OtherGuardCanSee", 0)
		player:OtherGuardCanSee(true)
	end

	sCustomVarSystem:SetBroadcastScope(0,"GUARD_OtherGuardCanSee",1)

end