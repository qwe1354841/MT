--VIP
VipLogic={}

function VipLogic.VipGetData(player, version)
	VipLogic.VipButtonRefresh(player)
	if version == VipConfig.Version then return end
	if not VipConfig then return "" end

	local str=""
	if not VipConfig.send_tb['exp_mode'] then
		VipConfig.send_tb['exp_mode'] = VipExp.ExpMode or 1
	end
	if Lua_tools and VipConfig then
		str =str..[[
			if VipUI then
				VipUI.Version = "]]..VipConfig.Version..[["
				VipUI.ServerData = ]]..Lua_tools.serialize(VipConfig.send_tb)..[[
				VipUI.Refresh()
			end
		]]
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
	return ""
end

--VIP等级==>>nowtime 包括检查Congfig表
function VipLogic.GetGiftNowTime(level)
	if not VipConfig.main["vip"..level] then
		sLuaApp:NotifyTipsMsg(player, "会员等级错误")
		return ""
	end
	if not VipConfig.main["vip"..level]['lvup_exp'] then
		sLuaApp:NotifyTipsMsg(player, "缺少会员经验配置")
		return ""
	end
	local tb_GiftPer = VipConfig.main["vip"..level]['gift_Periodic']--gift_Periodic = {Item_list = {"筋斗云",5},Payment = "Daily"}
	if not tb_GiftPer then
		sLuaApp:NotifyTipsMsg(player, "缺少服务端配置")
		return ""
	end
	if not tb_GiftPer['Item_list'] then
		sLuaApp:NotifyTipsMsg(player, "缺少服务端配置")
		return ""
	end
	if not tb_GiftPer['Payment'] then
		sLuaApp:NotifyTipsMsg(player, "缺少服务端配置")
		return ""
	end
	if #tb_GiftPer['Item_list'] == 0 then
		sLuaApp:NotifyTipsMsg(player, "缺少服务端配置")
		return ""
	end
	
	local NowTime = 0
	if tb_GiftPer['Payment']  == "Daily" then 
		NowTime = sLuaApp:DaySinceEpoch(0)
	elseif tb_GiftPer['Payment']  == "Weekly" then 
		NowTime = sLuaApp:WeekSinceEpoch(0)
	elseif tb_GiftPer['Payment']  == "Monthly" then 
		NowTime = sLuaApp:MonthSinceEpoch(0)
	elseif tb_GiftPer['Payment']  == "Once" then 
		NowTime = 1
	end
	
	return NowTime
end

--判断并发送礼包
function VipLogic.OpenVIPGift(player, mode, gift_vip_level)		--	mode == 0 日常/周常礼包       mode == 1 升级礼包（等级）
	if not VipConfig or not mode or not gift_vip_level then return "" end
	gift_vip_level = tonumber(gift_vip_level)
	local Viplevel = player:GetAttr(ROLE_ATTR_VIP)
	if gift_vip_level > Viplevel then
		sLuaApp:NotifyTipsMsg(player, "VIP等级不足，无法购买")
		return ""
	end
	if mode == 0 then
		local VIPGift_NowTime = VipLogic.GetGiftNowTime(gift_vip_level)
		--sLuaApp:LuaDbg("VIPGift_NowTime"..VIPGift_NowTime)
		if VIPGift_NowTime == "" or VIPGift_NowTime == 0 then
			sLuaApp:NotifyTipsMsg(player, "服务器错误")
		end
		local Gifted = player:GetInt("VIPGift_LastTime"..gift_vip_level)
		if Gifted == VIPGift_NowTime then
			sLuaApp:NotifyTipsMsg(player, "您已经领取过该礼包")
		else
			local gift_config = VipConfig.main["vip"..gift_vip_level]['gift_Periodic']
			if not VipLogic.SubMoney(player, gift_config, gift_vip_level, mode) then return end
			local Gift = gift_config['Item_list']
			if  VipLogic.Traversal(player,Gift) then
				player:SetInt("VIPGift_LastTime"..gift_vip_level, VIPGift_NowTime)
				player:SetInt("VIPGift_Periodic"..gift_vip_level, 1)
				VipLogic.VipButtonRefresh(player)
				
			end
			
		end
	elseif mode == 1 then
		local GiftSign = player:GetInt("VIPGift_lvup"..gift_vip_level) 
		if GiftSign == 1 then
			sLuaApp:NotifyTipsMsg(player, "您已经领取过该礼包")
		else
			local gift_config = VipConfig.main["vip"..gift_vip_level]['gift_lvup']
			if not VipLogic.SubMoney(player, gift_config, gift_vip_level, mode) then return end
			local Gift = gift_config['Item_list']
			if  VipLogic.Traversal(player,Gift) then
				player:SetInt("VIPGift_lvup"..gift_vip_level, 1)
				VipLogic.VipButtonRefresh(player)
			end
		end
	end
	return 
