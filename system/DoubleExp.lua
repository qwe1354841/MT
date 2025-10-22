--双倍经验
DoubleExp = {}

--需要双倍经验的 AddExp接口	sender, reason, detail
DoubleExp.NeedAdd = {
	{"战斗系统", "PVE战斗结算", "PVE战斗胜利后角色获取经验"},--野怪
	{"战斗系统", "PVE战斗结算", "PVE战斗胜利后宠物获取经验"},--野怪
	{"XiaoGui", "accomplish", "player"},--降妖 玩家
	{"XiaoGui", "accomplish", "pet"},--降妖 宠物
	{"XiuLuo", "accomplish", "player"},--伏魔 玩家
	{"XiuLuo", "accomplish", "pet"},--伏魔 宠物
	{"system", "十二星官", "怪物掉落"},--十二星官
	-- {"system", "天罡活动", "怪物掉落"},
	-- {"system", "长安保卫战活动", "打败怪物"},
	-- {"system", "帮派强盗活动", "帮派强盗掉落"},
	-- {"system", "丹炉活动", "打败器灵"},
	-- {"system", "闹事活动", "怪物掉落"},
	-- {"YaoWang", "YaoWang", "nil"},
	-- {"system", "副本", "战斗奖励"},
}

--每天/周可领 TimeType 1 每日 2每周
DoubleExp.GetPointConfig = {["TimeType"] = 1, ["Point"] = 200}

--单次提取值
DoubleExp.DrawNumber = 100
--点击购买的物品keyname
DoubleExp.Item = "双倍经验点"
--冻结池上限
DoubleExp.FreezeMaxPoint = 2000
--总上限
DoubleExp.MaxPoint = 2000
--第一次登录
DoubleExp.FirstLoginNum = 1000

--npc获得双倍点
function DoubleExp.GetPoint(player,isUI_get)
	local is_get_double = 1
	if DoubleExp.GetPointConfig["TimeType"] == 1 then
		is_get_double = player:GetDayInt("DoubleExpIsGet")
	elseif DoubleExp.GetPointConfig["TimeType"] == 2 then
		is_get_double = player:GetWeekInt("DoubleExpIsGet")	
	end
	if is_get_double == 1 then
		sLuaApp:NotifyTipsMsg(player, "今日已领取过双倍经验点")
		return ""
	elseif is_get_double == 0 then
		local freeze_sum_point = player:GetInt("FreezeDoubleExpPoint") + DoubleExp.GetPointConfig["Point"]
		local sum_point = freeze_sum_point + player:GetInt("DoubleExpPoint")
		if freeze_sum_point > DoubleExp.FreezeMaxPoint or sum_point > DoubleExp.MaxPoint then
			sLuaApp:NotifyTipsMsg(player, "双倍经验点已达上限，无法领取")
			return ""
		else
			player:SetInt("FreezeDoubleExpPoint", freeze_sum_point)
			sLuaApp:NotifyTipsMsg(player, "领取"..DoubleExp.GetPointConfig["Point"].."双倍经验点成功")
			if DoubleExp.GetPointConfig["TimeType"] == 1 then
				player:SetDayInt("DoubleExpIsGet", 1)
			elseif DoubleExp.GetPointConfig["TimeType"] == 2 then
				player:SetWeekInt("DoubleExpIsGet", 1)	
			end
			if isUI_get and isUI_get == 1 then
				DoubleExp.GetData(player)
			end
			return ""
		end
	end
	return ""
end

--检查上限
function DoubleExp.CheckMax(player)
	local now_point = player:GetInt("FreezeDoubleExpPoint")
	if now_point >= DoubleExp.FreezeMaxPoint then
		sLuaApp:NotifyTipsMsg(player, "双倍点已满，无法继续使用")
		return false
	end
	local now_sum_point = player:GetInt("DoubleExpPoint") + player:GetInt("FreezeDoubleExpPoint")
	if now_sum_point >= DoubleExp.MaxPoint then
		sLuaApp:NotifyTipsMsg(player, "双倍点已满，无法继续使用")
		return false
	end
	return true
end