end

function VipLogic.SubMoney(player, gift_config, vip_level, mode)
	local money_type = gift_config["MoneyType"]
	local money_val = gift_config["MoneyVal"]
	if money_type and money_val and money_val > 0 then
		if not Lua_tools.IsMoneyEnough(player, money_type, money_val) then
			--兑换货币
			if MoneyChange then
				local f_name = [[VipLogic.OpenVIPGift(player,]]..mode..[[,]]..vip_level..[[)]]
				MoneyChange.LackMoney(player, money_type, money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(money_type).."不足")
			end
			return false
		end
		-- 扣钱
		if Lua_tools.SubMoney(player, money_type, money_val, "system", "VIP", "购买VIP"..vip_level.."礼包") then
			return true
		else	
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(money_type).."不足")
			return false
		end
	else
		--sLuaApp:LuaErr(" VipConfig.main "..vip_level .." 价格配置错误")
		-- 缺少价格配置 或价格为0 表示免费 --周师傅说的
		return true
	end
	return false
end

--发送礼包
function VipLogic.Traversal(player, Gift)
	if not VipConfig then return "" end
	if Gift == "" then
		sLuaApp:NotifyTipsMsg(player, "礼物为空或配置错误")
		return false
	end
	
	if Lua_tools then
		Lua_tools.AddItem(player,Gift,"system","vip礼包","")
		sLuaApp:NotifyTipsMsg(player, "恭喜你成功获取礼包")
		return true
	end
	return false
end


--刷新vip领取按钮
function VipLogic.VipButtonRefresh(player)
	if not VipConfig then return "" end
	local Viplevel = player:GetAttr(ROLE_ATTR_VIP)
	
	local got_status = {}
	for i = 0, Viplevel do
		got_status[i] = {}
		got_status[i][1] = player:GetInt("VIPGift_lvup"..i)
		
		local Gifted = player:GetInt("VIPGift_LastTime"..i)
		local VIPGift_NowTime = VipLogic.GetGiftNowTime(i)
		if VIPGift_NowTime == "" or VIPGift_NowTime == 0 then
			sLuaApp:LuaErr("VipLogic VipButtonRefresh 服务器错误")
			return
		end
		local IsGiftTime = 1 --未领取 IsGiftTime=0
		if Gifted ~= VIPGift_NowTime then
			IsGiftTime = 0
		end
		got_status[i][2] = IsGiftTime
	end
	
	local str=""
	str = str..[[
		if VipUI then
			VipUI.IsGot = ]]..Lua_tools.serialize(got_status)..[[
			VipUI.GotRefresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
	return ""
end

--campain 活动标识 or 编号
--tar 福利类型-参与活动次数 or 奖励数值
--num -活动次数 or 数值
function VipLogic.GetVipEnhanced(player, campain, tar, num)
	if not VipConfig then return num end
	local Viplevel = player:GetAttr(ROLE_ATTR_VIP)
	if not VipConfig.main["vip"..Viplevel] then
		return num
	end
	local tb_wel = VipConfig.main["vip"..Viplevel]['welfare']
	if not tb_wel then
		return num
	end
	for k,v in pairs(tb_wel) do
		if campain == v['camp'] and tar == v['tar'] then
			if v['mod'] == "add" then
				return num + v['param']
			elseif v['mod'] == "multiply" then
				return math.floor(num * v['param'])
			end
		end
	end
	return num
end

--获取其他人的vip等级
function VipLogic.GetVipLevel(player, target_guid)
	local target_vip_level = sDBVarSystem:GetInt("SYSTEM_DATAPLUS_"..target_guid.."_VIPLevel")
	local str = [[
		if RoleInformationUI then
			RoleInformationUI.VIPLevel["]]..target_guid..[["] = ]].. target_vip_level..[[
			RoleInformationUI.UpdatePanelInfo()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end