--显示
function DoubleExp.GetData(player)
	local double_point = player:GetInt("DoubleExpPoint")
	local freeze_point = player:GetInt("FreezeDoubleExpPoint")
	local is_get_double = 1
	if DoubleExp.GetPointConfig["TimeType"] == 1 then
		is_get_double = player:GetDayInt("DoubleExpIsGet")
	elseif DoubleExp.GetPointConfig["TimeType"] == 2 then
		is_get_double = player:GetWeekInt("DoubleExpIsGet")	
	end
	local str = [[
		if DoubleExpUI then
			DoubleExpUI.DoublePoint = ]]..double_point..[[
			DoubleExpUI.FrozenNum = ]]..freeze_point..[[
			DoubleExpUI.HaveGotFreePoint = ]]..is_get_double..[[
			DoubleExpUI.RefreshData()
		end
	]]
	sLuaApp:ShowForm(player,"脚本表单", str)
end

--王师傅要求提出来 冻结但不GetData
function DoubleExp.FreezeDoubleExp(player)
	local double_point = player:GetInt("DoubleExpPoint")
	local freeze_point = player:GetInt("FreezeDoubleExpPoint")
	if double_point <= 0 then
		sLuaApp:NotifyTipsMsg(player, "无可冻结双倍经验点")
		return false
	end
	if freeze_point >= DoubleExp.FreezeMaxPoint then
		sLuaApp:NotifyTipsMsg(player, "冻结的双倍经验点已达上限")
		return false
	end
	if double_point > DoubleExp.FreezeMaxPoint - freeze_point then
		player:SetInt("DoubleExpPoint", double_point + freeze_point - DoubleExp.FreezeMaxPoint)
		player:SetInt("FreezeDoubleExpPoint", DoubleExp.FreezeMaxPoint)
	else
		player:SetInt("DoubleExpPoint", 0)
		player:SetInt("FreezeDoubleExpPoint", player:GetInt("FreezeDoubleExpPoint") + double_point)
	end
	return true
end

--冻结
function DoubleExp.Freeze(player)
	if DoubleExp.FreezeDoubleExp(player) then
		DoubleExp.GetData(player)
	end
end

--王师傅要求提出来 提取但不GetData
function DoubleExp.DrawDoubleExp(player)
	local double_point = player:GetInt("DoubleExpPoint")
	local freeze_double_point = player:GetInt("FreezeDoubleExpPoint")
	if freeze_double_point <= 0 then
		sLuaApp:NotifyTipsMsg(player, "无可提取双倍经验点")
		return false
	end
	local draw_num = DoubleExp.DrawNumber
	if freeze_double_point < DoubleExp.DrawNumber then
		draw_num = freeze_double_point
	end
	player:SetInt("FreezeDoubleExpPoint", freeze_double_point - draw_num)
	player:SetInt("DoubleExpPoint", double_point + draw_num)
	return true
end
--提取
function DoubleExp.Draw(player)
	if DoubleExp.DrawDoubleExp(player) then
		DoubleExp.GetData(player)
	end
end

--购买
function DoubleExp.Buy(player)
	if OneKeyBuy then
		if not OneKeyBuy.Main(player,{DoubleExp.Item, 1}) then
			sLuaApp:LuaErr("DoubleExp.Buy 快速购买未找到"..DoubleExp.Item)
		end
	end
end

--使用
function DoubleExp.on_pre_add_exp(role, value, sender, reason, detail)
	--sLuaApp:LuaErr("on_pre_add_exp  sender"..sender.." reason"..reason.." detail"..detail)
	for _,v in ipairs(DoubleExp.NeedAdd) do
		if v[1] == sender and v[2] == reason and v[3] == detail then
			local player_type = role:GetType()
			if player_type == GUID_PLAYER then
				local has_double_point = role:GetInt("DoubleExpPoint")
				if has_double_point > 0 then
					sLuaTimerSystem:AddTimerEx(role, 300 ,1,"DoubleExp.DelDoublePoint", "")
				else
					return value
				end
			elseif player_type == GUID_PET then
				local master = role:GetOwner()
				local has_double_point = master:GetInt("DoubleExpPoint")
				if has_double_point <= 0 then
					return value
				end
			else
				--sLuaApp:LuaErr("DoubleExp.on_pre_add_exp player 非宠物或玩家")
				return value
			end
			return value * 2
		end
	end
	return value
end
function DoubleExp.DelDoublePoint(player, timer, double_point)
	-- player:SetInt("DoubleExpPoint", tonumber(double_point))
	player:SetInt("DoubleExpPoint", player:GetInt("DoubleExpPoint") - 1)
end


-- --加入NeedAdd
-- function DoubleExp.NeedDouble(sender, reason, detail)
	-- if not DoubleExp.NeedAdd then
		-- DoubleExp.NeedAdd = {}
	-- end
	-- table.insert(DoubleExp.NeedAdd, {sender, reason, detail})
-- end